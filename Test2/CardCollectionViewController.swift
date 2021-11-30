import UIKit
import AVFoundation

private let reuseIdentifier = "Cell"
private var player: AVAudioPlayer!

class CardCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
        
    private var symbols : [Symbol] = [ Symbol(image: "Algae", name: "algae"),
                                        Symbol(image: "Beach", name: "beach-1"),
                                        Symbol(image: "Buoy", name: "buoy"),
                                        Symbol(image: "Clam", name: "clam"),
                                        Symbol(image: "Clownfish", name: "clownfish-1"),
                                        Symbol(image: "Compass", name: "compass"),
                                        Symbol(image: "Conch Shell", name: "conchshell"),
                                        Symbol(image: "Coral", name: "coral"),
                                        Symbol(image: "Crab", name: "crab"),
                                        Symbol(image: "Crocodile", name: "crocodile"),
                                        Symbol(image: "Diver", name: "diver"),
                                        Symbol(image: "Dolphin", name: "dolphin-1"),
                                        Symbol(image: "Eel", name: "eel"),
                                        Symbol(image: "Exclamation Mark", name: "exclamationMark"),
                                        Symbol(image: "Eyepatch", name: "eyepatch"),
                                        Symbol(image: "Fins", name: "fins"),
                                        Symbol(image: "Fishing Rod", name: "fishingRod"),
                                        Symbol(image: "Go", name: "go-1"),
                                        Symbol(image: "High Tide", name: "highTide"),
                                        Symbol(image: "Island", name: "island"),
                                        Symbol(image: "Jellyfish", name: "jellyfish"),
                                        Symbol(image: "Kelp", name: "kelp-1"),
                                        Symbol(image: "Lantern Fish", name: "lanternFish"),
                                        Symbol(image: "Lighthouse", name: "lighthouse"),
                                        Symbol(image: "Manatee", name: "manatee"),
                                        Symbol(image: "Narwhal", name: "narwhal-1"),
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
                                        Symbol(image: "Yacht", name: "yacht-1"),
                                        Symbol(image: "Yay", name: "yay")]

    private var deck: [[Int]] = [[1, 2, 3, 4, 5, 6, 7, 8], [1, 9, 10, 11, 12, 13, 14, 15], [1, 16, 17, 18, 19, 20, 21, 22], [1, 23, 24, 25, 26, 27, 28, 29], [1, 30, 31, 32, 33, 34, 35, 36], [1, 37, 38, 39, 40, 41, 42, 43], [1, 44, 45, 46, 47, 48, 49, 50], [1, 51, 52, 53, 54, 55, 56, 57], [2, 9, 16, 23, 30, 37, 44, 51], [2, 10, 17, 24, 31, 38, 45, 52], [2, 11, 18, 25, 32, 39, 46, 53], [2, 12, 19, 26, 33, 40, 47, 54], [2, 13, 20, 27, 34, 41, 48, 55], [2, 14, 21, 28, 35, 42, 49, 56], [2, 15, 22, 29, 36, 43, 50, 57], [3, 9, 17, 25, 33, 41, 49, 57], [3, 10, 18, 26, 34, 42, 50, 51]/*, [3, 11, 19, 27, 35, 43, 44, 52], [3, 12, 20, 28, 36, 37, 45, 53], [3, 13, 21, 29, 30, 38, 46, 54], [3, 14, 22, 23, 31, 39, 47, 55], [3, 15, 16, 24, 32, 40, 48, 56], [4, 9, 18, 27, 36, 38, 47, 56], [4, 10, 19, 28, 30, 39, 48, 57], [4, 11, 20, 29, 31, 40, 49, 51], [4, 12, 21, 23, 32, 41, 50, 52], [4, 13, 22, 24, 33, 42, 44, 53], [4, 14, 16, 25, 34, 43, 45, 54], [4, 15, 17, 26, 35, 37, 46, 55], [5, 9, 19, 29, 32, 42, 45, 55], [5, 10, 20, 23, 33, 43, 46, 56], [5, 11, 21, 24, 34, 37, 47, 57], [5, 12, 22, 25, 35, 38, 48, 51], [5, 13, 16, 26, 36, 39, 49, 52], [5, 14, 17, 27, 30, 40, 50, 53], [5, 15, 18, 28, 31, 41, 44, 54], [6, 9, 20, 24, 35, 39, 50, 54], [6, 10, 21, 25, 36, 40, 44, 55], [6, 11, 22, 26, 30, 41, 45, 56], [6, 12, 16, 27, 31, 42, 46, 57], [6, 13, 17, 28, 32, 43, 47, 51], [6, 14, 18, 29, 33, 37, 48, 52], [6, 15, 19, 23, 34, 38, 49, 53], [7, 9, 21, 26, 31, 43, 48, 53], [7, 10, 22, 27, 32, 37, 49, 54], [7, 11, 16, 28, 33, 38, 50, 55], [7, 12, 17, 29, 34, 39, 44, 56], [7, 13, 18, 23, 35, 40, 45, 57], [7, 14, 19, 24, 36, 41, 46, 51], [7, 15, 20, 25, 30, 42, 47, 52], [8, 9, 22, 28, 34, 40, 46, 52], [8, 10, 16, 29, 35, 41, 47, 53], [8, 11, 17, 23, 36, 42, 48, 54], [8, 12, 18, 24, 30, 43, 49, 55], [8, 13, 19, 25, 31, 37, 50, 56], [8, 14, 20, 26, 32, 38, 44, 57], [8, 15, 21, 27, 33, 39, 45, 51]*/]
    
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
    
    private let url1 = Bundle.main.url(forResource: "correctt", withExtension: "mp3")
    private let url2 = Bundle.main.url(forResource: "incorrect", withExtension: "mp3")
    private var player1: AVAudioPlayer!
    private var player2: AVAudioPlayer!
    
    private var win: Bool = false
    private var gameover: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            self.player1 = try AVAudioPlayer(contentsOf: url1!)
        }
        catch {
            print("error loading mp3 1")
        }

        do {
            self.player2 = try AVAudioPlayer(contentsOf: url2!)
        }
        catch {
            print("error loading mp3 2")
        }

        self.navigationItem.setHidesBackButton(false, animated: true)
        self.collectionView.backgroundColor = UIColor.white
        
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
 
    override func willMove(toParent parent: UIViewController?){ // user quits game in the middle of the game (returns to main menu)
        super.willMove(toParent: parent)
        if parent == nil{
            print("the back button was pressed.")
            timer.invalidate()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dataCell", for: indexPath) as! CardCollectionViewCell
        cell.symbolImageView.backgroundColor=UIColor.init(white: 1, alpha: 1) // makes the background white (instead of grey)
        
        if (indexPath.section == 0){ //master card (card at top of phone screen)
            let indexIntoNestedArray1 = deck[decknumber][indexPath.row]
            let theSymbol1 = symbols[indexIntoNestedArray1-1]
            cell.symbolImageView.image = UIImage(named: theSymbol1.name)?.rotated2(degrees: Double.random(in: -90..<91))
        }
        else if (indexPath.section == 1 && (decknumber <= deck.count - 2)){ //player's card (card at bottom of phone screen)
            let indexIntoNestedArray2 = deck[decknumber+1][indexPath.row]
            let theSymbol2 = symbols[indexIntoNestedArray2-1]
            cell.symbolImageView.image = UIImage(named: theSymbol2.name)?.rotated2(degrees: Double.random(in: -90..<91))
        }
        //Configure the cell
        return cell
    }
    
    // called every time interval from the timer
    @objc func timerAction(){
        if (win == true){
           // Thread.sleep(forTimeInterval: 0.5)
            clear_all_highlighted_cells_section()
            timer.invalidate()
            
            if (gameover){
                gameover = false
                print("just after showGameOver timer !!!!")
                score = 0
            }
            collectionView.reloadData()
            win = false
        } // will run cellForItemAt method to redraw the 2 cards
        
        counter -= 1
        if (counter > 1 ){
            mysectionheader.sectionHeaderTimer.text = String(counter) + " seconds left"
        } else if (counter == 1){
            mysectionheader.sectionHeaderTimer.text = String(counter) + " second left"
        } else if (counter == 0){
            mysectionheader.sectionHeaderTimer.text = String(counter) + " second left"
            playIncorrectAnswerAudio()
        } else if (counter<0) {
            Thread.sleep(forTimeInterval: 0.5)
           
            if decknumber<=deck.count - 3{
                decknumber+=1
                print("Deck number X3 = " + String(decknumber))
                print("Number of decks = " + String(deck.count))
                tappedSymbol1 = Symbol(image: "", name: "")
                tappedSymbol2 = Symbol(image: "", name: "")
                score -= 1
                if (score<0){
                    score=0
                }
                clear_all_highlighted_cells_section()   // clear all selections
                timer.invalidate()
                counter=maxseconds
                collectionView.reloadData()
            } else{ //decknumber is 56 (last set of cards)
                print("End of game. We have displayed all the decks (last deck was not won). Launch showGameOver")
                print("Deck numberX4 = " + String(decknumber))
                timer.invalidate()
              
                Thread.sleep(forTimeInterval: 0.9)
                showGameOver()
                score = 0
                decknumber=0
                counter=maxseconds
                reinitarrays(true)
                win = true
                collectionView.reloadData() // restarts the timer, try to play again (after button "play again was pressed")
            }
        }
    }
    
    @IBAction func showGameOver(){
        deck.shuffle()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gameoverView = storyboard.instantiateViewController(withIdentifier: "modal1") as! GameOverViewController
        gameoverView.score = score
        clear_all_highlighted_cells_section()
        self.navigationController?.pushViewController(gameoverView, animated: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
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
        let res = get_symbol(x: myCellIndex.section + decknumber , y: myCellIndex.row)   // tapped 1 time on the symbol, the symbol has been selected    // correction on 11/21/2021 as decknumber now starts at 1 and ends at deck.count
        
        if (myCellIndex.section == 0){
            pressedcard1[myCellIndex.row] = !pressedcard1[myCellIndex.row]
            tappedSymbol1=Symbol(image:res[1],name:res[2])
            print("section 0 ; ")
            print(tappedSymbol1)
            print("\n")
            
            clear_all_highlighted_cells_section(0)   // clear all selections in card 1 (the card on the top)
            
            if (myCellIndex != previouscell1){ // case where the previous symbol is not the same as the new tapped symbol
                let cell = collectionView.cellForItem(at: myCellIndex) as! CardCollectionViewCell
                cell.layer.borderWidth = 3.0
                cell.layer.borderColor = UIColor.red.cgColor
            } else if (myCellIndex == self.previouscell1 && !pressedcard1[myCellIndex.row]){  // case where we tap on the same symbol several times and previously it was highlighted (red square). After tapping, it get unhighlighted.   Each symbol of card 1, has its state stored in the boolean array pressedcard1
                let cell = collectionView.cellForItem(at: myCellIndex) as! CardCollectionViewCell
                cell.layer.borderWidth = 0.0
                tappedSymbol1 = Symbol(image: "", name: "")
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
            } else if (myCellIndex == self.previouscell2 && !pressedcard2[myCellIndex.row]){
                let cell = collectionView.cellForItem(at: myCellIndex) as! CardCollectionViewCell
                cell.layer.borderWidth = 0.0
                tappedSymbol2 = Symbol(image: "", name: "")
            } else if (myCellIndex == self.previouscell2 && pressedcard2[myCellIndex.row]) {
                let cell = collectionView.cellForItem(at: myCellIndex) as! CardCollectionViewCell
                cell.layer.borderWidth = 3.0
                cell.layer.borderColor = UIColor.red.cgColor
            }
            self.previouscell2 = myCellIndex
        }
        
        if (tappedSymbol1.name == tappedSymbol2.name && !tappedSymbol1.name.isEmpty && !tappedSymbol2.name.isEmpty){
            if (myCellIndex.section == 1){
                let cell1 = collectionView.cellForItem(at: previouscell1) as! CardCollectionViewCell
                cell1.layer.borderWidth = 3.0
                cell1.layer.borderColor = UIColor.green.cgColor
                
                let cell2 = collectionView.cellForItem(at: myCellIndex) as! CardCollectionViewCell
                cell2.layer.borderWidth = 3.0
                cell2.layer.borderColor = UIColor.green.cgColor
            } else if (myCellIndex.section == 0){
                let cell2 = collectionView.cellForItem(at: previouscell2) as! CardCollectionViewCell
                cell2.layer.borderWidth = 3.0
                cell2.layer.borderColor = UIColor.green.cgColor
                    
                let cell1 = collectionView.cellForItem(at: myCellIndex) as! CardCollectionViewCell
                cell1.layer.borderWidth = 3.0
                cell1.layer.borderColor = UIColor.green.cgColor
            }
            
            if (decknumber <= deck.count - 3){
                decknumber+=1
                print("Deck number X1 = " + String(decknumber))
                print("Number of decks = " + String(deck.count))
                score += 3
                playCorrectAnswerAudio()
                
                reinitarrays()
                win = true
            } else{
                print("End of game, we have displayed all the decks and last deck was WON. Launch showGameOver")
                print("Deck numberX2 = " + String(decknumber))
                score += 3
                playCorrectAnswerAudio()
                win = true
                gameover = true
                reinitarrays(true)
                showGameOver()
            }
        } else if (tappedSymbol1.name != tappedSymbol2.name && !tappedSymbol1.name.isEmpty && !tappedSymbol2.name.isEmpty){
            playIncorrectAnswerAudio()
        }
    }
    
    func playCorrectAnswerAudio() {
        player1.play()
    }
    
    func playIncorrectAnswerAudio() {
        player2.play()
    }

    func reinitarrays(_ gamefinished: Bool? = nil){ // reinitializes the state of the tapped symbols (1 is for card1.  2 is for card 2)
        pressedcard1 = [false,false,false,false,false,false,false,false]
        pressedcard2 = [false,false,false,false,false,false,false,false]
        
        previouscell1 = IndexPath(row: 0, section: 2)
        previouscell2 = IndexPath(row: 0, section: 2)
    
        tappedSymbol1 = Symbol(image: "", name: "")
        tappedSymbol2 = Symbol(image: "", name: "")
        counter=maxseconds + 1
        
        if (gamefinished != nil && gamefinished!){
            decknumber=0
            print("debug 1")
        }
    }
    
    func clear_all_highlighted_cells_section (_ cardnumber : Int? = nil){
        let allCells = collectionView.indexPathsForVisibleItems
        if (cardnumber == nil) {
            for k in allCells{
                let cell = collectionView.cellForItem(at: k) as! CardCollectionViewCell
                cell.layer.borderWidth = 0.0
                cell.symbolImageView.alpha = 1
            }
        } else {
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
                sectionHeader.sectionHeaderTimer.isHidden = false
                sectionHeader.sectionHeaderTimer.center.x=self.view.center.x
                sectionHeader.sectionHeaderTimer.textColor=UIColor.white
                sectionHeader.sectionHeaderTimer.font=UIFont(name: "DIN Alternate", size: 14)
                sectionHeader.sectionHeaderTimer.text=String(counter) + " seconds left"
                
                sectionHeader.sectionHeaderlabel.isHidden = false
                sectionHeader.sectionHeaderlabel.center.x=self.view.center.x
                sectionHeader.sectionHeaderlabel.text = "Score: \(score)"
                sectionHeader.sectionHeaderlabel.textColor=UIColor.white
                sectionHeader.sectionHeaderlabel.font=UIFont(name: "DIN Alternate", size: 26)
            
                sectionHeader.sectionHeaderCard.isHidden = false
                sectionHeader.sectionHeaderCard.center.x=self.view.center.x
                sectionHeader.sectionHeaderCard.font=UIFont(name: "DIN Alternate", size: 14)
                sectionHeader.sectionHeaderCard.textColor = UIColor(red: 28/255, green: 183/255, blue: 255/255, alpha: 1)
                sectionHeader.sectionHeaderCard.text = "Card 1"
                
                sectionHeader.scoreIcon.isHidden = false
                sectionHeader.scoreIcon.center.x = self.view.center.x
                
                sectionHeader.timerIcon.isHidden = false
                sectionHeader.timerIcon.center.x = self.view.center.x
                    
                mysectionheader = sectionHeader
                // start the timer
                if (decknumber <= deck.count - 2){  // we run the asynchrononous timer until the last deck. IMPORTANT!!
                  timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
                }
            } else if (indexPath.section == 1) {
                sectionHeader.sectionHeaderCard.isHidden = false
                sectionHeader.sectionHeaderCard.center.x=self.view.center.x
                sectionHeader.sectionHeaderCard.text = "Card 2"
                sectionHeader.sectionHeaderCard.font=UIFont(name: "DIN Alternate", size: 14)
                sectionHeader.sectionHeaderCard.textColor = UIColor(red: 28/255, green: 183/255, blue: 255/255, alpha: 1)
                
                sectionHeader.sectionHeaderlabel.isHidden = true

                sectionHeader.sectionHeaderTimer.isHidden = true
           
                sectionHeader.scoreIcon.isHidden = true
                
                sectionHeader.timerIcon.isHidden = true
            }
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if (section == 1) {
            return CGSize(width: mysectionheader.frame.width, height: 100)
        } else {
            return CGSize(width: mysectionheader.frame.width, height: 120)
        }
    }

    func get_symbol(x: Int,y: Int) -> Array<String>{
        let section :String = String(format: "%d", x)
        let indexIntoNestedArray1 = deck[x][y]
        let theSymbol = symbols[indexIntoNestedArray1-1]
        return [section, theSymbol.image, theSymbol.name,String(y)]
    }
}

extension UIImage {    //  https://stackoverflow.com/questions/27092354/rotating-uiimage-in-swift/29753437
    func withSize(_ width: CGFloat, _ height: CGFloat) -> UIImage {
        let target = CGSize(width: width,height:  height)
        
        var scaledImageRect = CGRect.zero
        let aspectWidth:CGFloat = target.width / self.size.width
        let aspectHeight:CGFloat = target.height / self.size.height
        let aspectRatio:CGFloat = min(aspectWidth, aspectHeight)
        
        scaledImageRect.size.width = self.size.width * aspectRatio
        scaledImageRect.size.height = self.size.height * aspectRatio
        scaledImageRect.origin.x = (target.width - scaledImageRect.size.width) / 2.0
        scaledImageRect.origin.y = (target.height - scaledImageRect.size.height) / 2.0

        UIGraphicsBeginImageContextWithOptions(target, false, 0)

        self.draw(in: scaledImageRect)

        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return scaledImage!
    }

    func rotated2(degrees: Double) -> UIImage {
        let radians = CGFloat(Double.pi * degrees / 180)

        var rotatedViewBox: UIView? = UIView(frame: CGRect(x: 0, y: 0, width: size.width * scale, height: size.height * scale))
        let t = CGAffineTransform(rotationAngle: radians)
        rotatedViewBox!.transform = t
        let rotatedSize = rotatedViewBox!.frame.size
        rotatedViewBox = nil

        // Create the bitmap context
        UIGraphicsBeginImageContext(rotatedSize)
        let bitmap = UIGraphicsGetCurrentContext()!

        // Move the origin to the middle of the image so we will rotate and scale around the center.
        bitmap.translateBy(x: rotatedSize.width/2, y: rotatedSize.height/2)

        // Rotate the image context
        bitmap.rotate(by: radians)

        // Now, draw the rotated/scaled image into the context
        bitmap.scaleBy(x: 1.0, y: -1.0)
        bitmap.draw(cgImage!, in: CGRect(x:-size.width * scale / 2, y: -size.height * scale / 2, width: size.width * scale, height: size.height * scale))

        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return newImage.withSize(newImage.size.width/scale, newImage.size.height/scale)
    }
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
/*
extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }

        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            // Change `Int` in the next line to `IndexDistance` in < Swift 4.1
            let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}
 */
