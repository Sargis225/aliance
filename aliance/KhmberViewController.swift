//
//  KhmberViewController.swift
//  aliance
//
//  Created by Saq on 1/9/21.
//

import UIKit

class KhmberViewController: UIViewController {

    @IBOutlet var teamPlus: UIButton!
    @IBOutlet var teamOne: UIButton!
    @IBOutlet var teamTow: UIButton!
    var distance:CGFloat = 10
    var key = 0
    var teamArray:[UIButton] = []
    var deleteTeamButtonArrray:[UIButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        teamOne.layer.cornerRadius = 20
        teamTow.layer.cornerRadius = 20
        teamPlus.layer.cornerRadius = 10
        startButton.layer.cornerRadius = 50
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func teamPlusPressed(_ sender: UIButton) {
        if key >= 2 {
            return
        }
        
//        let image = UIImage(named: "computer-icons-button-wiki-delete-button")
        
        let newTeam = UIButton(frame: CGRect(x: teamTow.frame.origin.x, y: teamTow.frame.origin.y + teamTow.frame.height + distance, width: teamTow.frame.width, height: teamTow.frame.height))
        newTeam.backgroundColor = #colorLiteral(red: 0.2354210162, green: 0.5536059394, blue: 1, alpha: 1)
        newTeam.titleLabel?.font = (UIFont.boldSystemFont(ofSize: 42))
        newTeam.setTitle("Թիմ 3", for:.normal)
        newTeam.titleLabel?.textAlignment = .center
        newTeam.setTitleColor(#colorLiteral(red: 1, green: 0.7956949813, blue: 0.1120238328, alpha: 1), for: .normal)
//        distance = 2 * distance + teamTow.frame.height
        newTeam.titleLabel?.textColor = #colorLiteral(red: 1, green: 0.7956949813, blue: 0.1120238328, alpha: 1)
        newTeam.titleLabel?.attributedText?.size()
        newTeam.layer.cornerRadius = 20
        view.addSubview(newTeam)
        newTeam.addTarget(nil, action: #selector(newTeamThreeFore), for: .touchUpInside)
        teamArray.append(newTeam)
        
        let deleteTeamButton = UIButton(frame: CGRect(x: newTeam.frame.origin.x + newTeam.frame.width + 10, y: newTeam.frame.origin.y, width: 40, height: 40))
        deleteTeamButton.backgroundColor = #colorLiteral(red: 1, green: 0.1945014842, blue: 0.005726532741, alpha: 1)
        deleteTeamButton.layer.cornerRadius = 10
        deleteTeamButton.setTitle("-", for:.normal)
        deleteTeamButton.titleLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        deleteTeamButton.titleLabel?.textAlignment = .center
        deleteTeamButton.titleLabel?.font = (UIFont.boldSystemFont(ofSize: 37))
        deleteTeamButton.addTarget(nil, action: #selector(deleteNewTeams), for: .touchUpInside)
//        image?.accessibilityFrame = deleteTeamButton.frame
//        deleteTeamButton.setBackgroundImage(image, for: .normal)
        view.addSubview(deleteTeamButton)
        deleteTeamButtonArrray.append(deleteTeamButton)
        distance = 2 * distance + teamTow.frame.height
        key += 1
        if key == 2 {
            newTeam.titleLabel?.font = (UIFont.boldSystemFont(ofSize: 42))
            newTeam.setTitle("Թիմ 4", for:.normal)
        }
       
    }
    
    
    
    
    @objc func deleteNewTeams(_ sender:UIButton) {
        let tvyalEllement = deleteTeamButtonArrray.firstIndex(of: sender)!
            key -= 1
            distance = 10
            teamArray.remove(at: tvyalEllement).removeFromSuperview()
            deleteTeamButtonArrray.remove(at: tvyalEllement).removeFromSuperview()
    }
    
    
    
    @objc func newTeamThreeFore(_ sender:UIButton) {
        let alertController: UIAlertController = UIAlertController(title: "Փոխել թմի անունը", message: "", preferredStyle: .alert)
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
                //cancel code
            }
        alertController.addAction(cancelAction)
        
        let nextAction: UIAlertAction = UIAlertAction(title: "Rename", style: .default) { action -> Void in
            let text = (alertController.textFields?.first as! UITextField).text
            sender.setTitle(text, for: .normal)
            }
        alertController.addAction(nextAction)

            //Add text field
        alertController.addTextField { (textField) -> Void in
                textField.textColor = UIColor.green
            }
        
            //Present the AlertController
        present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func teamOnePressed(_ sender: UIButton) {
        //TODO:petqa nenc anenq vor inch vor ban baci karoxananq anuny poxel
        
        let alertController: UIAlertController = UIAlertController(title: "Փոխել թմի անունը", message: "", preferredStyle: .alert)
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
                //cancel code
            }
        alertController.addAction(cancelAction)
        
        let nextAction: UIAlertAction = UIAlertAction(title: "Rename", style: .default) { action -> Void in
            let text = (alertController.textFields?.first as! UITextField).text
            self.teamOne.setTitle(text, for: .normal)
            }
        alertController.addAction(nextAction)

            //Add text field
        alertController.addTextField { (textField) -> Void in
                textField.textColor = UIColor.green
            }
        
            //Present the AlertController
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func teamTowPressed(_ sender: UIButton) {
        //TODO:petqa nenc anenq vor inch vor ban baci karoxananq anuny poxel
        
        let alertController: UIAlertController = UIAlertController(title: "Փոխել թմի անունը", message: "", preferredStyle: .alert)
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
                //cancel code
            }
        alertController.addAction(cancelAction)
        
        let nextAction: UIAlertAction = UIAlertAction(title: "Rename", style: .default) { action -> Void in
            let text = (alertController.textFields?.first as! UITextField).text
            self.teamTow.setTitle(text, for: .normal)
            }
        alertController.addAction(nextAction)

            //Add text field
        alertController.addTextField { (textField) -> Void in
                textField.textColor = UIColor.green
            }
        
            //Present the AlertController
        present(alertController, animated: true, completion: nil)
    }
    
    
    @IBOutlet var startButton: UIButton!
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
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
