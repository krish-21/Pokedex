//
//  PokemonDetail.swift
//  Pokedex
//
//  Created by Krishna Nanduri on 12/07/20.
//  Copyright © 2020 Krishna Nanduri. All rights reserved.
//

import SwiftUI

struct PokemonDetail: View {
    var url: String
    
    @State var pokemonId: String = ""
    @State var pokemonName: String = ""
    @State var pokemonTypes: [PokemonTypeEntry] = []
    
    var body: some View {
        VStack(spacing: 20) {
            Text(pokemonName.prefix(1).uppercased() + pokemonName.dropFirst())
                .font(.system(size: 30))
            Text(pokemonId)
                .font(.system(size: 26))
            HStack(spacing: 40) {
                ForEach(pokemonTypes, id: \.slot) { typeEntry in
                    PokemonTypeView(typeEntry: typeEntry)
                }
            }
        .navigationBarTitle(pokemonName.prefix(1).uppercased() + pokemonName.dropFirst())
        }
        .onAppear {
            Api().getPokemonDetails(url: self.url) { (pokemonInfo) in
                print(pokemonInfo)
                self.pokemonId = String(format: "#%03d", pokemonInfo.id)
                self.pokemonName = pokemonInfo.name
                self.pokemonTypes = pokemonInfo.types
            }
        }
    }
}

