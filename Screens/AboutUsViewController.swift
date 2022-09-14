//
//  AboutUsViewController.swift
//  Skullcandy
//
//  Created by Mahdi Fabio on 31/08/2022.
//

import UIKit

class AboutUsViewController: UIViewController {

    @IBOutlet weak var AboutUsTextView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
   
    @IBAction func AboutUsPressed(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.instagram.com/skullcandy/")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func About(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.skullcandy.com/inside-skullcandy")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func Warranty(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://info.skullcandy.com/Support?Dest=hc%2Fen-us%2Fcategories%2F360000554913-Warranty-Registration-")! as URL, options: [:], completionHandler: nil)
    }
}
