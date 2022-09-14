//
//  ScreenFourViewController.swift
//  Skullcandy
//
//  Created by Mahdi Fabio on 29/08/2022.
//

import UIKit
import Firebase
import FirebaseAuth
import Sheeeeeeeeet
import SwiftUI
import CoreMedia
import MOLH
class ScreenFourViewController: UIViewController {
    @IBOutlet weak var SignOut: UIButton!
    
    @IBOutlet weak var lblLanguage: UIButton!
    @IBOutlet weak var lblUserName: UILabel!
    
    @IBAction func LogOutPressed(_ sender: Any) {

        try! FirebaseAuth.Auth.auth().signOut()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let Home = storyboard.instantiateViewController(identifier: Constants.Storyboard.Home) as? ViewController

        self.view.window?.rootViewController = Home
        self.view.window?.makeKeyAndVisible()
    }
    
    @IBAction func ChangeLanguage(_ sender: Any) {
        presentActionSheet()
//        let alert = Constants.createAlertController(title: "Comming Soon", message: "There's something wrong, or there is no time to do this feature right now, this will be a future update soon.")
//        self.present(alert, animated: true, completion: nil)
        return    }
    
    @IBAction func SwitchButtonPressed(_ sender: Any) {
        let alert = Constants.createAlertController(title: "Comming Soon".Localized(), message: "There's something wrong, or there is no time to do this feature right now, this will be a future update soon.".Localized())
        self.present(alert, animated: true, completion: nil)
        return
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        SignOut.layer.cornerRadius = 25
        if Locale.current.languageCode == "ar"
        {
            lblLanguage.setTitle("Change to English".Localized(), for: .normal)

        }else {
            lblLanguage.setTitle("التغيير إلى اللغة العربية".Localized(), for: .normal)

        }
        
        getUserName()
        if traitCollection.userInterfaceStyle == .dark{
            navigationItem.searchController?.searchBar.tintColor = .white
        }
        else{
            navigationItem.searchController?.searchBar.tintColor = .black
        }
    }
 
//    func PresentAlert(){
//        let alert = UIAlertController(title: "Language", message: "Change application language?", preferredStyle: .alert)
//        let passAction = UIAlertAction(title: "La", style: .destructive, handler: nil) { (_) in
//
//        }
//        let destructiveAction = UIAlertAction(title: "hi", style: .destructive, handler: nil)
//        alert.addAction(passAction)
//        alert.addAction(destructiveAction)
//
//        present( alert, animated: true ,completion: nil)
//
//    }
    func presentActionSheet(){
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let passAction = UIAlertAction(title: "Change".Localized(), style: .default) { (_) in
            
            let currentLang = Locale.current.languageCode
            print ("currentLang: \(currentLang)")
            let newLanguage = currentLang == "en" ? "ar" : "en"
            UserDefaults.standard.setValue([newLanguage], forKey: "AppleLanguages")
            //message lable
            let alert = Constants.createAlertController(title: "Warrning".Localized(), message: "The application will shutt down after 5 seconds, please open the application again.".Localized())
            self.present(alert, animated: true, completion: nil)
            
            let timer = 5.0
            
            DispatchQueue.main.asyncAfter(deadline: .now() + timer) {
                exit(0)
//                let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
//                let tabBar = storyboard.instantiateViewController(identifier: Constants.Storyboard.tabBar) as? TabBarViewController
//
//                self.view.window?.rootViewController = tabBar
//                self.view.window?.makeKeyAndVisible()
                
            }
        }
        
            
        
        let cancle = UIAlertAction(title: "Cancle".Localized(), style: .cancel, handler: nil)
        actionSheet.addAction(passAction)
        actionSheet.addAction(cancle)
    
        present( actionSheet, animated: true ,completion: nil)
    }
    
    func getUserName(){
        let db = Firestore.firestore()
        let email = Auth.auth().currentUser?.email
        db.collection("users").addSnapshotListener { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let username = document.get("Email") as? String
                    if (username == email) {
                        self.lblUserName.text = document.get("Name") as? String

                    }
                }
            }
        }
    }
    
    var vSpinner : UIView?

    func showSpinner(onView : UIView) {
        
        let spinnerView = UIView.init(frame: onView.bounds)

        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        vSpinner = spinnerView
    }

    func removeSpinner() {
        
        DispatchQueue.main.async {
            self.vSpinner?.removeFromSuperview()
            self.vSpinner = nil
        }
    }
}

