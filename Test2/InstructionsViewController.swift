//
//  InstructionsViewController.swift
//  Test2
//
//  Created by Janet Meng on 11/20/21.
//

import UIKit

class InstructionsViewController: UIViewController {
    @IBOutlet weak var startGame: UIButton!
    @IBOutlet weak var returnToMainMenu: UIButton!
    @IBOutlet weak var instructionsDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   self.navigationItem.setHidesBackButton(true, animated: true)

        // Do any additional setup after loading the view.
        
/*
       // only use this code if we end up creating segue from startGameVC to instructionsVC
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "instructionsvc")
        self.navigationController?.pushViewController(vc, animated: true)
 */
    }
    
    @IBAction func pressToStartGame(_ sender: Any) {
        print("start playing, the button was pressed")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "StartGameViewId")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func pressToReturnToMainMenu(_ sender: Any) {
        print("stop playing & return to main menu, the button was pressed")
        navigationController?.popToRootViewController(animated: true)
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
