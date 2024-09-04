//
//  LoanDetailsViewModel.swift
//  Task1
//
//  Created by abcd on 04/09/24.
//

import Foundation
final class LoanDetailsViewModel{
    var sectionArray: [Section]?
    
    func loadSectionData() {
        guard let filePath = Bundle.main.path(forResource: "LoanDetails", ofType: "json") else {
            print("JSON file not found.")
            return
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
            let jsonData = try JSONDecoder().decode(Module.self, from: data)
            self.sectionArray = jsonData.section
        } catch {
            print("Failed to load or decode JSON: \(error)")
            return 
        }
    }
}
