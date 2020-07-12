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
    
    @State var pokemonId: Int = 0
    @State var pokemonName: String = ""
    @State var pokemonTypes: [PokemonTypeEntry] = []
    @State var isCaptured: Bool = false
    
    @Binding var caughtPokemon: [Int]
    
    var body: some View {
        VStack(spacing: 20) {
            if self.pokemonName.isEmpty {
                Text("")
            } else {
                Text(pokemonName.prefix(1).uppercased() + pokemonName.dropFirst())
                    .font(.system(size: 30))
                Text(String(format: "#%03d", pokemonId))
                    .font(.system(size: 26))
                HStack(spacing: 40) {
                    ForEach(pokemonTypes, id: \.slot) { typeEntry in
                        PokemonTypeView(typeEntry: typeEntry)
                    }
                }
                Button(action: {
                    if !self.isCaptured {
                        self.caughtPokemon.append(self.pokemonId)
                        print(self.caughtPokemon)
                    } else {
                        let index = self.caughtPokemon.firstIndex(of: self.pokemonId)
                        self.caughtPokemon.remove(at: index!)
                        print(self.caughtPokemon)
                    }
                    self.isCaptured.toggle()
                }) {
                    if !isCaptured {
                        Text("Capture")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .font(.title)
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(36)
                    } else {
                        Text("Release")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .font(.title)
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(36)
                    }
                    
                }
                .navigationBarTitle(pokemonName.prefix(1).uppercased() + pokemonName.dropFirst())
            }
                
        }
        .onAppear {
            Api().getPokemonDetails(url: self.url) { (pokemonInfo) in
                print(pokemonInfo)
                self.pokemonId = pokemonInfo.id
                self.pokemonName = pokemonInfo.name
                self.pokemonTypes = pokemonInfo.types
                self.isCaptured = self.caughtPokemon.contains(self.pokemonId)
            }
        }
    }
}

