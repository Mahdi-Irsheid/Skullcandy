//
//  CartTableViewCell.swift
//  Skullcandy
//
//  Created by Mahdi Fabio on 29/08/2022.
//

import UIKit
import FirebaseAuth
import Firebase
class CartTableViewCell: UITableViewCell {

        @IBOutlet weak var cartImage: UIImageView!
        @IBOutlet weak var lblName: UILabel!
        @IBOutlet weak var lblDescription: UILabel!
        @IBOutlet weak var lblPrice: UILabel!
    var onDeletePressed : (() -> Void)? = nil

    
    func fillCell (photo : UIImage , name :String ,price :String, desc: String)
    {
        cartImage.image = photo
        lblName.text = name
        lblPrice.text = price
        lblDescription.text = desc
        
    }
    //delete func after gym
    
    
    @IBAction func deletePressed(_ sender: Any) {
        
        let db = Firestore.firestore()
//        let documentId = db.collection("cart").document().documentID
        Firestore.firestore().collection("cart").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID)")
                    db.collection("cart").document("\(document.documentID)").delete(){
                        err in if let err = err{
                            print("Cart data was not deleted.\(err)")
                        }else{
                            print("Cart data deleted succesfully.")
                            
                        }
                    }
                }
            }
        }
        
        if let onDeletePressed = self.onDeletePressed {
            
            onDeletePressed()
        }
    }

}
