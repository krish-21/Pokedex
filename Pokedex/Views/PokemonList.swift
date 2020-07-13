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
    @State var caughtPokemon: [Int] = []
    
    @State private var searchPokemon = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchPokemon)
                    .padding(.top, 10)
                List(pokemonData.filter({searchPokemon.isEmpty ? true : $0.name.contains(searchPokemon.lowercased())})) { pokemon in
                    NavigationLink(destination: PokemonDetail(url: pokemon.url, caughtPokemon: self.$caughtPokemon)) {
                            PokemonRow(pokemon: pokemon)
                    }
                    .navigationBarTitle("Pokèdex", displayMode: .inline)
                }
            }
        }
        .onAppear {
            Api().getPokemonList { (pokemon) in
                self.pokemonData = pokemon
                
                self.caughtPokemon = UserDefaults.standard.array(forKey: "caught") as? [Int] ?? [Int]()
            }
        }
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    }
}
