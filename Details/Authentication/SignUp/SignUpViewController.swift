//
//  SignUpViewController.swift
//  Skullcandy
//
//  Created by Mahdi Fabio on 29/08/2022.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var NameUserTextField: UITextField!
    @IBOutlet weak var EmailUserTextField: UITextField!
    @IBOutlet weak var PasswordUserTextField: UITextField!
    @IBOutlet weak var CompleteSignUpButton: UIButton!
    
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CompleteSignUpButton.layer.cornerRadius = 25
        NameUserTextField.text = name
//        NameUserTextField.layer.borderWidth = 1
//        NameUserTextField.layer.borderColor = UIColor.init(named: "NotDark") as! CGColor

//        FirebaseApp.configure()
    }
    func validateFields() -> String? {

        if NameUserTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            EmailUserTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            PasswordUserTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill in all fields.".Localized()

        }
        
        return  nil
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = .white
    }
    
    @IBAction func SubmetSignUpButton(_ sender: Any) {
        let error = validateFields()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
            let alert = Constants.createAlertController(title: "Error".Localized(), message: "There's something wrong with the fields, try to fill in the fields correctly.".Localized())
            self.present(alert, animated: true, completion: nil)
            return
        }
        else {
            
            // Create cleaned versions of the data
            let Name = NameUserTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = EmailUserTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = PasswordUserTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            self.showSpinner(onView: self.view)
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                self.removeSpinner()
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                    let alert = Constants.createAlertController(title: "Error".Localized(), message: "Error creating user.".Localized())
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                else {
                    
                    // User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data:
                    ["Email":"\(email)",
                     "Name":"\(Name)",
                     "Id": "\(result!.user.uid)"
                    ]) { (error) in
                        
                        if error != nil {
                            // Show error message
                            let alert = Constants.createAlertController(title: "Error".Localized(), message: "Error saving user data.".Localized())
                            self.present(alert, animated: true, completion: nil)
                            return
                        }
                    }
                }
                    // Transition to the home screen
                    self.transitionToHome()
                }
    }
    }
//    func showError(_ message:String) {
//
//        ErrorLable.text = message
//        ErrorLable.alpha = 1
//    }
    func transitionToHome() {
        
        let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
        let tabBar = storyboard.instantiateViewController(identifier: Constants.Storyboard.tabBar) as? TabBarViewController

        view.window?.rootViewController = tabBar
        view.window?.makeKeyAndVisible()
        


//        if let vc = UIStoryboard.init(name: "HomeScreen", bundle: nil).instantiateViewController(identifier: "HomeVC") as? HomeScreenViewController {
//            vc.modalPresentationStyle = .fullScreen
//            present(vc, animated: true, completion: nil)
//        }
//
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
