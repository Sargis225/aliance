//
//  CurrentGameResultViewController.swift
//  aliance
//
//  Created by Vigen Simonyan on 1/20/21.
//

import UIKit

protocol CurrentGameViewControllerDelegate {
    func endGame(player: String, trueResult: Int)
}

class CurrentGameViewController: UIViewController {
// TODO: kazmakerpel xax@ ev verjum uxarkel ardyunq@
    var player: String!
    var delegate: CurrentGameViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func endButtonPressed(_ sender: Any) {
        endGame()
    }
    
    func endGame() {
        delegate?.endGame(player: player, trueResult: 3)
        navigationController?.popViewController(animated: true)
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
