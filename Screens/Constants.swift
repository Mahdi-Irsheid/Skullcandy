//
//  Constants.swift
//  Skullcandy
//
//  Created by Mahdi Fabio on 29/08/2022.
//

import Foundation
import UIKit
import SVProgressHUD
struct Constants {
    
    struct Storyboard {
        
        static let tabBar = "TabBar"
        static let Home = "Home"
        static let auth = "Authentication"
        static let Signup = "SignUp"
        static let CheckOutVC = "CheckOut"
        static let ecVC = "EarbudsVC"
        static let hcVC = "HeadphonesVC"
        static let disc = "discVC"
        static let DisctwoVC = "DisctwoVC"
        static let ScreenThree = "ScreenThreeViewController"

        
    }
    static func createAlertController(title: String, message: String) -> UIAlertController {
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           
           let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
               alert.dismiss(animated: true, completion: nil)
           }
           
           alert.addAction(okAction)
           
           return alert
       }
    static func styleFilledButton(_ button:UIButton) {
        button.backgroundColor = UIColor.init(red: 58/255, green: 88/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    struct  ItemName{
        let Name: String
        let ImageName: String
    }
    struct ItemsData{
        let name: String
        let price: String
        let image: UIImage
        
    }
    func showLoading() {
        SVProgressHUD.setBackgroundColor(UIColor.orange)
        SVProgressHUD.setForegroundColor(UIColor.white)
        SVProgressHUD.show()
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss()
    }
}
