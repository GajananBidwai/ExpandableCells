//
//  FooterView1.swift
//  Task1
//
//  Created by abcd on 04/09/24.
//

import UIKit

class FooterView1: UITableViewHeaderFooterView {
    
    var flag = true
    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var applyButton: UIButton!{
        didSet{
            applyButton.layer.cornerRadius = 20
            applyButton.clipsToBounds = true
        }
    }
    @IBOutlet weak var agreementLabel: UILabel!
    
    @IBAction func checkBoxButtonAction(_ sender: Any) {
                updateApplyButtonState()
    }
    
    static func cellIndentifier() -> String {
        return "FooterView1"
    }
}

extension FooterView1{
    func setupInitialState() {
        self.applyButton.isEnabled = false
        self.applyButton.backgroundColor = .gray
    }
    
    func updateApplyButtonState(){
        applyButton.isEnabled = flag
        applyButton.backgroundColor = flag ? .systemIndigo  : .gray
        checkBoxButton.setImage(UIImage(named: flag ? "checked"  : "unchecked"), for: .normal)
        flag.toggle()
    }
}
