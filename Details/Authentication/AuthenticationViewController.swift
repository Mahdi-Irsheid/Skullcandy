//
//  AuthenticationViewController.swift
//  Skullcandy
//
//  Created by Mahdi Fabio on 29/08/2022.
//

import UIKit

class AuthenticationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem.title = "Authentication"
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignInPressed(_ sender: Any) {
        let tabBarVC = UITabBarController()
        let vc1 = UINavigationController(rootViewController: UIStoryboard(name: "Screens", bundle: nil).instantiateViewController(withIdentifier: "ScreenOneViewController") )
        let vc2 = UINavigationController(rootViewController: UIStoryboard(name: "Screens", bundle: nil).instantiateViewController(withIdentifier: "ScreenTwoViewController") )
        let vc3 = UINavigationController(rootViewController: UIStoryboard(name: "Screens", bundle: nil).instantiateViewController(withIdentifier: "ScreenThreeViewController") )
        let vc4 = UINavigationController(rootViewController: UIStoryboard(name: "Screens", bundle: nil).instantiateViewController(withIdentifier: "ScreenFourViewController") )
        
        tabBarVC.setViewControllers([vc1,vc2,vc3,vc4], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
      
    }
    
    @IBAction func BackToMainPressed(_ sender: Any) {
    }
    

}

