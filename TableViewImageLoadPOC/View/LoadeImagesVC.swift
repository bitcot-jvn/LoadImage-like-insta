//
//  ViewController.swift
//  TableViewImageLoadPOC
//
//  Created by BitCot Technologies on 31/07/21.
//

import UIKit
import Foundation
import SDWebImage

class LoadeImagesVC: BaseViewController {

    //MARK: Outlets
    @IBOutlet weak var tblImagesLoader: UITableView?
    
    //MARK: Variables
    var viewModal: LoadImagesVM?
    var baseURL: [URL]?
    
    //MARK: Default Function
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    func configureUI(){
        self.viewModal = LoadImagesVM()
        self.viewModal?.vc = self
        self.tblImagesLoader?.tableFooterView = UIView()
    }
}

//MARK: UITableViewDelegate, UITableViewDataSource
extension LoadeImagesVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModal?.arrData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellImages", for: indexPath) as? CellImages else {
            return UITableViewCell()
        }
        cell.data = self.viewModal?.arrData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
}
