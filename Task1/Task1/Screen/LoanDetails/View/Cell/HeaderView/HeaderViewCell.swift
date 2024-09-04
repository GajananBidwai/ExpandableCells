//
//  HeaderViewCell.swift
//  Task1
//
//  Created by abcd on 03/09/24.
//

import UIKit

class HeaderViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!

    @IBOutlet weak var desLabel: UILabel! {
        didSet {
            desLabel.text = "We've received your request, We'll be in touch in with you shortly."
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    static func cellIndentifier() -> String {
        return "HeaderViewCell"
    }
}
