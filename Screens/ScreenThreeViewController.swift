//
//  ScreenThreeViewController.swift
//  Skullcandy
//
//  Created by Mahdi Fabio on 29/08/2022.
//

import UIKit
import StoreKit
import FirebaseAuth
import FirebaseFirestore
import SwiftUI

class ScreenThreeViewController: UIViewController, UITableViewDataSource ,UITableViewDelegate, SKProductsRequestDelegate, SKPaymentTransactionObserver{
    
    @IBOutlet weak var CkeckOutViewGrey: UIView!
    enum Product: String , CaseIterable
    {
        case gems = "FABIO.Skullcandy.Gems"
    }
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if let oProduct = response.products.first{
            print("Product is available!")
            self.purchase(aproduct: oProduct)
        }
        else{
            print("Product is not available!")
        }
    }
    func purchase(aproduct: SKProduct){
        let payment = SKPayment(product: aproduct)
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().add(payment)

    }
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState{
            case .purchasing:
                print("Coustomeer in the process!")
            case .purchased:
                SKPaymentQueue.default().finishTransaction(transaction)
                print("Product purchased!")
            case .failed:
                print("Fail!")
            case .restored:
                print("Restore!")
            case .deferred:
                print("Deferred!")
            default: break
                SKPaymentQueue.default().finishTransaction(transaction)
            }

        }
    }
    
    var titleItem: String?
    var priceItem: String?
    var image: UIImage?
    var cartItems = [CartData]()
    var cartItem: CartData?
    
    @IBOutlet weak var ProductName: UILabel!
    @IBOutlet weak var ProductPrice: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var CheckOut: UIButton!
    
    var cellArray = [CellData]()
    var arr = [cells]()
    struct cells{
        let cellName: String
        let cellPrice: String
        let discription: String
        let photo: UIImage
    }
    var imageCartRecived = UIImage()
    var nameCartRecived = "what"
    var priceCartRecived = "$"
    var descCartRecived = "hi"

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func addFirebaseItemData() {
        let db = Firestore.firestore()
        db.collection("cart").addSnapshotListener { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self.arr.removeAll()
                for document in querySnapshot!.documents
                {
                    let ID = document.get("Id") as? String
                    let docName = document.get("Name") as? String
                    let docPrice = document.get("Price") as? String
                    let docDesc = document.get("Number") as? String
                    let Data = cells(cellName: docName!, cellPrice: docPrice!, discription: docDesc!, photo: UIImage(named: "#e12")!)
                    self.arr.removeAll()
                    self.arr.append(Data)
                    self.cartTableView.reloadData()
                }
                
            }
            
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartTableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        cell.fillCell(photo: UIImage(named: "#e11")!, name: cell.lblName.text!, price: cell.lblPrice.text!, desc: cell.lblDescription.text!)

        cell.lblName.text = arr[indexPath.row].cellName
        cell.lblPrice.text = arr[indexPath.row].cellPrice
        cell.lblDescription.text = arr[indexPath.row].discription
        ProductName.text = cell.lblName.text
        ProductPrice.text = cell.lblPrice.text
        Description.text = cell.lblDescription.text
        cell.onDeletePressed = {
            self.arr.remove(at: indexPath.row)
            self.cartTableView.deleteRows(at: [indexPath], with: .top)
            self.cartTableView.reloadData()
            self.ProductName.text = ""
            self.ProductPrice.text = ""
            self.Description.text = ""
        }

        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    @IBOutlet weak var cartTableView: UITableView!
    
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarItem.badgeValue = nil
        
        if traitCollection.userInterfaceStyle == .dark{
            navigationController?.navigationBar.tintColor = .white        }
        else{
            navigationController?.navigationBar.tintColor = .black
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addFirebaseItemData()
        CkeckOutViewGrey.layer.cornerRadius = 25
        if traitCollection.userInterfaceStyle == .dark{
            navigationItem.searchController?.searchBar.tintColor = .white
        }
        else{
            navigationItem.searchController?.searchBar.tintColor = .black
        }
        CheckOut.layer.cornerRadius = 25
        self.ProductPrice.text = ""
        tabBarItem.badgeValue = "1"
        cartTableView.dataSource = self
        cartTableView.delegate = self
        cartTableView.reloadData()
        
    }
 
    @IBAction func CheckOutPressed(_ sender: Any) {
        if SKPaymentQueue.canMakePayments(){
            let set: Set<String> = [Product.gems.rawValue]
            let productRequest = SKProductsRequest(productIdentifiers: set)
            productRequest.delegate = self
            productRequest.start()

        }
    }
   
  
}
