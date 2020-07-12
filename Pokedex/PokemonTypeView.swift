//
//  PokemonTypeView.swift
//  Pokedex
//
//  Created by Krishna Nanduri on 12/07/20.
//  Copyright © 2020 Krishna Nanduri. All rights reserved.
//

import SwiftUI

struct PokemonTypeView: View {
    var typeEntry: PokemonTypeEntry
    
    var body: some View {
        Text(typeEntry.type.name.prefix(1).uppercased() + typeEntry.type.name.dropFirst())
            .font(.system(size: 22))
    }
}
