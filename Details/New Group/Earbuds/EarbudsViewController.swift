//
//  EarbudsViewController.swift
//  Skullcandy
//
//  Created by Mahdi Fabio on 29/08/2022.
//

import UIKit
import SwiftUI

class EarbudsViewController: UIViewController ,UISearchBarDelegate, UISearchControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var cellArray = [CellData]()
    let searchBar = UISearchController()
    @IBOutlet weak var EarbudsCollectionVC: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = EarbudsCollectionVC.dequeueReusableCell(withReuseIdentifier: "EarbudsCell", for: indexPath) as! EarbudsCollectionViewCell
        cell.earbudsImageView.image = UIImage(named: cellArray[indexPath.item].img)
        let commingData = cellArray[indexPath.row]
        cell.fillCell(name: "Name: \(commingData.Name)", price: "Price: \(commingData.Price)$")
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.gray.cgColor
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let VCViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.ecVC) as? EarbudsCollectionVC
        VCViewController?.imageCartRecived = UIImage(named: cellArray[indexPath.item].img)!
        VCViewController?.nameCartRecived = ("Name: \(cellArray[indexPath.item].Name)")
        VCViewController?.priceCartRecived = ("Price: \(cellArray[indexPath.item].Price)$")
        self.present(VCViewController!, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 200, height: 300)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 2, bottom: 1, right: 2)
    }
    func fillData () {
        let Earbud1 = CellData(id: "#e1", cName: "Push active true wireless earbuds", cImage: UIImage(named: "#e11")!, photo: "#e11", cPrice: "119")
        cellArray.append(Earbud1)
        let Earbud2 = CellData(id: "#e2",cName: "Grind the wireless earbuds", cImage: UIImage(named: "#e21")!, photo: "#e21", cPrice: "119")
        cellArray.append(Earbud2)
        let Earbud3 = CellData(id: "#e3",cName: "Dim 2 true wireless earbuds", cImage: UIImage(named: "#e31")!, photo: "#e31", cPrice: "129")
        cellArray.append(Earbud3)
        let Earbud4 = CellData(id: "#e4",cName: "Indy noise canceling true wireless", cImage: UIImage(named: "#e41")!, photo: "#e41", cPrice: "139")
        cellArray.append(Earbud4)
        let Earbud5 = CellData(id: "#e5",cName: "Set in-ear sport earbuds", cImage: UIImage(named: "#e51")!, photo: "#e51", cPrice: "149")
        cellArray.append(Earbud5)
        let Earbud6 = CellData(id: "#e6",cName: "Jib earbuds with microphone", cImage: UIImage(named: "#e61")!, photo: "#e61", cPrice: "159")
        cellArray.append(Earbud6)
        
    }
    override func viewDidLoad() {
        
        EarbudsCollectionVC.dataSource = self
        EarbudsCollectionVC.delegate = self
        fillData()

        EarbudsCollectionVC.collectionViewLayout = UICollectionViewFlowLayout()
        
        navigationItem.searchController = searchBar

        if traitCollection.userInterfaceStyle == .dark{
            navigationItem.searchController?.searchBar.tintColor = .white
        }
        else{
            navigationItem.searchController?.searchBar.tintColor = .black
        }
    }
}
