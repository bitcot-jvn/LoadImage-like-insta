//
//  CellImages.swift
//  TableViewImageLoadPOC
//
//  Created by BitCot Technologies on 31/07/21.
//

import UIKit
import SDWebImage

class CellImages: UITableViewCell {

    //MARK: Outlets
    @IBOutlet weak var img: UIImageView!
    
    //MARK: Variables
    var data: CollectionModal?{
        didSet{
            self.img.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
            self.img.sd_setImage(with: URL(string: data?.thumbnailUrl ?? ""), placeholderImage: UIImage())
        }
    }
    
    //MARK: Default Function
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
