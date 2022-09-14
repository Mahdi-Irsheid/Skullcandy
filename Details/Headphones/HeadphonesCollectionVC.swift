//
//  HeadphonesCollectionVC.swift
//  Skullcandy
//
//  Created by Mahdi Fabio on 29/08/2022.
//

import UIKit
import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseCore
class HeadphonesCollectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var timer: Timer?
    var currentCelIndex = 0
    
    let arr = [UIImage(named: "#h16")!, UIImage(named: "#h12")!, UIImage(named: "#h23")!, UIImage(named: "#h14")! ,UIImage(named: "#h15")!,UIImage(named: "#h11")!]
    
    @IBOutlet weak var ImageControle: UIPageControl!
    @IBOutlet weak var HeadphonesImages: UICollectionView!
    
    var imageCartRecived = UIImage()
    @IBOutlet weak var lblNameDetail: UILabel!
    var nameCartRecived = "Name: "
    @IBOutlet weak var lblPriceDetails: UILabel!
    var priceCartRecived = "Price: "
    @IBOutlet weak var NOIDetails: UILabel!
    
    @IBOutlet weak var NOIStrepper: UIStepper!
    
    @IBOutlet weak var lblNOI: UILabel!
    
    @IBOutlet weak var AddToCartButton: UIButton!
    
    
    @IBAction func NOISrepperPressed(_ sender: UIStepper) {
        lblNOI.text = Int(sender.value).description
        
    }
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(moveNext), userInfo: nil, repeats: true)
    }
    @objc func moveNext(){
        if currentCelIndex < arr.count - 1{
            currentCelIndex += 1
            HeadphonesImages.scrollToItem(at: IndexPath(item: currentCelIndex, section: 0), at: .centeredHorizontally, animated: true)
            ImageControle.currentPage = currentCelIndex
        }
        else {
            currentCelIndex = 0
        }
        HeadphonesImages.scrollToItem(at: IndexPath(item: currentCelIndex, section: 0), at: .centeredHorizontally, animated: true)
        ImageControle.currentPage = currentCelIndex
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeadphonesImages", for: indexPath)
        as! HeadphonesImagesCollectionViewCell
        cell.HeadphonesImages.image = arr[indexPath.row]
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: HeadphonesImages.frame.width * 1.00, height: HeadphonesImages.frame.height * 1.00)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    @IBAction func AddToCartPessed(_ sender: UIButton) {
        let random = Int(arc4random_uniform(999999) + 1)
        let db = Firestore.firestore()
        db.collection("cart").addDocument(data: [
            "Name" : "\(lblNameDetail.text ?? "")",
            "Number": "\(lblNOI?.text ?? "")",
            "Id": "\(random) ",
            "Price" : "\(lblPriceDetails.text ?? "")"
        ])
        { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!".Localized())
            }
        }
        let alert = Constants.createAlertController(title: "Success".Localized(), message: "This item added to your cart successfully.".Localized())
        self.present(alert, animated: true, completion: nil)
        
        let timer = 3.0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timer) {
            // code to execute after 1 second
            let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
            let checkOut = storyboard.instantiateViewController(identifier: Constants.Storyboard.tabBar) as? TabBarViewController
            
            self.view.window?.rootViewController = checkOut
            self.view.window?.makeKeyAndVisible()
        }
        return
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AddToCartButton.layer.cornerRadius = 25
        HeadphonesImages.dataSource = self
        HeadphonesImages.dataSource = self
        ImageControle.numberOfPages = arr.count
        startTimer()
        //        EarbudsImages.image = imageCartRecived
        lblNameDetail.text = nameCartRecived
        lblPriceDetails.text = priceCartRecived
        
        NOIStrepper.wraps = true
        NOIStrepper.autorepeat = true
        NOIStrepper.maximumValue = 10
        NOIStrepper.minimumValue = 1
    }
}
