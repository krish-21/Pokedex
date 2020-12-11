//
//  PokemonRow.swift
//  Pokedex
//
//  Created by Krishna Nanduri on 12/07/20.
//  Copyright © 2020 Krishna Nanduri. All rights reserved.
//

import SwiftUI

// View to display each row of the Pokèmon List
struct PokemonRow: View {
    var pokemon: Pokemon
    
    var body: some View {
        Text(Helper.capitalize(name: pokemon.name))
    }
}
