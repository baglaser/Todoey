//
//  Item.swift
//  Todoey
//
//  Created by Bonnie Glaser on 4/30/19.
//  Copyright © 2019 Bonnie Glaser. All rights reserved.
//

import Foundation

// Encodable, Decodable
class Item: Codable {
    var title : String = ""
    var done : Bool = false
}
