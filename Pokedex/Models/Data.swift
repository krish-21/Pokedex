//
//  Data.swift
//  Pokedex
//
//  Created by Krishna Nanduri on 12/07/20.
//  Copyright © 2020 Krishna Nanduri. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class Api {
    func getPokemonList(completion: @escaping ([Pokemon]) -> ()) {
       
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else {
            print("getPokemonList(): Couldn't open url.")
            fatalError("Couldn't open url.")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let JSONdata = data else {
                print("getPokemonList(): Couldn't load data.")
                fatalError("Couldn't load data.")
            }
            
            do {
                let allData = try JSONDecoder().decode(PokemonResults.self, from: JSONdata)
                let data = allData.results
//                print("getPokemonList(): start of data")
//                for row in data {
//                    print(row)
//                }
//                print("getPokemonList(): end of data")
                
                DispatchQueue.main.async {
                    completion(data)
                }
            }
            catch let error {
                print("getPokemonList(): E R R O R")
                print(error)
            }
        }
        .resume()
    }
    
    func getPokemonDetails(url: String, completion: @escaping (PokemonInformation) -> ()) {
        guard let url = URL(string: url) else {
            print("getPokemonDetails(): Couldn't open url.")
            fatalError("Couldn't open url.")
        }
        
//        print("getPokemonDetails(): url is alright")
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let JSONData = data else {
                print("getPokemonDetails(): Couldn't load data.")
                fatalError("Couldn't load data.")
            }
            
//            print("getPokemonDetails(): JSON Data is alright")
//            print(JSONData)
            
            do {
                let data = try JSONDecoder().decode(PokemonInformation.self, from: JSONData)
//                print("getPokemonDetails(): start of data")
//                print(data)
//                print("getPokemonDetails(): end of data")
                
                DispatchQueue.main.async {
                    completion(data)
                }
            }
            catch let error {
                print("getPokemonDetails(): E R R O R")
                print(error)
            }
        }
        .resume()
    }
    
    func getPokemonDescription (url: String, completion: @escaping (String) -> ()) {
        guard let url = URL(string: url) else {
            print("getPokemonDescription(): Couldn't open url.")
            fatalError("Couldn't open url.")
        }
        
//        print("getPokemonDescription(): url is alright")
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let JSONData = data else {
                print("getPokemonDescription(): Couldn't load data.")
                fatalError("Couldn't load data.")
            }
            
//            print("getPokemonDescription(): JSON Data is alright")
//            print(JSONData)
            
            do {
                let data = try JSONDecoder().decode(PokemonDescription.self, from: JSONData)
//                print("getPokemonDescription(): start of data")
//                print(data)
//                print("getPokemonDescription(): end of data")
                
                let filteredData = data.flavor_text_entries.filter {$0.language.name == "en"}
                
                let description = filteredData[0].flavor_text
//                print("after data filtering: ")
//                debugPrint(description)
                
                var filteredString = ""
                
                for char in description {
                    if " \n\t\r\u{0C}".contains(char) {
                        filteredString += " "
                    } else {
                        filteredString += String(char)
                    }
                }
                
//                print("after String filtering: ")
//                debugPrint(filteredString)
                
//                print("individual characters")
//                for char in filteredString {
//                    debugPrint(char)
//                }
                
                DispatchQueue.main.async {
                    completion(filteredString)
                }
            }
            catch let error {
                print("getPokemonDescription(): E R R O R")
                print(error)
            }
        }
        .resume()
    }
}
