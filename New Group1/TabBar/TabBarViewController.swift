//
//  TabBarViewController.swift
//  Skullcandy
//
//  Created by Mahdi Fabio on 29/08/2022.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
//    @IBInspectable var initialIndex: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.delegate = self
//        selectedIndex = initialIndex
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 14),
                                                          NSAttributedString.Key.foregroundColor: UIColor.init(named: "Dark")], for: .normal)
        self.tabBarItem.badgeColor = .red
        self.tabBar.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            
        
        
        
        
        func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.navigationBar.tintColor = .red
            
        }

//        let tabBarVC = UITabBarController()
////
//
//
//        let vc1: UIViewController = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ScreenOneViewController")
//
//
//        let vc2 = UINavigationController(rootViewController: UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ScreenTwoViewController") )
//        let vc3 = UINavigationController(rootViewController: UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ScreenThreeViewController") )
//        let vc4 = UINavigationController(rootViewController: UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "ScreenFourViewController") )
//
//        let vc1Item = UITabBarItem(title: "Offers", image: UIImage(systemName: "seal"), tag: 1)
//
//        vc1.tabBarItem = vc1Item
//
//        tabBarVC.setViewControllers([vc1, vc2, vc3, vc4], animated: false)
//
//        tabBarVC.modalPresentationStyle = .fullScreen
//        present(tabBarVC, animated: true)
//
//        UINavigationControllerUIStoryboard(name: "TabBar", Bundle: nil).instantiateInitialViewController()
//        vc1.title = "Shop"
//        vc2.title = "Favourite"
//        vc3.title = "Cart"
//        vc4.title = "Settings"

        
    }
    override func tabBar(_ tabBar: UITabBar,didSelect item: UITabBarItem){
        self.SimpleAnnimationWhenSelectItem(item)
        

    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.tabBar.tintColor = .white
//        changeUnSelectedColor()
//    }
    
    
  
    
    func ChangeRadiusOfTabbar(){

            self.tabBar.layer.masksToBounds = true
            self.tabBar.isTranslucent = true
            self.tabBar.layer.cornerRadius = 30
            self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

           }
    func changeUnSelectedColor(){
        
            self.tabBar.unselectedItemTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
           }
//    func ChangeHeightOfTabbar(){
//
//           if UIDevice().userInterfaceIdiom == .phone {
//               var tabFrame            = tabBar.frame
//               tabFrame.size.height    = 80
//               tabFrame.origin.y       = view.frame.size.height - 80
//               tabBar.frame            = tabFrame
//
//           }
//          }
func SimpleAnnimationWhenSelectItem(_ item: UITabBarItem){
        guard let barItemView = item.value(forKey: "view") as? UIView else { return }

        let timeInterval: TimeInterval = 0.2
        let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.3) {
            barItemView.transform = CGAffineTransform.identity.scaledBy(x: 1.1, y: 1.1)
        }
        propertyAnimator.addAnimations({ barItemView.transform = .identity }, delayFactor: CGFloat(timeInterval))
        propertyAnimator.startAnimation()
       }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        ChangeHeightOfTabbar()
        changeUnSelectedColor()
        ChangeRadiusOfTabbar()
    }
}
