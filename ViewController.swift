//
//  ViewController.swift
//  Skullcandy
//
//  Created by Mahdi Fabio on 29/08/2022.
//

import UIKit
import Firebase
import FirebaseCore
import Lottie

class ViewController: UIViewController {
    let animationView = AnimationView()

    @IBOutlet weak var configLable: UILabel!
    @IBOutlet weak var SignUpBotton: UIButton!
    
    @IBOutlet weak var SignInButton: UIButton!
    
    @IBOutlet weak var rcLable: UILabel!
    
    @IBOutlet weak var Lottie_view: UIView!
    
    override func viewDidLoad() {
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        super.viewDidLoad()
        SignUpBotton.layer.cornerRadius = 25
        SignInButton.layer.cornerRadius = 25
        setupRemoteConfigDefaults()
        displayNewValues()
        fetchRemoteConfig()
    }
    @IBAction func SignUpPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        let Signup = storyboard.instantiateViewController(identifier: Constants.Storyboard.Signup) as? SignUpViewController

        self.view.window?.rootViewController = Signup
        self.view.window?.makeKeyAndVisible()
    }
    @IBAction func SignInPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Authentication", bundle: nil)
        let auth = storyboard.instantiateViewController(identifier: Constants.Storyboard.auth) as? SignInViewController

        self.view.window?.rootViewController = auth
        self.view.window?.makeKeyAndVisible()
    }
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          setupAnimation()

      }

      private func setupAnimation() {
          animationView.animation = Animation.named("listening-music")
          animationView.frame = Lottie_view.bounds
          animationView.animationSpeed = 0.9
          animationView.contentMode = .scaleAspectFit
          animationView.loopMode = .loop
          animationView.play()
          Lottie_view.addSubview(animationView)
      }
    func setupRemoteConfigDefaults() {
        let defaultValue = ["lable_text": "Skullcandy" as NSObject]
    remoteConfig.setDefaults(defaultValue)
    }
    
    
    func fetchRemoteConfig(){
    remoteConfig.fetch(withExpirationDuration: 0) { [unowned self] (status, error) in
    guard error == nil else { return }
    print("Got the value from Remote Config!")
    remoteConfig.activate()
        self.displayNewValues()
    }}
    func displayNewValues(){
        let currentLang = Locale.current.languageCode

        let newLabelText = remoteConfig.configValue(forKey: "lable_text".Localized()).stringValue ?? ""
        let newLabelTextAr = remoteConfig.configValue(forKey: "lable_text_ar".Localized()).stringValue ?? ""
        if currentLang == "ar"{
            configLable.text = newLabelTextAr
        }else{
        configLable.text = newLabelText
    }
    }
}
    
