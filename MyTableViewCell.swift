//
//  MyTableViewCell.swift
//  aliance
//
//  Created by Saq on 1/10/21.
//

import UIKit

class MyTableViewCell: UITableViewCell {
//    var imageViewGlobe:UIImageView?
//    var imageGlobe:UIImage?
    
    @IBOutlet var paintImageView: UIImageView!
    @IBOutlet var globeImageView: UIImageView!
    @IBOutlet var selectedLanguage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
