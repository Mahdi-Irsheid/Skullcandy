//
//  ScreenTwoViewController.swift
//  Skullcandy
//
//  Created by Mahdi Fabio on 29/08/2022.
//

import UIKit
class ScreenTwoViewController: UIViewController {
    var arr = [String]()

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return arr.count
//    }
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell",for: indexPath)
//        cell.textLabel?.text = arr[indexPath.row]
//        return cell
//
//    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
        if traitCollection.userInterfaceStyle == .dark{
            navigationItem.searchController?.searchBar.tintColor = .white
        }
        else{
            navigationItem.searchController?.searchBar.tintColor = .black
        }

    }
}
