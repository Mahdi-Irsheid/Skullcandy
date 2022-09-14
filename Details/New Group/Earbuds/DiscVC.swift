//
//  DiscVC.swift
//  Skullcandy
//
//  Created by Mahdi Fabio on 29/08/2022.
//

import UIKit

class DiscVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Storyboard.disc, for: indexPath)
        as! DiscCollectionViewCell
        cell.DiscImages.image = arr[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: DiscCollectionView.frame.width * 1.00, height: DiscCollectionView.frame.height * 1.00)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    

    @IBOutlet weak var DiscCollectionView: UICollectionView!
    @IBOutlet weak var ImageControl: UIPageControl!
    var timer: Timer?
    var currentCelIndex = 0
    
    struct cells{
        let name: String
        let price: String
    }
    
    let ImagesArr: [cells] = [
        cells(name:"Skullcandy Crusher ANC Wireless ",price: "Price: 100$" ),
        cells(name:"number two ",price: "Price: 100$" ),
        cells(name:"number three ",price: "Price: 100$" ),
        cells(name:"number four ",price: "Price: 100$" ),
        cells(name:"number 5 ",price: "Price: 100$" ),
        cells(name:"number 6 ",price: "Price: 100$" )
        ]
    let arr = [UIImage(named: "#e11")!, UIImage(named: "#e12")!, UIImage(named: "#e13")!, UIImage(named: "#e14")! ,UIImage(named: "#e15")!,UIImage(named: "#e16")!,UIImage(named: "#e17")!,UIImage(named: "#e18")!]
    override func viewDidLoad() {
        super.viewDidLoad()
        DiscCollectionView.delegate = self
        DiscCollectionView.dataSource = self
        ImageControl.numberOfPages = arr.count
        startTimer()

        // Do any additional setup after loading the view.
    }
    @IBAction func AddToCartDiscPressed(_ sender: Any) {
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
        DiscCollectionView.scrollToItem(at: IndexPath(item: currentCelIndex, section: 0), at: .centeredHorizontally, animated: true)
        ImageControl.currentPage = currentCelIndex
    }
}
