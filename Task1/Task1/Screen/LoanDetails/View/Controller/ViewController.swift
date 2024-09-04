//
//  ViewController.swift
//  Task1
//
//  Created by abcd on 30/08/24.
//

import UIKit


class ViewController: UIViewController {
    var flag = true
    var viewModel = LoanDetailsViewModel()
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.layoutMargins = UIEdgeInsets.init(top: 24, left: 16, bottom: 24, right: 16)
        }
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        registerXIBWithTableView()
        initialiazeTableView()
        configuration()
        
        guard let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: FooterView1.cellIndentifier()) as? FooterView1 else {
            return
        }

        tableView.tableFooterView = footerView
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderViewCell.cellIndentifier()) as! HeaderViewCell
        
        let containerView = UIView(frame: CGRect(x: 0,
                                                 y: 0,
                                                 width: tableView.frame.width,
                                                 height: cell.frame.size.height))
        cell.translatesAutoresizingMaskIntoConstraints = false
        cell.bgView.backgroundColor =  .yellow
        cell.bgView.layer.cornerRadius =  20
        containerView.addSubview(cell)
        cell.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
        cell.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true
        cell.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16).isActive = true
        cell.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        tableView.tableHeaderView = containerView
        
    }
    
    func registerXIBWithTableView(){
        
        let nibsToRegister: [(cellClass: AnyClass, isHeaderFooter: Bool)] = [
            (ExpandabableTableViewCell.self, false),
            (EmployeTableViewCell.self, false),
            (EditTableViewCell.self, false),
            (HeaderViewCell.self, false),
            (FooterView1.self, true)
        ]
        
        for nib in nibsToRegister {
            let nibName = String(describing: nib.cellClass)
            let uinib = UINib(nibName: nibName, bundle: nil)
            if nib.isHeaderFooter {
                tableView.register(uinib, forHeaderFooterViewReuseIdentifier: nibName)
            } else {
                tableView.register(uinib, forCellReuseIdentifier: nibName)
            }
        }
    }
    func configuration(){
        initViewModel()
    }
    func initViewModel(){
        viewModel.loadSectionData()
    }
    
    func initialiazeTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sectionHeaderHeight = 0
        tableView.sectionFooterHeight = 0
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.subviews.forEach { view in
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOpacity = 0.4
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 3
        }
    }
}

extension UIView {
    func addShadow() {
        layer.cornerRadius = 10
        clipsToBounds = true
    }
}
