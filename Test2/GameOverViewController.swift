//
//  GameOverViewController.swift
//  Test2
//
//  Created by Janet Meng on 11/19/21.
//

import UIKit

class GameOverViewController: UIViewController {
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var backToMainMenu: UIButton!
    @IBOutlet weak var finalScore: UILabel!
    @IBOutlet weak var playAgainIcon: UIImageView!
    @IBOutlet weak var backToMainMenuIcon: UIImageView!
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        let backgroundImage = UIImage.init(named: "background-gameover")
        let backgroundImageView = UIImageView.init(frame: self.view.frame)

        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.alpha = 0.5
        self.view.insertSubview(backgroundImageView, at: 0)
        
        gameOverLabel.center.x = self.view.center.x
        
        finalScore.center.x=self.view.center.x
        finalScore.text = "Your Score: \(score)"
        finalScore.textColor=UIColor.red
        finalScore.font=UIFont(name: "Arial", size: 36)
        
        playAgain.center.x=self.view.center.x
        playAgainIcon.center.x = self.view.center.x
        backToMainMenu.center.x=self.view.center.x
        backToMainMenuIcon.center.x = self.view.center.x

    }
    
    @IBAction func pressToPlayAgain(_ sender: Any) {
        print("play again, the button was pressed")
        self.navigationController?.popViewController(animated: true)
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
