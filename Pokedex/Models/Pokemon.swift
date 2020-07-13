//
//  Pokemon.swift
//  Pokedex
//
//  Created by Krishna Nanduri on 12/07/20.
//  Copyright © 2020 Krishna Nanduri. All rights reserved.
//

import Foundation

// Array of all Pokèmon
struct PokemonResults: Hashable, Codable {
    let results: [Pokemon]
}

// Pokèmon
struct Pokemon: Hashable, Codable, Identifiable {
    let id = UUID()
    let name: String
    let url: String
}

// Information on Pokèmon
struct PokemonInformation: Hashable, Codable {
    let id: Int
    let name: String
    let types: [PokemonTypeEntry]
    let sprites: PokemonSprite
}

// Pokèmon Type Entry
struct PokemonTypeEntry: Hashable, Codable {
    let slot: Int
    let type: PokemonType
}

// Pokèmon Type
struct PokemonType: Hashable, Codable {
    let name: String
    let url: String
}

// Pokèmon Sprite
struct PokemonSprite: Hashable, Codable {
    let front_default: String
}

// Array of Descriptions
struct PokemonDescription: Hashable, Codable {
    let flavor_text_entries: [PokemonFlavourTextEntry]
}

// Pokèmon Description
struct PokemonFlavourTextEntry: Hashable, Codable {
    let flavor_text: String
    let language: LanguageStruct
}

// Language
struct LanguageStruct: Hashable, Codable {
    let name: String
    let url: String
}
