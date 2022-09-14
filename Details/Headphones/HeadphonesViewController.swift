//
//  HeadphonesViewController.swift
//  Skullcandy
//
//  Created by Mahdi Fabio on 29/08/2022.
//

import UIKit
let searchBar = UISearchController()
class HeadphonesViewController: UIViewController ,UISearchBarDelegate, UISearchControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    var cellArray = [CellData]()

    let searchBar = UISearchController()

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = HeadphonesCollectionVC.dequeueReusableCell(withReuseIdentifier: "HeadphonesCell", for: indexPath) as! HeadphonesCollectionViewCell
        cell.HeadphonesImageView.image = UIImage(named: cellArray[indexPath.row].img)
        let commingData = cellArray[indexPath.row]
        cell.fillCell(name: commingData.Name, price: commingData.Price)
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.gray.cgColor
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let VCViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.hcVC) as? HeadphonesCollectionVC
       
        VCViewController?.imageCartRecived = UIImage(named: cellArray[indexPath.row].img)!
        VCViewController?.nameCartRecived = ("Name:\(cellArray[indexPath.row].Name)")
        VCViewController?.priceCartRecived = ("\(cellArray[indexPath.row].Price)")
        self.present(VCViewController!, animated: true, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 200, height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 2, bottom: 1, right: 2)
    }
    @IBOutlet weak var HeadphonesCollectionVC: UICollectionView!
    func fillData () {
        let Headphones1 = CellData(id: "#h1", cName: " Crusher evo sensory bass headphones ", cImage: UIImage(named: "#h16")!, photo: "#h16", cPrice: "Price: 139$")
        cellArray.append(Headphones1)
        let Headphones2 = CellData(id: "#h2",cName: " Crusher anc personalized noise canceling wireless ", cImage: UIImage(named: "#h21")!, photo: "#h21", cPrice: "Price: 129$")
        cellArray.append(Headphones2)
        let Headphones3 = CellData(id: "#h3",cName: " Hesh anc noise canceling wireless", cImage: UIImage(named: "#h31")!, photo: "#h31", cPrice: "Price: 99$")
        cellArray.append(Headphones3)
        let Headphones4 = CellData(id: "#h4",cName: " Transparency hesh evo wireless headphone", cImage: UIImage(named: "#h41")!, photo: "#h41", cPrice: "Price: 139$")
        cellArray.append(Headphones4)
        let Headphones5 = CellData(id: "#h5",cName: " Cassette junior volume limited wired ", cImage: UIImage(named: "#h51")!, photo: "#h51", cPrice: "Price: 79$")
        cellArray.append(Headphones5)
        let Headphones6 = CellData(id: "#h6",cName: " Cassette wireless on-ear headphones", cImage: UIImage(named: "#h61")!, photo: "#h61", cPrice: "Price: 89$")
        cellArray.append(Headphones6)
        
    }

    override func viewDidLoad() {

        HeadphonesCollectionVC.dataSource = self
        HeadphonesCollectionVC.delegate = self
        HeadphonesCollectionVC.collectionViewLayout = UICollectionViewFlowLayout()
        fillData()
        navigationItem.searchController = searchBar
        
        if traitCollection.userInterfaceStyle == .dark{
            navigationItem.searchController?.searchBar.tintColor = .white
        }
        else{
            navigationItem.searchController?.searchBar.tintColor = .black
        }
        


    }
}
