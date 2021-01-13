//
//  GameViewController.swift
//  aliance
//
//  Created by Saq on 1/13/21.
//

import UIKit

class GameViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 6
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indent = "namesIndent"
        let cell = tableView.dequeueReusableCell(withIdentifier: indent) as! NamesTableViewCell
        cell.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        cell.textLabel?.text = String(indexPath.row)
        cell.textLabel?.text = namesArray.randomElement()
        
//        print("aaa")
        return cell
    }
    
    
//    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//
//        return [0,2]
//    }
    var a = 0
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        tableView.reloadRows(at: [indexPath], with: .none)
        print(indexPath)
       a = a + 1
        if a == 6  {
            namesTableView.reloadData()
            a = 0
        }
    }
    
    

    @IBOutlet var teamNameLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var namesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ii")
        if let color = UserDefaults.standard.colorForKey(key: "colorKey") {
            self.view.backgroundColor = color
            namesTableView.backgroundColor = color
        }
        
        namesTableView.allowsMultipleSelection = true
        namesTableView.allowsMultipleSelectionDuringEditing = true
        namesTableView.dataSource = self
        namesTableView.delegate = self
        time()
        // Do any additional setup after loading the view.
    }
    var barer = "Անցել էր բավականին ժամանակ, բայց Միքայելը դեռ չէր հանդիպել Գարեգինին և տեղեկություն չուներ նրանից։ Նոյեմբերի մի ցուրտ գիշեր բավականին ուշ եկավ տուն և տեսավ իր անկողնուն պառկած իր դասընկերոջը։ Երկար զրույցից պարզ դարձավ, որ Ռուբենը երկար ժամանակ թողել է ուսում Պետերբուրգ Նամակ էր ստացել հոր մահամերձ լինելու մասին Կովկաս Թիֆլիս հանձնում Սպանված աղավնի խորագրով մի գրություն գլխավոր հերոս Գրվածք սյուժե հետևյալ սրանից քանի տարի առաջ ամռանը օգտվելով արձակուրդից գնում է իր հորեղբոր մոտ ամառանոց Իր հետ տան է նաև իր շան ու հրացան Ամեն օր էր որս և հանկարծ մի օր հանդիպում է մի աղջկա ու սիրահարվում։ Աղջկա խնդրանքով են որսի և Տեսնելով սպանված աղջիկ ընկնում է մտատանջության մեջ և այդ սպանությունը վերագրում է իրեն։ Նա աղավնու և իր միջև, թերևս անգիտակցաբար, մի նմանություն էր տեսնում և լալիս է ոչ թե այն անմեղ թռչունի սպանությունը, այլ իր կուսության սպանությունը։ Հեռանալով ամառանոցից՝ որոշ ժամանակ նամակագրություն ունեին իրար հետ, որը գնալով նվազեց և վերջիվերջո դադարեց իսպառ։ Կյանքն առավ հեղինակին իր հորձանուտ ալիքների մեջ և ժամանակ բերեց անխուսափելին՝ մոռացումը"
    
    
    var namesArray:[String] = []
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let barerArray = barer.split(separator: " ")
        for i in barerArray {
            if i.count > 2 {
                namesArray.append(String(i))
            }
        }
//        print(namesArray)
        teamNameLabel.text = UserDefaults.standard.string(forKey: "teamOneNameKey")
//        let langueage = UserDefaults.standard.string(forKey: "languageKey")
//        switch langueage {
//        case "Հայերեն":
//            namesArray = ["","","","","","","","","","","",""]
//        case "English":
//            namesArray = ["","","","","","","","","","","",""]
//
//        case "Русский":
//            namesArray = ["","","","","","","","","","","",""]
//        default:
//            print("ok")
//        }
       
    }
    var timer = Timer()
    var counter = Int(UserDefaults.standard.string(forKey: "timeIntervalKey")!)

    func time() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction() {
        counter = counter! - 1
        
        if counter! < 0 {
            
            return
        }
        if counter! == 0 {
            performSegue(withIdentifier: "resultIndent", sender: nil)
           return
        }
        
        timeLabel.text = String(counter!)
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
