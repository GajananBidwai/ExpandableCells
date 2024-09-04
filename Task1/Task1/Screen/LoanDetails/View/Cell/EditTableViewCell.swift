//
//  EditTableViewCell.swift
//  Task1
//
//  Created by abcd on 02/09/24.
//

import UIKit

class EditTableViewCell: UITableViewCell {

    
    @IBOutlet weak var editButton: UIButton!{
        didSet{
            editButton.layer.cornerRadius = 15
            editButton.clipsToBounds = true
            editButton.layer.borderColor = UIColor.black.cgColor
            editButton.layer.borderWidth = 1
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    static func cellIndentifier() -> String {
        return "EditTableViewCell"
    }
}
