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
    
    override func awakeFromNib() {
        super.awakeFromNib()
////        let imageName = "globe.png"
//        let imageGlobe = UIImage(systemName: "globe")
//        let imageViewGlobe = UIImageView(image: imageGlobe!)
//        imageViewGlobe.frame = CGRect(x: 0, y: self.frame.height / 4, width: 50, height: 50)
//        self.addSubview(imageViewGlobe)
//
//        let imageviewGlobe = UIImageView(image: UIImage(systemName: "globe"))
        // Initialization code
    }
//    func showSlider() {
//        imageViewGlobe?.isHidden = false
//    }
//    func hideSlider() {
//        imageViewGlobe?.isHidden = true
//    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
