//
//  Cell.swift
//  BoxOffice
//
//  Created by Hisop on 2023/12/21.
//

import UIKit

class CustomCell: UICollectionViewCell {
    var label: UILabel?
    
    init(frame: CGRect, label: UILabel? = nil) {
        super.init(frame: frame)
        self.label = label
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.label?.text = ""
    }
}
