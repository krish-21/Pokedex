//
//  Pokemon.swift
//  Pokedex
//
//  Created by Krishna Nanduri on 12/07/20.
//  Copyright © 2020 Krishna Nanduri. All rights reserved.
//

import Foundation

struct PokemonResults: Hashable, Codable {
    let results: [Pokemon]
}

struct Pokemon: Hashable, Codable, Identifiable {
    let id = UUID()
    let name: String
    let url: String
}

struct PokemonInformation: Hashable, Codable {
    let id: Int
    let name: String
    let types: [PokemonTypeEntry]
    
}

struct PokemonTypeEntry: Hashable, Codable {
    let slot: Int
    let type: PokemonType
}

struct PokemonType: Hashable, Codable {
    let name: String
    let url: String
}

