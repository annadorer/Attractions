//
//  AttractionModel.swift
//  Attractions
//
//  Created by Anna on 23.07.2024.
//

import Foundation

struct AttractionModel: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var description: String
    var subDescription: String
    var image: String
}
