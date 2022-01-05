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
    @IBOutlet weak var ageIcon: UIImageView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var playAgainIcon: UIImageView!
    @IBOutlet weak var backToMainMenuIcon: UIImageView!
    @IBOutlet weak var finalScoreIcon: UIImageView!
    @IBOutlet weak var gameOver: UIImageView!
    var score: Int = 0
    var numberRounds: Int = 0
    var age: Int = -1
    
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
        
        ageIcon.center.x = self.view.center.x
        
        ageLabel.center.x = self.view.center.x
        ageLabel.textColor = UIColor.white
        if (score >= 0 && score < Int(numberRounds/4)){
            age = 50
        } else if (score >= Int(numberRounds/4) && score < Int(numberRounds/2)){
            age = 40
        } else if (score >= Int(numberRounds/2) && score < Int(3 * numberRounds/4)){
            age = 30
        } else if (score >= Int(3 * numberRounds/4) && score <= numberRounds){
            age = 20
        }
        ageLabel.font=UIFont(name: "DIN Alternate", size: 20)
        ageLabel.text = "Your Age: \(age)"
        
        comment.center.x = self.view.center.x
        comment.font = UIFont(name: "DIN Alternate", size: 17)
        if (age == 20){
            comment.text = "Amazing visual acuity!"
        } else if (age == 30){
            comment.text = "Not too bad!"
        } else if (age == 40){
            comment.text = "Could be better!"
        } else if (age == 50){
            comment.text = "Better luck next time!"
        }

        playAgain.center.x=self.view.center.x
        playAgain.titleLabel?.font = UIFont(name: "DIN Alternate", size: 20)

        playAgainIcon.center.x = self.view.center.x
        
        backToMainMenu.center.x=self.view.center.x
        backToMainMenu.titleLabel?.font = UIFont(name: "DIN Alternate", size: 20)
        
        backToMainMenuIcon.center.x = self.view.center.x
        finalScoreIcon.center.x = self.view.center.x
    }
    
    @IBAction func pressToPlayAgain(_ sender: Any) {
        print("Play again, the button was pressed")
        self.navigationController?.popViewController(animated: false) // previously it was true
    }
    
    @IBAction func pressToReturnToMainMenu(_ sender: Any) {
        print("Return to main menu, the button was pressed")
        navigationController?.popToRootViewController(animated: false)
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
