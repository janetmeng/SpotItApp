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
    @IBOutlet weak var gameLogo: UIImageView!
    
    @IBOutlet weak var startGameIcon: UIImageView!
    @IBOutlet weak var howToPlayIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("first controller IN GAME")
        
        //background
        let backgroundImage = UIImage.init(named: "background-1")
        let backgroundImageView = UIImageView.init(frame: self.view.frame)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.alpha = 0.5
        self.view.insertSubview(backgroundImageView, at: 0)
        
        startGameButton.center.x=self.view.center.x
        howToPlayButton.center.x=self.view.center.x
        gameLogo.center.x = self.view.center.x
        startGameIcon.center.x=self.view.center.x
        howToPlayIcon.center.x=self.view.center.x
    }
    
    @IBAction func showInstructions(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gameoverView = storyboard.instantiateViewController(withIdentifier: "instructionsvc")
        
        let backBarButtton = UIBarButtonItem(title: "Back to Main Menu", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtton
        
        self.navigationController?.pushViewController(gameoverView, animated: true)
    }

    @IBAction func startTheGame(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gameoverView = storyboard.instantiateViewController(withIdentifier: "StartGameViewId")
        
        let backBarButtton = UIBarButtonItem(title: "Quit Game", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtton
        
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
