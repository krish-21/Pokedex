//
//  PokemonTypeView.swift
//  Pokedex
//
//  Created by Krishna Nanduri on 12/07/20.
//  Copyright © 2020 Krishna Nanduri. All rights reserved.
//

import SwiftUI

// View to display each type of a Pokèmon
struct PokemonTypeView: View {
    var typeEntry: PokemonTypeEntry
    
    var body: some View {
        Text(Helper.capitalize(name: typeEntry.type.name))
            .font(.system(size: 22))
    }
}
