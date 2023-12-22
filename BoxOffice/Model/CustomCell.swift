//
//  Cell.swift
//  BoxOffice
//
//  Created by Hisop on 2023/12/21.
//

import UIKit

class CustomCell: UITableViewCell {
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.textLabel?.text = ""
    }
}
