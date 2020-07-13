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
    @State var pokemonImageURL: String = ""
    @State var pokemonDescription: String = ""
    
    @State var imageLoaded: Bool = false
    
    @Binding var caughtPokemon: [Int]
    
    var body: some View {
        VStack(spacing: 20) {
            if self.pokemonName.isEmpty {
                Text("")
            } else {
                PokemonImage(url: pokemonImageURL)
                
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
                    } else {
                        let index = self.caughtPokemon.firstIndex(of: self.pokemonId)
                        self.caughtPokemon.remove(at: index!)
                    }
//                    print(self.caughtPokemon)
                    UserDefaults.standard.set(self.caughtPokemon, forKey: "caught")
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

                Text(pokemonDescription)
                    .padding()
                
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
                self.pokemonImageURL = pokemonInfo.sprites.front_default
                
                Api().getPokemonDescription(url: "https://pokeapi.co/api/v2/pokemon-species/" + String(self.pokemonId) + "/") { (pokemonDescription) in
                    self.pokemonDescription = pokemonDescription
                }
            }
        }
    }
}

