//
//  MarvelClasses.swift
//  Busca Herois
//
//  Created by Bruno Ornelas on 17/06/21.
//

import Foundation

struct MarvelInfo: Codable {
    let code: Int
    let status: String
    let data: MarvelData
}

struct MarvelData: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Hero]
    
}

struct Hero: Codable {
    let id: Int
    let name: String
    let description: String
    let urls: [HeroURL]
}

enum CodingKeys: String, CodingKey {
    case path
    case ext = "extension"
}

struct HeroURL: Codable {
    let type: String
    let url: String
}
