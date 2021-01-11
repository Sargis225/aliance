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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ident = "cellIdentifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: ident) as! MyTableViewCell
//        cell.backgroundColor = #colorLiteral(red: 0.7753943248, green: 0.9764705896, blue: 0.9551795097, alpha: 1)
        cell.backgroundColor = colorArray[indexPath.row]
//       if indexPath.row == 0 {
//        let imageView = UIImageView(image: #imageLiteral(resourceName: "clip-transparent-download-and-brush-line-art-free-clip-paint-palette-clipart-11563244939gsykmaqt2d"))
//        imageView.frame = CGRect(x: 0, y: 0, width: 40, height: cell.frame.height)
//        cell.addSubview(imageView)
//        cell.textLabel?.textAlignment = .center
//        cell.textLabel?.text = "etnaguyn"
//        let items = ["gunavor","mug","non"]
//       let  segmentControl = UISegmentedControl(items: items)
//        segmentControl.frame = CGRect(x: 60, y: 0, width: cell.frame.width - 70, height: cell.frame.height)
//        segmentControl.actionForSegment(at: 3)
//        segmentControl.backgroundColor = .white
//        segmentControl.selectedSegmentIndex = 0
//        print(segmentControl.selectedSegmentIndex)
//        segmentControl.addTarget(self, action: #selector(changeColor), for: .valueChanged)
//        cell.addSubview(segmentControl)
//        return cell
//        }
        
        
        return cell
    }
    
    let colorArray:[UIColor] = [.black,.green,.white]
    
   // change from other comp
    
   // change himnakan
    
    // finish my work Other comp
    
//    @objc func changeColor(sender: UISegmentedControl) {
////        let naxordViewController = ViewController()
////        let khmberViewController = KhmberViewController()
//        var color = UIColor()
//        switch sender.selectedSegmentIndex {
//        case 0:
//            view.backgroundColor = #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)
//            allAnkapLable.backgroundColor = #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)
//            setupTableView.backgroundColor = #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)
//            color = #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)
//        case 1:
//
//            view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
//            allAnkapLable.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
//            setupTableView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
//            color = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
//
//        case 2:
//            view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//            color = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//            allAnkapLable.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
//            setupTableView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
//
//        default:
//            print("ok")
//        }
//        UserDefaults.standard.setColor(color: color, forKey: "colorKey")
//
//    }
    
    

    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colorArray[indexPath.row]
        allAnkapLable.backgroundColor = color
        setupTableView.backgroundColor = color
        view.backgroundColor = color
        UserDefaults.standard.setColor(color: color, forKey: "colorKey")
//        print(indexPath.row)
    }
    

    
    

    
    @IBOutlet var allAnkapLable: UILabel!
    
    @IBOutlet var setupTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allAnkapLable.layer.cornerRadius = 20
        setupTableView.backgroundColor = #colorLiteral(red: 1, green: 0.2092504284, blue: 0.8314632435, alpha: 1)
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

