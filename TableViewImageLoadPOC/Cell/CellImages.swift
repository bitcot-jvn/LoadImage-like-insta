//
//  CellImages.swift
//  TableViewImageLoadPOC
//
//  Created by BitCot Technologies on 31/07/21.
//

import UIKit
import SDWebImage
import MBCircularProgressBar

class CellImages: UITableViewCell {

    //MARK: Outlets
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var progressBar: MBCircularProgressBarView!
    
    var ImageUrl = String()
    //MARK: Variables
    var data: CollectionModal?{
        didSet{
            self.img.image = #imageLiteral(resourceName: "icons8-full-image-64")
            let imgurl = URL(string: self.data?.thumbnailUrl ?? "")
            guard let ImageUrl = self.data?.thumbnailUrl else {
                return
            }
            if  SDImageCache.shared.diskImageDataExists(withKey: ImageUrl){
                self.progressBar.isHidden = true
                self.img.image = SDImageCache.shared.imageFromDiskCache(forKey: ImageUrl)
            }else{
                
                SDWebImageDownloader.shared.downloadImage(with: imgurl, options: .lowPriority) { receivedSize, expectedSize, url in
                    // progression tracking code
                    DispatchQueue.main.async {
                        self.progressBar.isHidden = false
                        self.progressBar.value = CGFloat(receivedSize)
                        self.progressBar.maxValue = CGFloat(expectedSize)
                    }
                } completed: { image, downloaddata, error, finished in
                    if finished{
                        DispatchQueue.main.async {
                            SDImageCache.shared.store(image, forKey: ImageUrl)
                            self.img.image = image
                            self.progressBar.isHidden = true
                        }
                    }else{
                        DispatchQueue.main.async {
                            self.progressBar.isHidden = false
                            self.img.image = #imageLiteral(resourceName: "icons8-full-image-64")
                        }
                    }
                }
            }
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
