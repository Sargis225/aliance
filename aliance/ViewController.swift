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

