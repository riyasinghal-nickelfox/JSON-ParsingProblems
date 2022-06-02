//
//  Data.swift
//  ParseJson1
//
//  Created by riya singhal on 25/05/22.
//

import Foundation
struct Data:Codable {
    var id : Int?
    var name : String?
    var year :Int?
    var color : String?
    var pantoneValue: Int?
    
    enum CodingKeys : String , CodingKey {
        case id = "id"
        case name = "name"
        case year = "year"
        case color = " color"
        case pantoneValue = "pantone_Value"
        
    }
    
}
