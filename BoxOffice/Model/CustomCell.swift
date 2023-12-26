//
//  Cell.swift
//  BoxOffice
//
//  Created by Hisop on 2023/12/21.
//

import UIKit

class CustomCell: UICollectionViewCell {
    var label: UILabel
    
    override init(frame: CGRect) {
        label = UILabel()
        super.init(frame: frame)
        
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        //self.backgroundColor = .systemBlue
        //self.label.text = ""
    }
}
