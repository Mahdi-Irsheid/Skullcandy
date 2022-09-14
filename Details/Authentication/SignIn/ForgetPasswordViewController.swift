//
//  ForgetPasswordViewController.swift
//  Skullcandy
//
//  Created by Mahdi Fabio on 29/08/2022.
//

import UIKit
import Firebase
import FirebaseAuth
import SwiftUI
class forgetPasswordViewController: UIViewController {
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var sendForgottenPassword: UIButton!
    @IBOutlet weak var errorLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func validateFields() ->String?{
        if EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill in all fields.".Localized()

        }
        
        return  nil
    }
    @IBAction func sendForgottenPasswordPressed(_ sender: Any) {
        let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        self.showSpinner(onView: self.view)
        Auth.auth().sendPasswordReset(withEmail: email) {error in
            self.removeSpinner()
            if error != nil{
                let alert = Constants.createAlertController(title: "Error".Localized(), message: "There was an error in email field, check your email spilling, or this email does'nt exist.".Localized())
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            let alert = Constants.createAlertController(title: "Success".Localized(), message: "A password reset email has been sent to your email.".Localized())
            
//            alert.addAction(UIAlertAction(title: "hp".Localized(), style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
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


