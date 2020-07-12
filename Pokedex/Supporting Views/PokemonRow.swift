//
//  PokemonRow.swift
//  Pokedex
//
//  Created by Krishna Nanduri on 12/07/20.
//  Copyright © 2020 Krishna Nanduri. All rights reserved.
//

import SwiftUI

struct PokemonRow: View {
    var pokemon: Pokemon
    
    var body: some View {
        Text(pokemon.name.prefix(1).uppercased() + pokemon.name.dropFirst())
    }
}
