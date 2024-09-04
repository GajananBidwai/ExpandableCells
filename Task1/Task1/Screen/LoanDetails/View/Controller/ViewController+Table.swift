//
//  ViewController+Table.swift
//  Task1
//
//  Created by abcd on 02/09/24.
//

import Foundation
import UIKit

extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.sectionArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let expandabableTableViewCell = tableView.dequeueReusableCell(withIdentifier: ExpandabableTableViewCell.cellIndentifier(),for: indexPath) as! ExpandabableTableViewCell
        
        if indexPath.row == 0 {
            expandabableTableViewCell.titleLabel.text = viewModel.sectionArray?[indexPath.section].title
            expandabableTableViewCell.cellIcon.image = UIImage(named: viewModel.sectionArray?[indexPath.section].icon ?? "")
            expandabableTableViewCell.selectionStyle = .none
            
            if viewModel.sectionArray?[indexPath.section].isOpened ??  false{
                expandabableTableViewCell.expandButton.transform = CGAffineTransform(rotationAngle: .pi)
            }else{
                expandabableTableViewCell.expandButton.transform = .identity
            }
            
        } else if indexPath.row == (viewModel.sectionArray?[indexPath.section].option.count ?? 0) + 1 {
            let editTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "EditTableViewCell",for: indexPath) as! EditTableViewCell
            editTableViewCell.selectionStyle = .none
            
            return editTableViewCell
            
        } else {
            let employeTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: EmployeTableViewCell.cellIndentifier()) as! EmployeTableViewCell
            employeTableViewCell.titleLabel.text = viewModel.sectionArray?[indexPath.section].option[indexPath.row - 1].title
            employeTableViewCell.subtitleLabel.text = viewModel.sectionArray?[indexPath.section].option[indexPath.row - 1].subtitle
            employeTableViewCell.selectionStyle = .none
            
            return employeTableViewCell
        }
        return expandabableTableViewCell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = viewModel.sectionArray?[section]
        return section!.isOpened ? ((section?.option.count)! + 2) : 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            tableView.deselectRow(at: indexPath, animated: true)
            if viewModel.sectionArray?[indexPath.section].isOpened ?? false{
                viewModel.sectionArray?[indexPath.section].isOpened = false
            }else{
                viewModel.sectionArray?[indexPath.section].isOpened = true
            }
            tableView.reloadSections([indexPath.section], with: .none)
        }
    }
    
    @objc func editButtonTapped(_ sender: UIButton) {
        let section = sender.tag
        print("Edit button tapped for section \(section)")
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if viewModel.sectionArray?[section].isTitleSection ?? false{
            return CGFloat.leastNonzeroMagnitude
        }else{
            return 15
        }
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
}
