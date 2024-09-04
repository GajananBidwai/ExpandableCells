//
//  ExpandabableTableViewCell.swift
//  Task1
//
//  Created by abcd on 30/08/24.
//

import UIKit

class ExpandabableTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var expandButton: UIButton!
    @IBOutlet weak var cellIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureImageViewShadow()
    }
    
    func configureImageViewShadow() {
        cellIcon.layer.shadowColor = UIColor.black.cgColor
        cellIcon.layer.shadowOpacity = 0.3
        cellIcon.layer.shadowOffset = CGSize(width: 0, height: 2)
        cellIcon.layer.shadowRadius = 4
        cellIcon.layer.masksToBounds = false
        cellIcon.layer.cornerRadius = cellIcon.frame.size.width / 2
    }
    
    static func cellIndentifier() -> String {
        return "ExpandabableTableViewCell"
    }
}
