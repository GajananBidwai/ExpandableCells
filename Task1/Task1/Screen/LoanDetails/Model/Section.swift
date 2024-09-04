//
//  Section.swift
//  Task1
//
//  Created by abcd on 30/08/24.
//
import UIKit

struct Module: Codable {
    let section: [Section]
}

// MARK: - Array
struct Section: Codable {
    let title: String
    let option: [Option]
    var isOpened: Bool = false
    let icon: String
    var isTitleSection: Bool = false
}

// MARK: - Option
struct Option: Codable {
    let title, subtitle: String
}

