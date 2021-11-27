//
//  StartGameViewViewController.swift
//  Test2
//
//  Created by Janet Meng on 11/19/21.
//

import UIKit

class StartGameViewViewController: UIViewController {
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var startGameButton: UIButton!
    
    @IBOutlet weak var howToPlayButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("first controller IN GAME")
        let backgroundImage = UIImage.init(named: "background")
        let backgroundImageView = UIImageView.init(frame: self.view.frame)

        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.alpha = 0.5

        self.view.insertSubview(backgroundImageView, at: 0)
        
        self.navigationItem.backButtonTitle = "Quit Game"
    }
    
    /*
    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("first controller IN GAME")
        let backgroundImage = UIImage(named: "waterSplash")
        view.backgroundColor = UIColor(patternImage: backgroundImage!)
        
        howToPlayButton.center.x = self.view.center.x
        startGameButton.center.x = self.view.center.x
    }
    */
    
    @IBAction func showInstructions(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gameoverView = storyboard.instantiateViewController(withIdentifier: "instructionsvc")
        self.navigationController?.pushViewController(gameoverView, animated: true)
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
