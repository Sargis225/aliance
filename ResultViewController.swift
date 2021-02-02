//
//  ResultViewController.swift
//  aliance
//
//  Created by Saq on 1/17/21.
//

import UIKit

class ResultViewController: UIViewController, GameViewControllerDelegate, GameViewControllerDelegateErkus {
    func endGameErkus(dic: [String : Int]) {
        var indexPlayer = crews.firstIndex(of: dic.keys.first ?? "")
        if indexPlayer == crews.count - 1 {
            indexPlayer = -1
        }
        
        nextPlayer = crews[(indexPlayer ?? 0) + 1]
        print(dic.keys.first ?? "")
        print(dic.values.first ?? 0)
        for i in 0...playersNameLable.count - 1{
            if playersNameLable[i].text == dic.keys.first ?? "" {
                trueAnswerLableCollection[i].text = "\((Int(trueAnswerLableCollection[i].text ?? "") ?? 0) + (dic.values.first ?? 0))"
            }
            
        }
    }
    
    var won = ""
    var point = ""
    var exit = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let langueage = UserDefaults.standard.string(forKey: "languageKey")
        switch langueage {
        case "English":
            won = "Winner"
            point = "Point"
            exit = "Exit"
        case "Русский":
            won = "Победитель"
            point = "Баллов"
            exit = "Выйти"
        default:
            won = "Հաղթանակ"
           point = "Միավոր"
            exit = "Դուրս գալ"
        }
        var maximumPoints = UserDefaults.standard.string(forKey: "maximumPointsKey") ?? ""
        if maximumPoints == "" {
            maximumPoints = "40"
        }
        let maxPointsInt = Int(maximumPoints) ?? 0
        for i in 0 ... playersNameLable.count - 1 {
            if (Int(trueAnswerLableCollection[i].text ?? "") ?? 0) >= maxPointsInt {
                let alertController: UIAlertController = UIAlertController(title: "\(playersNameLable[i].text ?? "") - \(trueAnswerLableCollection[i].text ?? "") \(point)", message: "\(won)", preferredStyle: .alert)
                let cancelAction: UIAlertAction = UIAlertAction(title: exit, style: .cancel) { action -> Void in
                    self.navigationController?.popViewController(animated: true)
                            }
                let cantinueAction:UIAlertAction = UIAlertAction(title: cantinue, style: .default) { (UIAlertAction) in
                    for i in self.trueAnswerLableCollection {
                        i.text = ""
                    }
                    self.performSegue(withIdentifier: "playGame", sender: nil)
                }
                alertController.addAction(cancelAction)
                alertController.addAction(cantinueAction)
                present(alertController, animated: true, completion: nil)
            }
        }
        continueButton.setTitle(cantinue, for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? GameViewController {
            vc.player = nextPlayer
            vc.delegate = self
            vc.name = nextPlayer
            vc.delegateErkus = self
        }
        
        
    }
    
    func endGame(player: String, trueResult: Int) {
        var indexPlayer = crews.firstIndex(of: player)
        if indexPlayer == crews.count - 1 {
            indexPlayer = -1
        }
        print(player)
        for i in 0...playersNameLable.count - 1{
            if playersNameLable[i].text == player {
                trueAnswerLableCollection[i].text = "\(trueResult)"
            }
        }
        nextPlayer = crews[(indexPlayer ?? 0) + 1]
        print(trueResult)
    }
    

    @IBOutlet var playersNameLable: [UILabel]!
    @IBOutlet var trueAnswerLableCollection: [UILabel]!
    @IBOutlet var continueButton: UIButton!
    
    var crews:[String] = []
//    var predectedAnswer = ""
    var isFirstAppear = true
    var nextPlayer: String!
    var cantinue = ""
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(predectedAnswer)
        continueButton.layer.cornerRadius = 20
        
        let langueage = UserDefaults.standard.string(forKey: "languageKey")
        switch langueage {
        case "English":
            cantinue = "Continue"
        case "Русский":
            cantinue = "Продолжить"
        default:
            cantinue = "Շարունակել"
        }
        if let color = UserDefaults.standard.colorForKey(key: "colorsKey") {
            self.view.backgroundColor = color
            for i in playersNameLable {
                i.backgroundColor = color
            }
            for i in trueAnswerLableCollection {
                i.backgroundColor = color
            }
        }
        for i in 0 ... crews.count - 1{
            playersNameLable[i].text = crews[i]
        }
        
        if isFirstAppear {
            nextPlayer = crews[0]
            performSegue(withIdentifier: "playGame", sender: nil)
        }
    }
    
    @IBAction func continueButtonPressed(_ sender: UIButton) {
//        navigationController?.popViewController(animated: true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        isFirstAppear = false
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
//        print("backButtonPressed ")
////        self.navigationController?.popToRootViewController(animated: true)
//        if let controllers = self.navigationController?.viewControllers {
//            for vc in controllers {
//                if ((vc as? KhmberViewController) != nil)  {
//                    self.navigationController?.popToViewController(vc, animated: true)
//                    return
//                }
//            }
//        }
        
