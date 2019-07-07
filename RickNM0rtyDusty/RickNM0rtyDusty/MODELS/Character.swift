//
//  Character.swift
//  RickNM0rtyDusty
//
//  Created by Austin West on 7/7/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import Foundation

struct Character: Codable {
    
    let name: String
    let status: String
    let origin: Origin
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case status
        case origin
        case image
    }
    
} // END OF STRUCT

struct TopLevelDictionary: Codable {
    
    let results = [Character]
    }// END OF STRUCT

struct Origin: Codable {
    
    let planetName: String
    
    enum CodingKeys: String, CodingKey {
        case planetPlanet = "name"
    }
} // END OF STRUCT
