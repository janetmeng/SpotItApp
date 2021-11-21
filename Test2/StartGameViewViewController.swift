//
//  StartGameViewViewController.swift
//  Test2
//
//  Created by Janet Meng on 11/19/21.
//

import UIKit

class StartGameViewViewController: UIViewController {
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print("first controller IN GAME")
        let image1=UIImage(named: "waterSplash")
        view.backgroundColor = UIColor(patternImage: image1!)
    }
    @IBAction func showInstructions(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gameoverView = storyboard.instantiateViewController(withIdentifier: "instructionsvc")
        self.navigationController?.pushViewController(gameoverView, animated: true)
        //show(gameoverView, sender: self)
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
