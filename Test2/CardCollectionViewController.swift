//
//  CardCollectionViewController.swift
//  Test2
//
//  Created by Janet Meng on 10/18/21.
//

import UIKit

private let reuseIdentifier = "Cell"

class CardCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
        
    private var symbols : [Symbol] = [ Symbol(image: "Algae", name: "algae"),
                                        Symbol(image: "Beach", name: "beach-1"),
                                        Symbol(image: "Buoy", name: "buoy"),
                                        Symbol(image: "Clam", name: "clam"),
                                        Symbol(image: "Clownfish", name: "clownfish-1"),
                                        Symbol(image: "Coastline", name: "coastline"),
                                        Symbol(image: "Compass", name: "compass"),
                                        Symbol(image: "Conch Shell", name: "conchshell"),
                                        Symbol(image: "Coral", name: "coral"),
                                        Symbol(image: "Crab", name: "crab"),
                                        Symbol(image: "Crocodile", name: "crocodile"),
                                        Symbol(image: "Diver", name: "diver"),
                                        Symbol(image: "Dolphin", name: "dolphin"),
                                        Symbol(image: "Eel", name: "eel"),
                                        Symbol(image: "Exclamation Mark", name: "exclamationMark"),
                                        Symbol(image: "Eyepatch", name: "eyepatch"),
                                        Symbol(image: "Fins", name: "fins"),
                                        Symbol(image: "Fishing Rod", name: "fishingRod"),
                                        Symbol(image: "Go", name: "go"),
                                        Symbol(image: "High Tide", name: "highTide"),
                                        Symbol(image: "Island", name: "island"),
                                        Symbol(image: "Jellyfish", name: "jellyfish"),
                                        Symbol(image: "Kelp", name: "kelp"),
                                        Symbol(image: "Lantern Fish", name: "lanternFish"),
                                        Symbol(image: "Manatee", name: "manatee"),
                                        Symbol(image: "Narwhal", name: "narwhal"),
                                        Symbol(image: "Octopus", name: "octopus"),
                                        Symbol(image: "Orca", name: "orca"),
                                        Symbol(image: "Otter", name: "otter2"),
                                        Symbol(image: "Penguin", name: "penguin"),
                                        Symbol(image: "Salmon", name: "salmon"),
                                        Symbol(image: "Seagull", name: "seagull"),
                                        Symbol(image: "Seahorse", name: "seahorse-1"),
                                        Symbol(image: "Sea Dragon", name: "seaDragon"),
                                        Symbol(image: "Sea Lion", name: "sealion"),
                                        Symbol(image: "Serpent", name: "serpent"),
                                        Symbol(image: "Shark", name: "shark-1"),
                                        Symbol(image: "Ship", name: "ship"),
                                        Symbol(image: "Ship Wheel", name: "shipwheel"),
                                        Symbol(image: "Shrimp", name: "shrimp"),
                                        Symbol(image: "Smiley Face", name: "smileyFace"),
                                        Symbol(image: "Sponge", name: "sponge"),
                                        Symbol(image: "Squid", name: "squid"),
                                        Symbol(image: "Starfish", name: "starfish"),
                                        Symbol(image: "Stingray", name: "stingrayReal"),
                                        Symbol(image: "Surfboard", name: "surfboard"),
                                        Symbol(image: "Treasure", name: "treasure"),
                                        Symbol(image: "Trident", name: "trident"),
                                        Symbol(image: "Turtle", name: "turtle"),
                                        Symbol(image: "Water Drop", name: "waterDrop"),
                                        Symbol(image: "Water Splash", name: "waterSplash"),
                                        Symbol(image: "Walrus", name: "walrus-1"),
                                        Symbol(image: "Wave", name: "wave"),
                                        Symbol(image: "Whale", name: "whale"),
                                        Symbol(image: "Willow", name: "willow"),
                                        Symbol(image: "Yacht", name: "yacht"),
                                        Symbol(image: "Yay", name: "yay")]

    private var deck: [[Int]] = [[1, 2, 3, 4, 5, 6, 7, 8], [1, 9, 10, 11, 12, 13, 14, 15], [1, 16, 17, 18, 19, 20, 21, 22], [1, 23, 24, 25, 26, 27, 28, 29], [1, 30, 31, 32, 33, 34, 35, 36], [1, 37, 38, 39, 40, 41, 42, 43], [1, 44, 45, 46, 47, 48, 49, 50], [1, 51, 52, 53, 54, 55, 56, 57], [2, 9, 16, 23, 30, 37, 44, 51], [2, 10, 17, 24, 31, 38, 45, 52], [2, 11, 18, 25, 32, 39, 46, 53], [2, 12, 19, 26, 33, 40, 47, 54], [2, 13, 20, 27, 34, 41, 48, 55], [2, 14, 21, 28, 35, 42, 49, 56], [2, 15, 22, 29, 36, 43, 50, 57], [3, 9, 17, 25, 33, 41, 49, 57], [3, 10, 18, 26, 34, 42, 50, 51], [3, 11, 19, 27, 35, 43, 44, 52], [3, 12, 20, 28, 36, 37, 45, 53], [3, 13, 21, 29, 30, 38, 46, 54], [3, 14, 22, 23, 31, 39, 47, 55], [3, 15, 16, 24, 32, 40, 48, 56], [4, 9, 18, 27, 36, 38, 47, 56], [4, 10, 19, 28, 30, 39, 48, 57], [4, 11, 20, 29, 31, 40, 49, 51], [4, 12, 21, 23, 32, 41, 50, 52], [4, 13, 22, 24, 33, 42, 44, 53], [4, 14, 16, 25, 34, 43, 45, 54], [4, 15, 17, 26, 35, 37, 46, 55], [5, 9, 19, 29, 32, 42, 45, 55], [5, 10, 20, 23, 33, 43, 46, 56], [5, 11, 21, 24, 34, 37, 47, 57], [5, 12, 22, 25, 35, 38, 48, 51], [5, 13, 16, 26, 36, 39, 49, 52], [5, 14, 17, 27, 30, 40, 50, 53], [5, 15, 18, 28, 31, 41, 44, 54], [6, 9, 20, 24, 35, 39, 50, 54], [6, 10, 21, 25, 36, 40, 44, 55], [6, 11, 22, 26, 30, 41, 45, 56], [6, 12, 16, 27, 31, 42, 46, 57], [6, 13, 17, 28, 32, 43, 47, 51], [6, 14, 18, 29, 33, 37, 48, 52], [6, 15, 19, 23, 34, 38, 49, 53], [7, 9, 21, 26, 31, 43, 48, 53], [7, 10, 22, 27, 32, 37, 49, 54], [7, 11, 16, 28, 33, 38, 50, 55], [7, 12, 17, 29, 34, 39, 44, 56], [7, 13, 18, 23, 35, 40, 45, 57], [7, 14, 19, 24, 36, 41, 46, 51], [7, 15, 20, 25, 30, 42, 47, 52], [8, 9, 22, 28, 34, 40, 46, 52], [8, 10, 16, 29, 35, 41, 47, 53], [8, 11, 17, 23, 36, 42, 48, 54], [8, 12, 18, 24, 30, 43, 49, 55], [8, 13, 19, 25, 31, 37, 50, 56], [8, 14, 20, 26, 32, 38, 44, 57], [8, 15, 21, 27, 33, 39, 45, 51]]
    
    private var tappedSymbol1 = Symbol(image: "", name: "")
    private var tappedSymbol2 = Symbol(image: "", name: "")
    private var decknumber: Int = 0    // decknumber starts at 0. incremented at each win
    private var timer: Timer  = Timer()
    public  let maxseconds: Int = 8  // seconds
    private var counter: Int = 8  // seconds
    private var mysectionheader: CardCollectionReusableView = CardCollectionReusableView()
    private var score: Int = 0
    
    private var pressedcard1: [Bool]=[false,false,false,false,false,false,false,false]  //no cell was pressed on card 1 at beginning. This boolean serves to keep track of the currently selected symbol on card 1 (selected-> true.  not selected-> false)
    private var pressedcard2: [Bool]=[false,false,false,false,false,false,false,false]  //no cell was pressed on card 2 at beginning
    private var previouscell1: IndexPath = IndexPath(row: 0, section: 2)  // previous cell pressed in card 1 (we keep record)
    private var previouscell2: IndexPath = IndexPath(row: 0, section: 2)  //same as above for card 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        deck.shuffle()
        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 2
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 8
    }
 
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dataCell", for: indexPath) as! CardCollectionViewCell
        cell.symbolImageView.backgroundColor=UIColor.init(white: 1, alpha: 0.5)   // to make the background white (instead of grey)
        
        if (indexPath.section == 0){ //master card (card at top of phone screen)
            let indexIntoNestedArray1 = deck[decknumber][indexPath.row]
            let theSymbol1 = symbols[indexIntoNestedArray1-1]
            cell.symbolImageView.image = UIImage(named: theSymbol1.name)
        }
        else if (indexPath.section == 1 && (decknumber <= deck.count - 2)){ //player's card (card at bottom of phone screen)
            let indexIntoNestedArray2 = deck[decknumber+1][indexPath.row]
            let theSymbol2 = symbols[indexIntoNestedArray2-1]
            cell.symbolImageView.image = UIImage(named: theSymbol2.name)
        }
       //Configure the cell
        return cell
    }
    
    // called every time interval from the timer
    @objc func timerAction(){
        counter -= 1
        if (counter > 1){
            mysectionheader.sectionHeaderTimer.text = String(counter) + " seconds left"
            
        } else if (counter <= 1){
            mysectionheader.sectionHeaderTimer.text = String(counter) + " second left"
        }
        
        if (counter<0){
            decknumber+=1
            if (decknumber<=deck.count - 2){
                print("Deck number = " + String(decknumber))
                print("Number of decks = " + String(deck.count))
                tappedSymbol1 = Symbol(image: "", name: "")
                tappedSymbol2 = Symbol(image: "", name: "")
                score-=10
                if (score<0){
                    score=0
                }
                clear_all_highlighted_cells_section()   // clear all selections
                timer.invalidate()
                counter=maxseconds
                collectionView.reloadData()
            } else { //decknumber is 56 (last set of cards){
                print("End of game. We have displayed all the decks. Launch PopOver View")
                print("Deck number = " + String(decknumber))
                timer.invalidate()
                showGameOver()
                counter=maxseconds
                decknumber=0
                collectionView.reloadData()  // try to play again (After button "play again was pressed")
            }
        }
    }
 
    @IBAction func quitGame(_ sender: Any) {
        print("stop playing & return to main menu, the button was pressed")
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func showGameOver(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gameoverView = storyboard.instantiateViewController(withIdentifier: "modal1")
        self.navigationController?.pushViewController(gameoverView, animated: true)
        //show(gameoverView, sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/4.0
        let yourHeight = yourWidth

        return CGSize(width: yourWidth, height: yourHeight)
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
          return UIEdgeInsets.zero
     }

     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         return 0
     }

     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return 0
     }
    

    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool{
        findPairs(indexPath)
        return true
    }
    
    func findPairs(_ myCellIndex: IndexPath){
        let res = get_symbol(x: myCellIndex.section + decknumber, y: myCellIndex.row)   // tapped 1 time (on the symbol). means the symbol has been selected
        
        if (myCellIndex.section == 0){
            pressedcard1[myCellIndex.row] = !pressedcard1[myCellIndex.row]   //NEW
            tappedSymbol1=Symbol(image:res[1],name:res[2])
            print("section 0 ; ")
            print(tappedSymbol1)
            print("\n")
            
            clear_all_highlighted_cells_section(0)   // clear all selections in card 1 (the card on the top)
            
            if (myCellIndex != previouscell1){ // case where the previous symbol is not the same as the new tapped symbol
                let cell = collectionView.cellForItem(at: myCellIndex) as! CardCollectionViewCell
                cell.layer.borderWidth = 3.0
                cell.layer.borderColor = UIColor.red.cgColor
                pressedcard1[previouscell1.row] = false   //NEW
            } else if (myCellIndex == self.previouscell1 && !pressedcard1[myCellIndex.row]){  // case where we tap on the same symbol several times and previously it was highlighted (red square). After tapping, it get unhighlighted.   Each symbol of card 1, has its state stored in the boolean array pressedcard1
                let cell = collectionView.cellForItem(at: myCellIndex) as! CardCollectionViewCell
                cell.layer.borderWidth = 0.0
            }
            else if (myCellIndex == self.previouscell1 && pressedcard1[myCellIndex.row]){ // case where we tap on the same symbol 2 several times, and previously it was not highlighted. After tapping, it gets highlighted
                let cell = collectionView.cellForItem(at: myCellIndex) as! CardCollectionViewCell
                cell.layer.borderWidth = 3.0
                cell.layer.borderColor = UIColor.red.cgColor
            }
            self.previouscell1 = myCellIndex
        }
        else if (myCellIndex.section == 1){ // the principle is the same as for card 1 (here for card 2)
            pressedcard2[myCellIndex.row] = !pressedcard2[myCellIndex.row]   //NEW
            tappedSymbol2=Symbol(image: res[1], name: res[2])
            print ("section 1 ; ")
            print(tappedSymbol2)
            print("\n")
            
            clear_all_highlighted_cells_section(1)  // clear all selections in card 2 (the card on the bottom)
            
            if (myCellIndex != previouscell2){
                let cell = collectionView.cellForItem(at: myCellIndex) as! CardCollectionViewCell
                cell.layer.borderWidth = 3.0
                cell.layer.borderColor = UIColor.red.cgColor
                pressedcard2[previouscell2.row] = false   //NEW
            } else if (myCellIndex == self.previouscell2 && !pressedcard2[myCellIndex.row]){
                let cell = collectionView.cellForItem(at: myCellIndex) as! CardCollectionViewCell
                cell.layer.borderWidth = 0.0
            } else if (myCellIndex == self.previouscell2 && pressedcard2[myCellIndex.row]) {
                let cell = collectionView.cellForItem(at: myCellIndex) as! CardCollectionViewCell
                cell.layer.borderWidth = 3.0
                cell.layer.borderColor = UIColor.red.cgColor
            }
            self.previouscell2 = myCellIndex
        }
        
        if (tappedSymbol1.name==tappedSymbol2.name){
            decknumber+=1
            if (decknumber <= deck.count - 2){
                print("Deck number = " + String(decknumber))
                print("Number of decks = " + String(deck.count))
                
                score += 8
                tappedSymbol1 = Symbol(image: "", name: "")
                tappedSymbol2 = Symbol(image: "", name: "")
            
                clear_all_highlighted_cells_section()   // clear all selections
                timer.invalidate()
                counter=maxseconds
                reinitarrays()
                collectionView.reloadData() // will run cellForItemAt method to redraw the 2 cards
            }
            else{
                print("End of game, we have displayed all the decks. Launch PopOver View")
                print("Deck number = " + String(decknumber))
                timer.invalidate()
                showGameOver()
                counter=maxseconds
                decknumber=0
                reinitarrays()
                collectionView.reloadData()  // try to play again (After button "play again was pressed")
            }
        }
    }
    
    func reinitarrays(){ // function to reinitialize the state of the tapped symbols (1 is for card1.  2 is for card 2)
        pressedcard1 = [false,false,false,false,false,false,false,false]
        pressedcard2 = [false,false,false,false,false,false,false,false]
        previouscell1 = IndexPath(row: 0, section: 2)
        previouscell2 = IndexPath(row: 0, section: 2)
    }
    
    func clear_all_highlighted_cells_section (_ cardnumber : Int? = nil){
        let allCells = collectionView.indexPathsForVisibleItems
        if (cardnumber == nil){
                for k in allCells{
                    let cell = collectionView.cellForItem(at: k) as! CardCollectionViewCell
                    cell.layer.borderWidth = 0.0
                    cell.symbolImageView.alpha = 1
                }
        } else{
            for k in allCells{
               if (k.section == cardnumber){
                   let cell = collectionView.cellForItem(at: k) as! CardCollectionViewCell
                    cell.layer.borderWidth = 0.0
               }
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath){
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        print("HEADER: " + String(indexPath.section) + " : " + String(indexPath.row))
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? CardCollectionReusableView{
            
            if (indexPath.section == 0){
                sectionHeader.sectionHeaderTimer.center.x=self.view.center.x
                sectionHeader.sectionHeaderTimer.textColor=UIColor.black
                sectionHeader.sectionHeaderTimer.text=String(counter) + " seconds left"
                
                sectionHeader.sectionHeaderlabel.center.x=self.view.center.x    
                sectionHeader.sectionHeaderlabel.text = "Score: \(score)"
                sectionHeader.sectionHeaderlabel.textColor=UIColor.red
                sectionHeader.sectionHeaderlabel.font=UIFont(name: "Arial", size: 44)
            
                sectionHeader.sectionHeaderCard.center.x=self.view.center.x
                sectionHeader.sectionHeaderCard.font=UIFont(name: "Arial", size: 18)
                sectionHeader.sectionHeaderCard.textColor = UIColor.black
                sectionHeader.sectionHeaderCard.text = "Card 1"
                
                sectionHeader.sectionHeaderQuit.center.x=self.view.center.x
                sectionHeader.sectionHeaderQuit.isHidden = false

                mysectionheader = sectionHeader
                // start the timer
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
            } else if (indexPath.section == 1){
    
                sectionHeader.sectionHeaderlabel.text = "Score: \(score)"
                sectionHeader.sectionHeaderlabel.textColor=UIColor.white
                sectionHeader.sectionHeaderlabel.font=UIFont(name: "Arial", size: 48)
                
                sectionHeader.sectionHeaderTimer.text=String(counter) + " seconds left"
                sectionHeader.sectionHeaderTimer.textColor = UIColor.white
          
                sectionHeader.sectionHeaderCard.center.x=self.view.center.x
                sectionHeader.sectionHeaderCard.font=UIFont(name: "Arial", size: 18)
                sectionHeader.sectionHeaderCard.textColor = UIColor.black
                sectionHeader.sectionHeaderCard.text = "Card 2"
           
                sectionHeader.sectionHeaderQuit.center.x=self.view.center.x
                sectionHeader.sectionHeaderQuit.isHidden = true
            }
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
    func get_symbol(x: Int,y: Int) -> Array<String>{
        let section :String = String(format: "%d", x)
        let indexIntoNestedArray1 = deck[x][y]
        let theSymbol = symbols[indexIntoNestedArray1-1]
        return [section, theSymbol.image, theSymbol.name,String(y)]
    }
    
  /*
    // MARK: UICollectionViewDelegate

    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {

    }
    */
}
