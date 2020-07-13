//
//  Helper.swift
//  Pokedex
//
//  Created by Krishna Nanduri on 13/07/20.
//  Copyright © 2020 Krishna Nanduri. All rights reserved.
//

import Foundation

// Helper class for useful functions to be used anywhere in the projects
class Helper {
    static func capitalize(name: String) -> String {
        return name.prefix(1).uppercased() + name.dropFirst()
    }
}
