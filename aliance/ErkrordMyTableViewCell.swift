//
//  ErkrordMyTableViewCell.swift
//  aliance
//
//  Created by Saq on 1/14/21.
//

import UIKit
protocol ProtocolSlider {
    func timeInterval()
    func points()
}
class ErkrordMyTableViewCell: UITableViewCell {

    
    @IBOutlet var timeValueLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var pointsValueLabel: UILabel!
    var errordVCDelegate:ProtocolSlider?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        timeValueLabel.text = String(Int(slider.value))
        pointsValueLabel.text = String(Int(slider.value))
        slider.maximumValue = 100
        slider.minimumValue = 30
        slider.value = 60
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var indexRow = 0
    @IBAction func sliderActionPressed(_ sender: UISlider) {
        
        if indexRow == 0 {
            timeValueLabel.text = String(Int(sender.value))
            UserDefaults.standard.set(timeValueLabel.text ?? "",forKey: "timeIntervalKey")
        }else {
            pointsValueLabel.text = String(Int(sender.value))
            UserDefaults.standard.set(pointsValueLabel.text ?? "",forKey: "maximumPointsKey")
        }
    }
    
    func showlabel() {
        pointsValueLabel.isHidden = false
        slider.isHidden = false
    }
    
    func hideLabel() {
        pointsValueLabel.isHidden = true
    }
    
    func show() {
        timeValueLabel.isHidden = false
        slider.isHidden = false
        
    }
    
    func hidden() {
        timeValueLabel.isHidden = true
        slider.isHidden = true
    }
    

}
