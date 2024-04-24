//
//  CellClass.swift
//  ArtBookNoStoryBoard
//
//  Created by Özcan on 24.04.2024.
//

import UIKit

class CellClass: UITableViewCell {
    var label = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        setUpVisualObject()
    }
    
    private func setUpVisualObject() {
        label.frame = CGRect(x: 10, y: 5, width: 260, height: 30)
        addSubview(label)
    }

}
