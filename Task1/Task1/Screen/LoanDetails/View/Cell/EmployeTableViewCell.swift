//
//  EmployeTableViewCell.swift
//  Task1
//
//  Created by abcd on 30/08/24.
//

import UIKit

class EmployeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    static func cellIndentifier() -> String {
        return "EmployeTableViewCell"
    }
}
