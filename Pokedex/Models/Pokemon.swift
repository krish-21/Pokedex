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
    let sprites: PokemonSprite
}

struct PokemonTypeEntry: Hashable, Codable {
    let slot: Int
    let type: PokemonType
}

struct PokemonType: Hashable, Codable {
    let name: String
    let url: String
}

struct PokemonSprite: Hashable, Codable {
    let front_default: String
}

struct PokemonDescription: Hashable, Codable {
    let flavor_text_entries: [PokemonFlavourTextEntry]
}

struct PokemonFlavourTextEntry: Hashable, Codable, Identifiable {
    let id = UUID()
    let flavor_text: String
    let language: LanguageStruct
}

struct LanguageStruct: Hashable, Codable {
    let name: String
    let url: String
}
