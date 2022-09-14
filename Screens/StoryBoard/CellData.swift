//
//  CellData.swift
//  Skullcandy
//
//  Created by Mahdi Fabio on 29/08/2022.
//

import Foundation
import UIKit
class CellData {
    let Id: String
    let Name : String
    let Image : UIImage
    let img : String
    let Price : String
    
    init(id: String ,cName : String , cImage : UIImage ,photo: String, cPrice : String ) {
        Id = id
        Name = cName
        Image = cImage
        img = photo
        Price = cPrice
        
    }
   
}
