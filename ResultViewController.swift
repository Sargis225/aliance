//
//  ResultViewController.swift
//  aliance
//
//  Created by Saq on 1/17/21.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var teamOneLabel: UILabel!
    @IBOutlet var teamTwoLabel: UILabel!
    @IBOutlet var teamThirdLabel: UILabel!
    @IBOutlet var teamFourthLabel: UILabel!
    @IBOutlet var continueButton: UIButton!
    var predectedAnswer = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButton.layer.cornerRadius = 20
        if let color = UserDefaults.standard.colorForKey(key: "colorsKey") {
            self.view.backgroundColor = color
            teamOneLabel.backgroundColor = color
            teamTwoLabel.backgroundColor = color
            teamThirdLabel.backgroundColor = color
            teamFourthLabel.backgroundColor = color
            let teamOneName = UserDefaults.standard.string(forKey: "teamOneNameKey")
            teamOneLabel.text = "\(teamOneName ?? "")     -      \(predectedAnswer)"
            let teamTwoNameKey = UserDefaults.standard.string(forKey: "teamTowNameKey")
            teamTwoLabel.text = "\(teamTwoNameKey ?? "")"
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        self.navigationController?.popToRootViewController(animated: true)

    }
    
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
