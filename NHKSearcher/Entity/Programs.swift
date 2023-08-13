//
//  Program.swift
//  NHKSearcher
//
//  Created by hayato sugawara on 2023/08/09.
//

import Foundation

struct Programs : Codable{
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Program]
    
    private enum CodingKeys: String, CodingKey{
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

struct Program: Codable, Identifiable{
    var id = UUID()
    var area: String
    var title: String
}
