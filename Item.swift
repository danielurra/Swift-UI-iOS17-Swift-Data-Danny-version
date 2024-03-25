//
//  Item.swift
//  Data Practice
//
//  Created by Eusebio Taba on 3/24/24.
//

import Foundation
import SwiftData

@Model// allow you to save data making use of SwiftData 
final class Item {// FINAL = this class can not be changed
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
@Model
final class Todo_Class {
    var titulito: String
    
    init(titulito: String) {
        self.titulito = titulito
    }
}
