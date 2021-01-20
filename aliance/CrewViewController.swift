//
//  CrewViewController.swift
//  aliance
//
//  Created by Vigen Simonyan on 1/20/21.
//

import UIKit

class CrewViewController: UIViewController {
//    TODO: stexcel mexanizm nor tim avelacnelu u heracnelu
    var crews:[String] = ["team 1", "team2", "Gugoyenq"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    

 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? GamePlayViewController {
            vc.crews = crews
        }
    }

}
