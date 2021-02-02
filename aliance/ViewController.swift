//
//  ViewController.swift
//  aliance
//
//  Created by Saq on 1/9/21.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet var playButton: UIButton!
    @IBOutlet var setupButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let color = UserDefaults.standard.colorForKey(key: "colorsKey") {
            self.view.backgroundColor = color
        }
        
        let langueage = UserDefaults.standard.string(forKey: "languageKey")
        switch langueage {
        case "English":
            playButton.setTitle("Play", for: .normal)
        case "Русский":
            playButton.setTitle("Играть", for: .normal)
        default:
            playButton.setTitle("Խաղալ", for: .normal)
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        playButton.layer.cornerRadius = 30
        setupButton.layer.cornerRadius = 20
        
        // Do any additional setup after loading the view.
    }

    @IBAction func playButtonPressed(_ sender: UIButton) {
        
    }
    
}

