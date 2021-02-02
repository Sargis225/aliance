//
//  SetupViewController.swift
//  aliance
//
//  Created by Saq on 1/9/21.
//

import UIKit
enum Setting {
    case language
    case color
}
class SetupViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    @IBOutlet var setupTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let color = UserDefaults.standard.colorForKey(key: "colorsKey") {
            setupTableView.backgroundColor = color
        }
        setupTableView.dataSource = self
        setupTableView.delegate = self
        setupTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let color = UserDefaults.standard.colorForKey(key: "colorsKey") {
            self.view.backgroundColor = color
            setupTableView.backgroundColor = color
        }
        let langueage = UserDefaults.standard.string(forKey: "languageKey")
        switch langueage {
        case "English":
            selectColor = "Select background color"
            selectLanguage = "Select language"
            selectGameTime =  "Select game time"
            selectMaxPoint = "Select the maximum score"
        case "Русский":
            selectColor = "Выбирайте цвет"
            selectLanguage = "Выбирайте язык"
            selectGameTime = "Выбирайте время игры"
            selectMaxPoint = "Выбирайте победные очки"
        default:
            selectColor = "Ընտրեք ետնագույնը"
            selectLanguage = "Ընտրեք Լեզուն"
            selectGameTime =  "Ընտրեք խաղի ժամանակը"
            selectMaxPoint = "Ընտրեք առավելագույն միավորը"
        }
        setupTableView.reloadData()
        
    }
    
    
    var selectColor = ""
    var selectLanguage = ""
    var selectGameTime = ""
    var selectMaxPoint = ""
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ident = "cellIdentifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: ident) as! MyTableViewCell
        cell.layer.cornerRadius = 20
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        if let color = UserDefaults.standard.colorForKey(key: "colorsKey") {
            cell.backgroundColor = color
            cell.globeImageView.backgroundColor = color
            cell.paintImageView.backgroundColor = color
        }
        cell.textLabel?.textAlignment = .center
        if indexPath.section == 0 && indexPath.row == 0 {
            let langueage = UserDefaults.standard.string(forKey: "languageKey")
            switch langueage {
            case "English":
                cell.selectedLanguage.text = "English"
            case "Русский":
                cell.selectedLanguage.text = "Русский"
            default:
                cell.selectedLanguage.text = "Հայերեն"
            }
            cell.paintImageView?.isHidden = true
            cell.selectedLanguage.isHidden = false
            cell.textLabel?.text = selectLanguage
        }
        if indexPath.section == 0 && indexPath.row == 1{
            cell.globeImageView?.isHidden = true
            cell.selectedLanguage.isHidden = true
            cell.textLabel?.text = selectColor
        }
        if indexPath.section == 1 {
            let identTwo = "twoCellIdentifier"
            let cellTwo = tableView.dequeueReusableCell(withIdentifier: identTwo) as! ErkrordMyTableViewCell
            cellTwo.layer.cornerRadius = 20
            cellTwo.textLabel?.adjustsFontSizeToFitWidth = true
            cellTwo.hidden()
            cellTwo.hideLabel()

            if let color = UserDefaults.standard.colorForKey(key: "colorsKey") {
                cellTwo.backgroundColor = color
            }
            cellTwo.textLabel?.font = UIFont.boldSystemFont(ofSize: 22)
            cellTwo.textLabel?.textAlignment = .center
            if let color = UserDefaults.standard.colorForKey(key: "colorsKey") {
                cellTwo.backgroundColor = color
                cellTwo.hidden()
                cellTwo.hideLabel()
            }
            if indexPath.row == 0 {
                cellTwo.textLabel?.text = selectGameTime
            }
            if indexPath.row == 1 {
                cellTwo.textLabel?.text = selectMaxPoint
            }
            return cellTwo
        }
       return cell
    }
    
    var setting:Setting!
    var settingsType = Setting.self
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath {
        case [0,1]:
            setting = settingsType.color
            performSegue(withIdentifier: "colorsIdent", sender: setting)
        case [0,0]:
            setting = settingsType.language
            performSegue(withIdentifier: "colorsIdent", sender: setting)
        case [1,0]:
           let cell2 = tableView.cellForRow(at: indexPath) as! ErkrordMyTableViewCell
            cell2.show()
            cell2.timeValueLabel.text = String(Int(cell2.slider.value))
            cell2.indexRow = 0
            
            cell2.textLabel?.text = ""
        case [1,1]:
            let cell2 = tableView.cellForRow(at: indexPath) as! ErkrordMyTableViewCell
            cell2.showlabel()
            cell2.pointsValueLabel.text = String(Int(cell2.slider.value))
            cell2.indexRow = 1
            cell2.textLabel?.text = ""
        default:
//            let cell2 = tableView.cellForRow(at: indexPath) as! ErkrordMyTableViewCell
//            cell2.hideLabel()
//            cell2.hidden()
            print("ok")
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ColorsTableViewController {
            vc.settings = setting
        }
    }
}

extension UserDefaults {
  func colorForKey(key: String) -> UIColor? {
    var colorReturnded: UIColor?
    if let colorData = data(forKey: key) {
      do {
        if let color = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(colorData) as? UIColor {
          colorReturnded = color
        }
      } catch {
        print("Error UserDefaults")
      }
    }
    return colorReturnded
  }
  
  func setColor(color: UIColor?, forKey key: String) {
    var colorData: NSData?
    if let color = color {
      do {
        let data = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false) as NSData?
        colorData = data
      } catch {
        print("Error UserDefaults")
      }
    }
    set(colorData, forKey: key)
  }
}

