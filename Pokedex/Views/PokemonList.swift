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
                // Search Bar
                SearchBar(text: $searchPokemon)
                    .padding(.top, 10)
                
                // If Search Bar is empty: list all Pokèmon
                // else: list Pokèmon matching user input
                List(pokemonData.filter({searchPokemon.isEmpty ? true : $0.name.contains(searchPokemon.lowercased())})) { pokemon in
                    NavigationLink(destination: PokemonDetail(url: pokemon.url, caughtPokemon: self.$caughtPokemon)) {
                            PokemonRow(pokemon: pokemon)
                    }
                    .navigationBarTitle("Pokèdex", displayMode: .inline)
                }
            }
        }
        .onAppear {
            // API call to list Pokèmon
            // limit of 151 hardcoded in Data.swift
            Api().getPokemonList { (pokemon) in
                self.pokemonData = pokemon
                // load the saved Array of all the caught Pokèmon
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
