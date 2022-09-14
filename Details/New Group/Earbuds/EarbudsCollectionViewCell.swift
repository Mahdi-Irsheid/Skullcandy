//
//  EarbudsCollectionViewCell.swift
//  Skullcandy
//
//  Created by Mahdi Fabio on 29/08/2022.
//

import UIKit
import Kingfisher
import FirebaseFirestore
class EarbudsCollectionViewCell: UICollectionViewCell {
//    var ref: DocumentReference? = nil
//    var DB: Firestore!

    @IBOutlet weak var earbudsImageView: UIImageView!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Price: UILabel!
    @IBOutlet weak var Show: UIButton!
    let Id = ""

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var NameCell: UILabel!
    
    @IBOutlet weak var PriceCell: UILabel!
    
    
    func fillCell (name :String ,price :String)
        {
            NameCell.text = name
            PriceCell.text = price
        }
    @IBAction func ShowPressed(_ sender: Any) {
    }
    
}
