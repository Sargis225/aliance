//
//  GamePlayViewController.swift
//  aliance
//
//  Created by Vigen Simonyan on 1/20/21.
//

import UIKit



class GamePlayViewController: UIViewController, CurrentGameViewControllerDelegate {
    
    func endGame(player: String, trueResult: Int) {
//        TODO: avelacnel ekac tvyalner@ exacin
        print(player)
        var indexPlayer = crews.firstIndex(of: player)
        if indexPlayer == crews.count - 1 {
            indexPlayer = -1
        }
        nextPlayer = crews[(indexPlayer ?? 0) + 1]
        print(trueResult)
    }
    
// TODO: cuyc tal @ndhanur ardyunq@ xxacoxneri

    var crews:[String]!
    var results:[Int] = []
    var isFirstAppear = true
    var nextPlayer: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isFirstAppear {
            nextPlayer = crews[0]
            performSegue(withIdentifier: "startGame", sender: nil)
        }
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        isFirstAppear = false
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CurrentGameViewController {
            vc.player = nextPlayer
            vc.delegate = self
        }
    }

}
