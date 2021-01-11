//
//  SetupViewController.swift
//  aliance
//
//  Created by Saq on 1/9/21.
//

import UIKit

class SetupViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorArray.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ident = "cellIdentifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: ident) as! MyTableViewCell
        if indexPath.section == 0 {
        
            cell.backgroundColor = colorArray[indexPath.row]
            return cell
        }
        if indexPath.section == 1 {
            cell.textLabel?.text = language[indexPath.row]
            cell.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            return cell
        }
        if indexPath.section == 2 {
            cell.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            if indexPath.row == 1 {
                let slider = UISlider(frame: CGRect(x: 10, y: 8, width: cell.frame.width - 80, height: 20))
                slider.maximumValue = 100
                slider.minimumValue = 30
                slider.value = 60
                cell.textLabel?.textAlignment = .right
//                cell.textLabel?.text = String(Int(slider.value))
                slider.addTarget(self, action: #selector(changeTime), for: .valueChanged)
                cell.addSubview(slider)
                
            }
            return cell
        }
       return cell
    }
    
    @objc func changeTime (_ sender:UISlider) {
        
        let timeLabel = UILabel(frame: CGRect(x: sender.frame.origin.x + sender.frame.width + 8, y: sender.frame.origin.y * 49 , width: 30, height: 30))
        timeLabel.layer.cornerRadius = 10
        timeLabel.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        let value:Int = Int(sender.value)
        timeLabel.text = String(value)
        UserDefaults.standard.set(timeLabel.text ?? "",forKey: "timeIntervalKey")
        setupTableView.addSubview(timeLabel)
        
    }
    
    func updateLabels(uV: Float) {
        let newValue = uV
        if newValue != uV {
            
        }
    }
    let colorArray:[UIColor] = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1),#colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)]
    let language = ["Հայերեն","English","Русский"]
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let color = colorArray[indexPath.row]
            allAnkapLable.backgroundColor = color
            view.backgroundColor = color
            UserDefaults.standard.setColor(color: color, forKey: "colorKey")
        }
        if indexPath.section == 1{
            UserDefaults.standard.set(language[indexPath.row],forKey: "languageKey")
            switch indexPath.row {
            case 0:
                allAnkapLable.text = "Բոլոր Կարգավորումները"
                selectColorLabel.text = "Ընտրեք Գույնը"
            case 1:
                allAnkapLable.text = "All settings"
                selectColorLabel.text = "Select Color"
            case 2:
                allAnkapLable.text = "Общие настройки"
                selectColorLabel.text = "Выбирайте цвет"
            default:
                print("lav klni")
            }

        }
        
        
        
        
//        print(indexPath.row)
    }
    

    
    

    
    @IBOutlet var selectColorLabel: UILabel!
    @IBOutlet var allAnkapLable: UILabel!
    
    @IBOutlet var setupTableView: UITableView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allAnkapLable.layer.cornerRadius = 20
        setupTableView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        setupTableView.dataSource = self
        setupTableView.delegate = self
        // Do any additional setup after loading the view.
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

