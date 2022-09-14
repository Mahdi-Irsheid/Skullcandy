//
//  HadphonesCollectionViewCell.swift
//  Skullcandy
//
//  Created by Mahdi Fabio on 29/08/2022.
//

import UIKit
import Kingfisher
import FirebaseFirestore
class HeadphonesCollectionViewCell: UICollectionViewCell {
@IBOutlet weak var HeadphonesImageView: UIImageView!
@IBOutlet weak var Name: UILabel!
@IBOutlet weak var Price: UILabel!
@IBOutlet weak var Favourit: UIButton!

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
}
