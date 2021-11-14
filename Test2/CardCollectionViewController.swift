//
//  CardCollectionViewController.swift
//  Test2
//
//  Created by Janet Meng on 10/18/21.
//

import UIKit

private let reuseIdentifier = "Cell"

//var model = Model()
class CardCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
        
    private var symbols : [Symbol] = [ Symbol(image: "Algae", name: "algae"),
                                        Symbol(image: "Beach", name: "beach"),
                                        Symbol(image: "Buoy", name: "buoy"),
                                        Symbol(image: "Clam", name: "clam"),
                                        Symbol(image: "Clownfish", name: "clownfish"), //4
                                        Symbol(image: "Coastline", name: "coastline"),
                                        Symbol(image: "Compass", name: "compass"),
                                        Symbol(image: "Conch Shell", name: "conchshell"),
                                        Symbol(image: "Coral", name: "coral"),
                                        Symbol(image: "Crab", name: "crab"),
                                        Symbol(image: "Crocodile", name: "crocodile"),
                                        Symbol(image: "Diver", name: "diver"),
                                        Symbol(image: "Dolphin", name: "dolphin"),
                                        Symbol(image: "Dragon", name: "dragon"),
                                        Symbol(image: "Drop of Water", name: "dropOfWater"),
                                        Symbol(image: "Eel", name: "eel"), //15
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
                                        Symbol(image: "Penguin", name: "penguin"),
                                        Symbol(image: "Salmon", name: "salmon"),
                                        Symbol(image: "Seagull", name: "seagull"),
                                        Symbol(image: "Seahorse", name: "seahorse"),
                                        Symbol(image: "Sea Lion", name: "sealion"),
                                        Symbol(image: "Serpent", name: "serpentt"),
                                        Symbol(image: "Shark", name: "shark"),
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
                                        Symbol(image: "Walrus", name: "walrus"),
                                        Symbol(image: "Water Splash", name: "waterSplash"),
                                        Symbol(image: "Walrus", name: "walrus"),
                                        Symbol(image: "Wave", name: "wave"),
                                        Symbol(image: "Whale Fin", name: "whaleFin"),
                                        Symbol(image: "Willow", name: "willow"),
                                        Symbol(image: "Yacht", name: "yacht"),
                                        Symbol(image: "Yay", name: "yay")]
 //most updated list of images is on the doc "Images for Icons"

    private var deck: [[Int]] = [[1, 2, 3, 4, 5, 6, 7, 8], [1, 9, 10, 11, 12, 13, 14, 15], [1, 16, 17, 18, 19, 20, 21, 22], [1, 23, 24, 25, 26, 27, 28, 29], [1, 30, 31, 32, 33, 34, 35, 36], [1, 37, 38, 39, 40, 41, 42, 43], [1, 44, 45, 46, 47, 48, 49, 50], [1, 51, 52, 53, 54, 55, 56, 57], [2, 9, 16, 23, 30, 37, 44, 51], [2, 10, 17, 24, 31, 38, 45, 52], [2, 11, 18, 25, 32, 39, 46, 53], [2, 12, 19, 26, 33, 40, 47, 54], [2, 13, 20, 27, 34, 41, 48, 55], [2, 14, 21, 28, 35, 42, 49, 56], [2, 15, 22, 29, 36, 43, 50, 57], [3, 9, 17, 25, 33, 41, 49, 57], [3, 10, 18, 26, 34, 42, 50, 51], [3, 11, 19, 27, 35, 43, 44, 52], [3, 12, 20, 28, 36, 37, 45, 53], [3, 13, 21, 29, 30, 38, 46, 54], [3, 14, 22, 23, 31, 39, 47, 55], [3, 15, 16, 24, 32, 40, 48, 56], [4, 9, 18, 27, 36, 38, 47, 56], [4, 10, 19, 28, 30, 39, 48, 57], [4, 11, 20, 29, 31, 40, 49, 51], [4, 12, 21, 23, 32, 41, 50, 52], [4, 13, 22, 24, 33, 42, 44, 53], [4, 14, 16, 25, 34, 43, 45, 54], [4, 15, 17, 26, 35, 37, 46, 55], [5, 9, 19, 29, 32, 42, 45, 55], [5, 10, 20, 23, 33, 43, 46, 56], [5, 11, 21, 24, 34, 37, 47, 57], [5, 12, 22, 25, 35, 38, 48, 51], [5, 13, 16, 26, 36, 39, 49, 52], [5, 14, 17, 27, 30, 40, 50, 53], [5, 15, 18, 28, 31, 41, 44, 54], [6, 9, 20, 24, 35, 39, 50, 54], [6, 10, 21, 25, 36, 40, 44, 55], [6, 11, 22, 26, 30, 41, 45, 56], [6, 12, 16, 27, 31, 42, 46, 57], [6, 13, 17, 28, 32, 43, 47, 51], [6, 14, 18, 29, 33, 37, 48, 52], [6, 15, 19, 23, 34, 38, 49, 53], [7, 9, 21, 26, 31, 43, 48, 53], [7, 10, 22, 27, 32, 37, 49, 54], [7, 11, 16, 28, 33, 38, 50, 55], [7, 12, 17, 29, 34, 39, 44, 56], [7, 13, 18, 23, 35, 40, 45, 57], [7, 14, 19, 24, 36, 41, 46, 51], [7, 15, 20, 25, 30, 42, 47, 52], [8, 9, 22, 28, 34, 40, 46, 52], [8, 10, 16, 29, 35, 41, 47, 53], [8, 11, 17, 23, 36, 42, 48, 54], [8, 12, 18, 24, 30, 43, 49, 55], [8, 13, 19, 25, 31, 37, 50, 56], [8, 14, 20, 26, 32, 38, 44, 57], [8, 15, 21, 27, 33, 39, 45, 51]]
    
    @IBOutlet private var tappableView: UICollectionView!{  // do I need this?
        didSet{
            tappableView.backgroundColor = .red
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deck.shuffle()
        //  let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
        //   tappableView.addGestureRecognizer(tapGestureRecognizer)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

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
        var tappedSymbol1: Symbol
        var tappedSymbol2: Symbol
        if (indexPath.section == 0){ //master card (card at top of phone screen
            var x: Int = 0
            //x increases every time the user taps the same symbols (finds the matching cards on the 2 cards). since the user "wins" the round, their previous card becomes the new master card
            if (tappedSymbol1.name == tappedSymbol2.name){ //move cards accordingly
                x+=1
            }
            let indexIntoNestedArray1 = deck[x][indexPath.row]
            let theSymbol1 = symbols[indexIntoNestedArray1-1]
            cell.symbolImageView.image = UIImage(named: theSymbol1.name)
        } else if (indexPath.section == 1){ //player's card (card at bottom of phone screen
            var y: Int = 1
            //y increases every time the user taps the right symbols (finds the match), because the player "wins" the round so the next card from the deck becomes the player's new card.
            if (tappedSymbol1.name == tappedSymbol2.name){ //move cards accordingly
                y+=1
            }
            let indexIntoNestedArray2 = deck[y][indexPath.row]
            let theSymbol2 = symbols[indexIntoNestedArray2-1]
            cell.symbolImageView.image = UIImage(named: theSymbol2.name)
        }
        
        cell.symbolImageView.isUserInteractionEnabled = true
        cell.tapRecognizer1.addTarget(self, action: #selector(self.didTapImageView(_:)))
        cell.symbolImageView.gestureRecognizers = []
        cell.symbolImageView.gestureRecognizers?.append(cell.tapRecognizer1)
        
       //Configure the cell
        return cell
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
    
    // what is this?? --- sahana
    /*
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            // 1
            case UICollectionView.elementKindSectionHeader:
            // 2
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(SymbolToggleHeaderViewCollectionReusableView.self)", for: indexPath)
            // 3
            guard let typedHeaderView = headerView as? SymbolToggleHeaderViewCollectionReusableView
            else {
                return headerView
            }
            // 4
            return typedHeaderView
            default:
            // 5
            assert(false, "Invalid element type")
        }
    }
    */

    @IBAction func didTapImageView(_ sender: UITapGestureRecognizer){
       // var image = sender.view as! UICollectionView
        print("did tap view", sender)
    }

    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool{ // https://www.titanwolf.org/Network/q/69601a09-cd9e-4d70-968c-2b6858db6e5a/y  ANSWER 1
            if let indexPaths = collectionView.indexPathsForSelectedItems, indexPaths.contains(indexPath){
                collectionView.deselectItem(at: indexPath, animated: true)
               // display(x: indexPath.section, y: indexPath.row)//symbol is tapped a second time: means the symbol has been unselected
                return false
            }
           // display(x: indexPath.section, y: indexPath.row)   // symbol is tapped one time (means the symbol has been selected)
            // need to color the picture, to show it is highlighted ? and/or play a sound
            return true
        }
/*
    func display(x: Int,y: Int){    // helper display function
        let section: String = String(format: "%d", x+1)
        //let row :String = String(format: "%d", y)
        let indexIntoNestedArray1 = deck[x][y]
        let theSymbol1 = symbols[indexIntoNestedArray1-1]
        print("card " + section + " " + /*row + " " +*/ theSymbol1.name )
    }
    

    // MARK: UICollectionViewDelegate

    
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }


    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
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

