//
//  HeadphonesCollectionVC.swift
//  Skullcandy
//
//  Created by Mahdi Fabio on 29/08/2022.
//

import UIKit
import SwiftUI
import FirebaseFirestore
import FirebaseAuth
import FirebaseCore

class EarbudsCollectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var timer: Timer?
    var currentCelIndex = 0
    var name = "ppp"
    let arr = [UIImage(named: "#e11")!,UIImage(named: "#e12")!,UIImage(named: "#e13")!,UIImage(named: "#e14")!,UIImage(named: "#e15")!,UIImage(named: "#e16")!,UIImage(named: "#e17")!,UIImage(named: "#e18")!]
    
    var cellArray = [CellData]()
    
    
    @IBOutlet weak var ImageControle: UIPageControl!
    @IBOutlet weak var EarbudsImages: UICollectionView!
    var imageCartRecived: UIImage?
    @IBOutlet weak var lblNameDetail: UILabel!
    var nameCartRecived = "Name: "
    @IBOutlet weak var lblPriceDetails: UILabel!
    var priceCartRecived = "Price: "
    @IBOutlet weak var NOIDetails: UILabel!
    var id: String!
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
        }
        else {
            currentCelIndex = 0
        }
        EarbudsImages.scrollToItem(at: IndexPath(item: currentCelIndex, section: 0), at: .centeredHorizontally, animated: true)
        ImageControle.currentPage = currentCelIndex
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EarbudsImages", for: indexPath)
        as! EarbudsImagesCollectionViewCell
        cell.Images.image = arr[indexPath.row]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: EarbudsImages.frame.width * 1.00, height: EarbudsImages.frame.height * 1.00)
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
            let tabBar = storyboard.instantiateViewController(identifier: Constants.Storyboard.tabBar) as? TabBarViewController
            
            self.view.window?.rootViewController = tabBar
            self.view.window?.makeKeyAndVisible()
            
//            let cart = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "navScreenThree") as! UINavigationController
//            cart.modalPresentationStyle = .fullScreen
//            self.present(cart, animated: true)
        }
        return
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EarbudsImages.dataSource = self
        EarbudsImages.dataSource = self
        ImageControle.numberOfPages = arr.count
        startTimer()
        AddToCartButton.layer.cornerRadius = 25
        lblNameDetail.text = name
        //        EarbudsImages.image = imageCartRecived
        lblNameDetail.text = nameCartRecived
        lblPriceDetails.text = priceCartRecived
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        NOIStrepper.wraps = true
        NOIStrepper.autorepeat = true
        NOIStrepper.maximumValue = 10
        NOIStrepper.minimumValue = 1
        
    }
}
