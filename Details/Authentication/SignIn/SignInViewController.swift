//
//  SignInViewController.swift
//  Skullcandy
//
//  Created by Mahdi Fabio on 29/08/2022.
//

import UIKit
import Firebase
import FirebaseAuth
import SVProgressHUD
class SignInViewController: UIViewController {

    @IBOutlet weak var EmailUserTextField: UITextField!
    
    @IBOutlet weak var PasswordUserTextField: UITextField!
    
    @IBOutlet weak var SignInButton: UIButton!
    
    @IBOutlet weak var ErrorLable: UILabel!
    @IBOutlet weak var forgetPassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SignInButton.layer.cornerRadius = 25
        
        setupTest()

    }
    
    private func setupTest(){
        EmailUserTextField.text = "fabio@gmail.com"
        PasswordUserTextField.text = "fabio123"
        PasswordUserTextField.isSecureTextEntry = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = .white
    }
    
    func setUpElements() {
        
        // Hide the error label
        // Style the elements
//        Utilities.styleTextField(emailTextField)
//        Utilities.styleTextField(passwordTextField)
//        Utilities.styleFilledButton(loginButton)
        
    }
    func validateFields() ->String?{
        if EmailUserTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            PasswordUserTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill in all fields.".Localized()

        }
        
        return  nil
    }
    
    @IBAction func forgetPasswordPressed(_ sender: Any) {

    }
    func showLoading() {
        SVProgressHUD.setBackgroundColor(UIColor.orange)
        SVProgressHUD.setForegroundColor(UIColor.red)
        SVProgressHUD.show()
        
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss()
    }
    @IBAction func SignInPressed(_ sender: Any) {
        loginUser()
    }
    private func loginUser() {
        let email = EmailUserTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = PasswordUserTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      
        self.showSpinner(onView: self.view)
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            self.removeSpinner()
            if error != nil{
                let alert = Constants.createAlertController(title: "Error".Localized(), message: "There's something wrong with the fields, try to fill in the fields correctly.".Localized())
                self.present(alert, animated: true, completion: nil)
                return
            }
            else {
                let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
                let tabBar = storyboard.instantiateViewController(identifier: Constants.Storyboard.tabBar) as? TabBarViewController
                
                self.view.window?.rootViewController = tabBar
                self.view.window?.makeKeyAndVisible()
            }
        }
        
    }

    @IBAction func backToMainPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let Home = storyboard.instantiateViewController(identifier: Constants.Storyboard.Home) as? ViewController

        self.view.window?.rootViewController = Home
        self.view.window?.makeKeyAndVisible()
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
extension String {
    func Localized() -> String {
        return NSLocalizedString(self,
                                  tableName: "Localizable",
                                  bundle: .main,
                                  value: self ,
                                  comment: self)
    }
}
