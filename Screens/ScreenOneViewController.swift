//
//  ScreenOneViewController.swift
//  Skullcandy
//
//  Created by Mahdi Fabio on 29/08/2022.
//

import UIKit
import SwiftUI
//import Firebase
//import FirebaseFirestore

class ScreenOneViewController: UIViewController ,UISearchBarDelegate, UISearchControllerDelegate {
let searchBar = UISearchController()
//    var ref = DatabaseReference?.self
//    var DB: Firestore!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        navigationItem.searchController = searchBar
        
        if traitCollection.userInterfaceStyle == .dark{
            navigationItem.searchController?.searchBar.tintColor = .white
        }
        else{
            navigationItem.searchController?.searchBar.tintColor = .black
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if traitCollection.userInterfaceStyle == .dark{
            navigationController?.navigationBar.tintColor = .white        }
        else{
            navigationController?.navigationBar.tintColor = .black
        }
        
//        navigationController?.navigationBar.tintColor = .gray
//        navigationController?.navigationBar.tintAdjustmentMode = .init(rawValue: 30)!
    }
    
    @IBAction func EarbudsWirelessPressed(_ sender: Any) {
//        self.GetAllFireData()
//        DB.collection("eabuds").getDocuments(){(querySnapshot, err ) in
//            if let Err = err{
//                print("Error: \(Err.localizedDescription ) ")
//            }
//            else
//            {
//                for dock in querySnapshot!.documents{
//                }
//
//            }
//        }
    }
    
    @IBAction func nextPessed(){
//        let vc = UIViewController()
//        vc.view.backgroundColor = .red
//        navigationController?.pushViewController(vc, animated: true)
    }
    
}
