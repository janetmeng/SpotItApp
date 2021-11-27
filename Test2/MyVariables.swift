//
//  MyVariables.swift
//  Test2
//
//  Created by Janet Meng on 11/25/21.
//

import Foundation

class MyVariables {
    
    //creates the instance and guarantees that it's unique
    static let instance = MyVariables()
    
    private init() {
    }
    
    //creates the global variable
    var score = 0
}

