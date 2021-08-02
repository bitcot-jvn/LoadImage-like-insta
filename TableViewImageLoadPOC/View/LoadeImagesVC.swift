//
//  ViewController.swift
//  TableViewImageLoadPOC
//
//  Created by BitCot Technologies on 31/07/21.
//

import UIKit
import Foundation

class LoadeImagesVC: BaseViewController {

    //MARK: Default Function
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

//MARK: UITableViewDelegate, UITableViewDataSource
extension LoadeImagesVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellImages", for: indexPath) as! CellImages else {
            return UITableViewCell()
        }
        return cell
    }
}
