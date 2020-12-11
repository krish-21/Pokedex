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
       
        // create url
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else {
            print("getPokemonList(): Couldn't open url.")
            fatalError("Couldn't open url.")
        }
        
        // perform request
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // check if data is loaded
            guard let JSONdata = data else {
                print("getPokemonList(): Couldn't load data.")
                fatalError("Couldn't load data.")
            }
            
            do {
                // decode JSON
                let allData = try JSONDecoder().decode(PokemonResults.self, from: JSONdata)
                // extract results
                let data = allData.results
                
                // dispact the call to the main thread
                DispatchQueue.main.async {
                    completion(data)
                }
            }
            catch let error {
                print("getPokemonList(): ERROR")
                print(error)
            }
        }
        task.resume()
    }
    
    func getPokemonDetails(url: String, completion: @escaping (PokemonInformation) -> ()) {
        // create url
        guard let url = URL(string: url) else {
            print("getPokemonDetails(): Couldn't open url.")
            fatalError("Couldn't open url.")
        }
                
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // check if data is loaded
            guard let JSONData = data else {
                print("getPokemonDetails(): Couldn't load data.")
                fatalError("Couldn't load data.")
            }
            
            do {
                // decode JSON
                let data = try JSONDecoder().decode(PokemonInformation.self, from: JSONData)
                
                // dispact the call to the main thread
                DispatchQueue.main.async {
                    completion(data)
                }
            }
            catch let error {
                print("getPokemonDetails(): ERROR")
                print(error)
            }
        }
        task.resume()
    }
    
    func getPokemonDescription (url: String, completion: @escaping (String) -> ()) {
        // create url
        guard let url = URL(string: url) else {
            print("getPokemonDescription(): Couldn't open url.")
            fatalError("Couldn't open url.")
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // check if data is loaded
            guard let JSONData = data else {
                print("getPokemonDescription(): Couldn't load data.")
                fatalError("Couldn't load data.")
            }
            
            do {
                // decode JSON
                let data = try JSONDecoder().decode(PokemonDescription.self, from: JSONData)
                
                // filter descriptions for only english
                let filteredData = data.flavor_text_entries.filter {$0.language.name == "en"}
                
                // extract the first description
                let description = filteredData[0].flavor_text
                
                // create the string to hold the final description
                var filteredString = ""
                
                // filter the description string for wierd breaks
                for char in description {
                    if " \n\t\r\u{0C}".contains(char) {
                        filteredString += " "
                    } else {
                        filteredString += String(char)
                    }
                }
                
                // dispatch the call to the main thread
                DispatchQueue.main.async {
                    completion(filteredString)
                }
            }
            catch let error {
                print("getPokemonDescription(): ERROR")
                print(error)
            }
        }
        task.resume()
    }
}
