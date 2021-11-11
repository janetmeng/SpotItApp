//
//  CardCollectionViewCell.swift
//  Test2
//
//  Created by Janet Meng on 10/18/21.
//

import UIKit

@objc protocol SymbolProtocol {
     func didTapImageView(for cell: CardCollectionViewCell)
}

class CardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var symbolImageView: UIImageView!
    
    var gesture: UITapGestureRecognizer
    weak var delegate: SymbolProtocol?
      
    override init(frame: CGRect) {
        self.gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        super.init(frame: frame)
        symbolImageView.isUserInteractionEnabled = true
        self.symbolImageView.addGestureRecognizer(gesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.delegate?.didTapImageView(for: self)
        // print("handleTap")
    }
}
