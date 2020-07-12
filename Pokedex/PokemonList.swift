//
//  PokemonList.swift
//  Pokedex
//
//  Created by Krishna Nanduri on 12/07/20.
//  Copyright © 2020 Krishna Nanduri. All rights reserved.
//

import SwiftUI

struct PokemonList: View {
    @State var pokemonData: [Pokemon] = []
    
    var body: some View {
        NavigationView {
            List(pokemonData) { pokemon in
                NavigationLink(destination: PokemonDetail(url: pokemon.url)) {
                        PokemonRow(pokemon: pokemon)
                }
                .navigationBarTitle("Pokèdex", displayMode: .inline)
            }
        }
        .onAppear {
            Api().getPokemonList { (pokemon) in
                self.pokemonData = pokemon
            }
        }
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    }
}
