//
//  StartGameViewController.swift
//  Test2
//
//  Created by Janet Meng on 11/19/21.
//

import UIKit

class StartGameViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var howToPlayButton: UIButton!
    @IBOutlet weak var gameLogo: UIImageView!
    
    @IBOutlet weak var startGameIcon: UIImageView!
    @IBOutlet weak var howToPlayIcon: UIImageView!
    @IBOutlet weak var picker: UIPickerView!
    var pickerData:[String] = [String]()
    var numberRounds: Int = 13 // initialize to a value in case the user does not move the UIPickerView (13 rounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("first controller IN GAME")
        
        self.picker.delegate = self
        self.picker.dataSource = self
        pickerData=["14 cards (1/4 deck)","28 cards (1/2 deck)","42 cards (3/4 deck)","57 cards (full deck)"]  // contains the number of cards: 13, 28, 42 or 57
        
        //background
        let backgroundImage = UIImage.init(named: "background-1")
        let backgroundImageView = UIImageView.init(frame: self.view.frame)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.alpha = 0.5
        self.view.insertSubview(backgroundImageView, at: 0)
        
        startGameButton.center.x=self.view.center.x
        startGameButton.titleLabel?.font = UIFont(name: "DIN Alternate", size: 20)
        
        howToPlayButton.center.x=self.view.center.x
        howToPlayButton.titleLabel?.font = UIFont(name: "DIN Alternate", size: 20)
        
        gameLogo.center.x = self.view.center.x
        startGameIcon.center.x=self.view.center.x
        howToPlayIcon.center.x=self.view.center.x
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        let numberOfCards  = Int(pickerData[row].split(separator: " ")[0]) ??  14  // from "14 cards" -> "14" (String) -> 14 (Integer) If we cannot split the string and get an integer value, then we set the value to 14 : ?? 14
            numberRounds =  numberOfCards - 1 // number of cards - 1 = number of rounds b/c of overlap
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)    // https://stackoverflow.com/questions/44223862/how-do-i-change-the-font-size-in-a-uipickerview-in-swift
        if pickerLabel == nil{
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "DIN Alternate", size: 24)
            pickerLabel?.textAlignment = .center
        }
        pickerLabel?.text = pickerData[row]
        pickerLabel?.textColor = UIColor(red: 0/255, green: 105/255, blue: 150/255, alpha: 1) //dark ocean blue
        
        return pickerLabel!
    }
    
    @IBAction func showInstructions(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainGameView = storyboard.instantiateViewController(withIdentifier: "instructionsvc")
        
        let backBarButtton = UIBarButtonItem(title: "Back to Main Menu", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtton
        
        self.navigationController?.pushViewController(mainGameView, animated: true)
    }

    @IBAction func startTheGame(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainGameView = storyboard.instantiateViewController(withIdentifier: "StartGameViewId") as! CardCollectionViewController    // force mainGameView to be instanciated as a CardCollectionViewController object
       
        mainGameView.numberRounds = numberRounds
        print("number of rounds chosen (startGameViewController)= " + String(numberRounds))
        
        let backBarButtton = UIBarButtonItem(title: "Quit Game", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtton
        
        self.navigationController?.pushViewController(mainGameView, animated: true)
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
