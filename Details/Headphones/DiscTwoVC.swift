//
//  DiscVC.swift
//  Skullcandy
//
//  Created by Mahdi Fabio on 29/08/2022.
//

import UIKit

class DiscTwoVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DisctwoVC", for: indexPath)
        as! DiscTwoCollectionViewCell
        cell.DiscTwoImages.image = arr[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: DiscTwoCollectionView.frame.width * 1.00, height: DiscTwoCollectionView.frame.height * 1.00)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
  
    @IBOutlet weak var ImageControlTwo: UIPageControl!

    @IBOutlet weak var DiscTwoCollectionView: UICollectionView!
    
    var timer: Timer?
    var currentCelIndex = 0
    
    struct cells{
        let name: String
        let price: String
    }
    
//    let ImagesArr: [cells] = [
//        cells(name:"Skullcandy Crusher ANC Wireless ",price: "Price: 100$" ),
//        cells(name:"number two ",price: "Price: 100$" ),
//        cells(name:"number three ",price: "Price: 100$" ),
//        cells(name:"number four ",price: "Price: 100$" ),
//        cells(name:"number 5 ",price: "Price: 100$" ),
//        cells(name:"number 6 ",price: "Price: 100$" )
//        ]
    let arr = [UIImage(named: "#h21")!, UIImage(named: "#h22")!, UIImage(named: "#h23")!, UIImage(named: "#h24")! ,UIImage(named: "#h25")!,UIImage(named: "#h26")!]
    
override func viewDidLoad() {
    super.viewDidLoad()
    DiscTwoCollectionView.delegate = self
    DiscTwoCollectionView.dataSource = self
    ImageControlTwo.numberOfPages = arr.count
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
        DiscTwoCollectionView.scrollToItem(at: IndexPath(item: currentCelIndex, section: 0), at: .centeredHorizontally, animated: true)
        ImageControlTwo.currentPage = currentCelIndex
    }
}
