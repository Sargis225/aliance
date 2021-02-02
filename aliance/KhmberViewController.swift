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
    @IBOutlet var teamsLabel: UILabel!
    @IBOutlet var gameTimeLabel: UILabel!
    @IBOutlet var gameMaximumPointsLabel: UILabel!
    
    var distance:CGFloat = 10
    var key = 0
    var teamArray:[UIButton] = []
    var deleteTeamButtonArrray:[UIButton] = []
    var teamOneName = ""
    var teamTwoName = ""
    var teamThirdName = ""
    var teamFourthName = ""
    var startButtonName = ""
    var gameTime = ""
    var maximumPoints = ""
    var second = ""
    var team = ""
    var massage = ""
    var buttonCancelText = ""
    var buttonRenameText = ""
    var crews:[String] = []
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let color = UserDefaults.standard.colorForKey(key: "colorsKey") {
            self.view.backgroundColor = color
        }
        teamOne.titleLabel?.adjustsFontSizeToFitWidth = true
        teamTow.titleLabel?.adjustsFontSizeToFitWidth = true
        
        let langueage = UserDefaults.standard.string(forKey: "languageKey")
        switch langueage {

        case "English":
            teamOneName = "Group 1"
            teamTwoName = "Group 2"
            teamThirdName = "Group 3"
            teamFourthName = "Group 4"
            startButtonName = "Start"
            gameTime = "Game time"
            maximumPoints = "Maximum points"
            second = "second"
            team = "Groups"
            massage = "Change group name"
            buttonCancelText = "Cancel"
            buttonRenameText = "Rename"
        case "Русский":
            teamOneName = "Команда 1"
            teamTwoName = "Команда 2"
            teamThirdName = "Команда 3"
            teamFourthName = "Команда 4"
            startButtonName = "НАЧАТЬ"
            gameTime = "Время игры"
            maximumPoints = "Максимальное очков"
            second = "секунда"
            team = "Команды"
            massage = "Изменить название группы"
            buttonCancelText = "Отменить"
            buttonRenameText = "Изменить"
        default:
            teamOneName = "Թիմ 1"
            teamTwoName = "Թիմ 2"
            teamThirdName = "Թիմ 3"
            teamFourthName = "Թիմ 4"
            startButtonName = "Սկսել"
            gameTime = "Խաղի ժամանակը"
            maximumPoints = "Առավելագույն միավորը"
            second = "վարկյան"
            team = "Խմբեր"
            massage = "Փոխել թմի անունը"
            buttonCancelText = "Չեղարկել"
            buttonRenameText = "Փոխել"
        }
        teamOne.setTitle(teamOneName, for: .normal)
        teamTow.setTitle(teamTwoName, for: .normal)
        startButton.setTitle(startButtonName, for: .normal)
        teamsLabel.text = team
        var timeInterval = UserDefaults.standard.string(forKey: "timeIntervalKey") ?? ""
        
        if timeInterval == "" {
            timeInterval = "60"
        }
        print(timeInterval)
        var maximumPointsS = UserDefaults.standard.string(forKey: "maximumPointsKey") ?? ""
        if maximumPointsS == "" {
            maximumPointsS = "40"
        }
        print(maximumPointsS)
        gameTimeLabel.text = "\(gameTime) \(timeInterval) \(second)"
        gameMaximumPointsLabel.text = "\(maximumPoints) \(maximumPointsS) "
        crews.append(teamOne.titleLabel?.text ?? "")
        crews.append(teamTow.titleLabel?.text ?? "")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamOne.layer.cornerRadius = 20
        teamTow.layer.cornerRadius = 20
        teamPlus.layer.cornerRadius = 10
        startButton.layer.cornerRadius = 50
        
        if let color = UserDefaults.standard.colorForKey(key: "colorKey") {
            self.view.backgroundColor = color
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        crews.removeAll()

        
    }
    
    @IBAction func teamPlusPressed(_ sender: UIButton) {
        if key >= 2 {
            return
        }
                
        let newTeam = UIButton(frame: CGRect(x: teamTow.frame.origin.x, y: teamTow.frame.origin.y + teamTow.frame.height + distance, width: teamTow.frame.width, height: teamTow.frame.height))
        newTeam.backgroundColor = #colorLiteral(red: 0.2354210162, green: 0.5536059394, blue: 1, alpha: 1)
        newTeam.titleLabel?.font = (UIFont.boldSystemFont(ofSize: 42))
        newTeam.setTitle(teamThirdName, for:.normal)
        newTeam.titleLabel?.textAlignment = .center
        newTeam.setTitleColor(#colorLiteral(red: 1, green: 0.7956949813, blue: 0.1120238328, alpha: 1), for: .normal)
        newTeam.titleLabel?.textColor = #colorLiteral(red: 1, green: 0.7956949813, blue: 0.1120238328, alpha: 1)
        newTeam.titleLabel?.attributedText?.size()
        newTeam.layer.cornerRadius = 20
        newTeam.titleLabel?.adjustsFontSizeToFitWidth = true
        view.addSubview(newTeam)
        newTeam.addTarget(nil, action: #selector(newTeamThreeFore), for: .touchUpInside)
        teamArray.append(newTeam)
        if key == 0 {
            crews.append(newTeam.titleLabel?.text ?? "")
        }
        
       
        let deleteTeamButton = UIButton(frame: CGRect(x: newTeam.frame.origin.x + newTeam.frame.width + 10, y: newTeam.frame.origin.y, width: 40, height: 40))
        deleteTeamButton.backgroundColor = #colorLiteral(red: 1, green: 0.1945014842, blue: 0.005726532741, alpha: 1)
        deleteTeamButton.layer.cornerRadius = 10
        deleteTeamButton.setTitle("-", for:.normal)
        deleteTeamButton.titleLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        deleteTeamButton.titleLabel?.textAlignment = .center
        deleteTeamButton.titleLabel?.font = (UIFont.boldSystemFont(ofSize: 37))
        deleteTeamButton.addTarget(nil, action: #selector(deleteNewTeams), for: .touchUpInside)
        view.addSubview(deleteTeamButton)
        deleteTeamButtonArrray.append(deleteTeamButton)
        distance = 2 * distance + teamTow.frame.height
        key += 1
        if key == 2 {
            newTeam.titleLabel?.font = (UIFont.boldSystemFont(ofSize: 42))
            newTeam.setTitle(teamFourthName, for:.normal)
            crews.append(newTeam.titleLabel?.text ?? "")

        }
        print(crews)
        print(distance)
        print(key)
    }
    
    func back(num:Int,array:[UIButton]) {
        let merCankacacButton = array[num]
        
        // qayl 2 gtnum enq num1 - ov  viewyi - y@
        var tvyalnNumY = merCankacacButton.frame.origin.y
        
        // poxum enq ayd Y - @
        tvyalnNumY = merCankacacButton.frame.origin.y - merCankacacButton.frame.height - 10
         distance = 83
        // poxvac y@  dnum enq chapseri mej
        UIView.animate(withDuration: 0.5 ) {
            merCankacacButton.frame.origin.y = tvyalnNumY
        
        }
    }
    
    @objc func deleteNewTeams(_ sender:UIButton) {
        let tvyalEllement = deleteTeamButtonArrray.firstIndex(of: sender)!
        key -= 1
        distance = 10
        crews.removeLast()
        print(crews)
        if Int(tvyalEllement) == (teamArray.count - 1) {
            teamArray.remove(at: tvyalEllement).removeFromSuperview()
            deleteTeamButtonArrray.remove(at: tvyalEllement).removeFromSuperview()
            return
        }
        teamArray.remove(at: tvyalEllement).removeFromSuperview()
        deleteTeamButtonArrray.remove(at: tvyalEllement).removeFromSuperview()
        if teamArray.count > 0 {
            for viewNextEllements in Int(tvyalEllement) ... (teamArray.count - 1 ) {
                back(num: viewNextEllements, array: teamArray)
                back(num: viewNextEllements, array: deleteTeamButtonArrray)
                teamArray[viewNextEllements].setTitle(teamThirdName, for: .normal)
            }
        }
        
        
    }
    
    @objc func newTeamThreeFore(_ sender:UIButton) {
        addAlertController(button: sender)

    }
    
    func addAlertController(button:UIButton!) {
        let alertController: UIAlertController = UIAlertController(title: massage, message: "", preferredStyle: .alert)
        let cancelAction: UIAlertAction = UIAlertAction(title: buttonCancelText, style: .cancel) { action -> Void in
            }
        alertController.addAction(cancelAction)
        let nextAction: UIAlertAction = UIAlertAction(title: buttonRenameText, style: .default) { action -> Void in
            let text = (alertController.textFields?.first as! UITextField).text
            button.setTitle(text, for: .normal)
            for i in 0 ... self.crews.count - 1 {
                if button.titleLabel?.text  == self.crews[i] {
                    self.crews[i] = text ?? ""
                }
            }
            print(self.crews)
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
        addAlertController(button: teamOne)
    }
    
    
    @IBAction func teamTowPressed(_ sender: UIButton) {
        addAlertController(button: teamTow)
    }
    
    
    @IBOutlet var startButton: UIButton!
    
//    @IBAction func startButtonPressed(_ sender: UIButton) {
//    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ResultViewController {
            vc.crews = crews
        }
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
extension UIButton {
    var titlname: String {
        let name = self.titleLabel?.text ?? ""
        return name
    }
}
