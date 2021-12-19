//
//  StartGameViewController.swift
//  Test2
//
//  Created by Janet Meng on 11/19/21.
//

import UIKit

class StartGameViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate{
       
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var howToPlayButton: UIButton!
    @IBOutlet weak var gameLogo: UIImageView!
    
    @IBOutlet weak var startGameIcon: UIImageView!
    @IBOutlet weak var howToPlayIcon: UIImageView!
    
    @IBOutlet weak var fieldCardNumber: UITextField!
    
    let pickerView = UIPickerView()
    var pickerData:[String] = [String]()
    var numberRounds: Int = 27 //needs to be initialized to one real value (27), for the case where the user does not move the UIPickerView
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor=UIColor(red: 0/255, green: 105/255, blue: 150/255, alpha: 1)
        print("first controller IN GAME")
        fieldCardNumber.center.x = self.view.center.x
        fieldCardNumber.backgroundColor = UIColor.clear
        //fieldCardNumber.borderStyle = .none
        //fieldCardNumber.layer.borderColor=CGColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        fieldCardNumber.textColor = UIColor(red: 0/255, green: 105/255, blue: 150/255, alpha: 1)
        fieldCardNumber.font=UIFont(name: "DIN Alternate", size: 24)
        createPickerView()
        dismissPickerView()
        
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
        fieldCardNumber.text = pickerData[row]
        let numberOfCards  = Int(pickerData[row].split(separator: " ")[0]) ??  28     // from "28 cards" -> "28" (String)  -> 28 (Integer).  if we can not split the string and get an integer value, then we set the value to 28 : ?? 28
            numberRounds  =  numberOfCards - 1   // we substract 1, to get the number of round
        print(String(numberOfCards) + " cards was selected")
    }
  
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
     
        var pickerLabel: UILabel? = (view as? UILabel)    //https://stackoverflow.com/questions/44223862/how-do-i-change-the-font-size-in-a-uipickerview-in-swift
        if pickerLabel == nil{
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "DIN Alternate", size: 24)
            pickerLabel?.textAlignment = .center
        }
        pickerLabel?.text = pickerData[row]
        pickerLabel?.textColor = UIColor(red: 28/255, green: 183/255, blue: 255/255, alpha: 1)
        // pickerLabel?.textColor = UIColor.white
        return pickerLabel!
    }
    
    func createPickerView() {
        pickerData=["7 cards","14 cards","28 cards","42 cards","57 cards"]  // contains the number of cards
        pickerView.backgroundColor=UIColor(red: 0/255, green: 105/255, blue: 150/255, alpha: 1)
        fieldCardNumber.inputView = pickerView
        pickerView.delegate = self
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar(frame:CGRect(x: 0, y: 0, width: 100, height: 100)) //gives constraints warnings for iPad at the moment, no notable change on app playing on real device though
        toolBar.sizeToFit()
        
        // Workaround to remove autolayout errors when keyboard shows on iPad.
        // Side effect: Removes the redo/undo and paste buttons from the keyboard
        let item = fieldCardNumber.inputAssistantItem // https://developer.apple.com/forums/thread/667441
        item.leadingBarButtonGroups = []
        item.trailingBarButtonGroups = []

        toolBar.backgroundColor=UIColor(red: 0/255, green: 105/255, blue: 150/255, alpha: 1)
        
        let button = UIBarButtonItem(title: "Done", style: .plain, target:self,action: #selector(onClose))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        fieldCardNumber.inputAccessoryView = toolBar
        pickerView.selectRow(2, inComponent: 0, animated: true)
    }
    
    @objc func onClose(sender: UIBarButtonItem) {
        view.endEditing(true)
    }

    @IBAction func showInstructions(_ sender: Any) {
        view.endEditing(true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainGameView = storyboard.instantiateViewController(withIdentifier: "instructionsvc")
        
        let backBarButtton = UIBarButtonItem(title: "Back to Main Menu", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtton
        navigationItem.backBarButtonItem?.tintColor=UIColor.white
        
        self.navigationController?.pushViewController(mainGameView, animated: true)
    }

    @IBAction func startTheGame(_ sender: Any) {
        view.endEditing(true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainGameView = storyboard.instantiateViewController(withIdentifier: "StartGameViewId") as! CardCollectionViewController    // force mainGameView to be instanciated as a CardCollectionViewController object
       
        mainGameView.numberRounds = numberRounds
        print("number of rounds chosen = " + String(numberRounds))
        
        let backBarButtton = UIBarButtonItem(title: "Quit Game", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtton
        navigationItem.backBarButtonItem?.tintColor=UIColor.white
        
        self.navigationController?.pushViewController(mainGameView, animated: true)
        fieldCardNumber.text = "Choose the number of Cards"
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
