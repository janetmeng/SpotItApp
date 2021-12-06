//
//  GameOverViewController.swift
//  Test2
//
//  Created by Janet Meng on 11/19/21.
//

import UIKit

class GameOverViewController: UIViewController {
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var backToMainMenu: UIButton!
    @IBOutlet weak var finalScore: UILabel!
    @IBOutlet weak var playAgainIcon: UIImageView!
    @IBOutlet weak var backToMainMenuIcon: UIImageView!
    @IBOutlet weak var finalScoreIcon: UIImageView!
    @IBOutlet weak var gameOver: UIImageView!
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
        
        gameOver.center.x = self.view.center.x
        
        finalScore.center.x=self.view.center.x
        finalScore.font=UIFont(name: "DIN Alternate", size: 36)
        finalScore.text = "Your Score: \(score)"
        finalScore.textColor=UIColor.blue
        
        playAgain.center.x=self.view.center.x
        playAgain.titleLabel?.font = UIFont(name: "DIN Alternate", size: 20)

        playAgainIcon.center.x = self.view.center.x
        
        backToMainMenu.center.x=self.view.center.x
        backToMainMenu.titleLabel?.font = UIFont(name: "DIN Alternate", size: 20)
        
        backToMainMenuIcon.center.x = self.view.center.x
        finalScoreIcon.center.x = self.view.center.x
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
