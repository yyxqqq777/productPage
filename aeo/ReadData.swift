//
//  ReadData.swift
//  aeo
//
//  Created by Yunxuan Yu on 6/15/23.
//

import Foundation
class ReadData: ObservableObject {
    @Published var products = [Product]()

    var categories: [String] {
        let allCategories = products.map { $0.productCategory }
        let distinctCategories = Array(Set(allCategories))
        return ["All"] + distinctCategories.sorted()
    }
    
    init() {
        loadData()
    }
    
    func loadData() {
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
            print("Json file not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let products = try JSONDecoder().decode([Product].self, from: data)
            self.products = products
        } catch {
            print("error", error)
        }
    }
}

