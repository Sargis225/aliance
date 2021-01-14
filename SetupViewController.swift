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
        setupTableView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        setupTableView.dataSource = self
        setupTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let color = UserDefaults.standard.colorForKey(key: "colorsKey") {
            self.view.backgroundColor = color
            setupTableView.backgroundColor = color
        }
        setupTableView.reloadData()
    }
    
    
    var selectColor = "select color"
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ident = "cellIdentifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: ident) as! MyTableViewCell
        if let color = UserDefaults.standard.colorForKey(key: "colorsKey") {
            cell.backgroundColor = color
            cell.globeImageView.backgroundColor = color
            cell.paintImageView.backgroundColor = color
        }
        cell.textLabel?.textAlignment = .center
        if indexPath.section == 0 && indexPath.row == 1{
            cell.globeImageView?.isHidden = true
            cell.textLabel?.text = selectColor
        }
        if indexPath.section == 0 && indexPath.row == 0 {
            cell.paintImageView?.isHidden = true
            cell.textLabel?.text = "select language"
        }
        if indexPath.section == 1 {
            let identTwo = "twoCellIdentifier"
            let cellTwo = tableView.dequeueReusableCell(withIdentifier: identTwo) as! ErkrordMyTableViewCell
            if let color = UserDefaults.standard.colorForKey(key: "colorsKey") {
                cellTwo.backgroundColor = color
            }
            
            cellTwo.textLabel?.text = String(indexPath.row)
            return cellTwo
        }
        
//        switch indexPath {
//        case [0,1]:
//            cell.globeImageView?.isHidden = true
//            cell.textLabel?.text = selectColor
//        case [0,0]:
//            cell.paintImageView?.isHidden = true
//            cell.textLabel?.text = "select language"
//        case [1,0]:
//            let identTwo = "twoCellIdentifier"
//            let cellTwo = tableView.dequeueReusableCell(withIdentifier: identTwo) as! ErkrordMyTableViewCell
//            cellTwo.backgroundColor = .gray
//            cellTwo.textLabel?.text = String(indexPath.row)
//            return cellTwo
//        default:
//            print("")
//        }
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
        default:
            print("ok")
        }
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

