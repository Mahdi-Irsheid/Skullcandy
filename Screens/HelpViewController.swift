//
//  HelpViewController.swift
//  Skullcandy
//
//  Created by Mahdi Fabio on 31/08/2022.
//

import UIKit

class HelpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    private func callNumber(number : String) {
        if let url = URL(string: "tel://\(number)"),
           UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    @IBAction func Here(_ sender: Any) {
        callNumber(number: "0797205067")

    }
    @IBAction func Help(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://info.skullcandy.com/Support?Dest=hc%2Fen-us%2Fcategories%2F360000831554-Product-Help-")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func Status(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://contact.skullcandy.com/orderlookup")! as URL, options: [:], completionHandler: nil)
    }
    
}
