//
//  Program.swift
//  NHKSearcher
//
//  Created by hayato sugawara on 2023/08/09.
//

import Foundation

struct Program: Codable, Identifiable{
    var id = UUID()
    var area: String
    var title: String
}
