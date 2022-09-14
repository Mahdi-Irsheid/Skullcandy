//
//  CartData.swift
//  Skullcandy
//
//  Created by Mahdi Fabio on 29/08/2022.
//

import Foundation
import UIKit
class CartData {
    var CartName : String
    let CartImage : UIImage
    var CartPrice : String
    var CartNumber : String
    init(CName : String , CImage : UIImage , CPrice : String, CNum : String ) {
        CartName = CName
        CartImage = CImage
        CartPrice = CPrice
        CartNumber = CNum
    }
   
}
