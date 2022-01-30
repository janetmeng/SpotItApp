//
//  InstructionsViewController.swift
//  Test2
//
//  Created by Janet Meng on 11/20/21.
//

import UIKit

class InstructionsViewController: UIViewController {
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var instructionsTitle: UILabel!
    @IBOutlet weak var instructionsDescriptionn: UILabel!
    @IBOutlet weak var scrollViewforInstructions: UIScrollView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImage.init(named: "background-instructions")
        let backgroundImageView = UIImageView.init(frame: self.view.frame)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.alpha = 0.7
        self.view.insertSubview(backgroundImageView, at: 0)
        
        scrollViewforInstructions.contentSize=CGSize(width: scrollViewforInstructions.frame.width * 1, height: scrollViewforInstructions.frame.height * 1.5)
        print("scrollViewForInstructions= \(scrollViewforInstructions.frame.width)") // to debug
        print("scrollViewForInstructions= \(scrollViewforInstructions.frame.height * 1.5)") // to debug
        scrollViewforInstructions.center.x = self.view.center.x
        instructionsTitle.textColor=UIColor(red: 0/255, green: 105/255, blue: 150/255, alpha: 1)
        instructionsTitle.font=UIFont(name: "DIN Alternate", size: 40)
        instructionsTitle.center.x = self.view.center.x
        
        instructionsDescriptionn.font=UIFont(name: "DIN Alternate", size: 20)
        instructionsDescriptionn.textColor=UIColor(red: 0/255, green: 105/255, blue: 150/255, alpha: 1)
    
        
        let backBarButtton = UIBarButtonItem(title: "Back to Main Menu", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtton
    }
  
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation){ //when device has rotated horizontal
        print("device has rotated")
        viewDidLoad()
    }
    
    @IBAction func pressToStartGame(_ sender: Any) {
        print("start playing, the button was pressed")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "StartGameViewId")
        let backBarButtton = UIBarButtonItem(title: "Quit Game", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtton
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
