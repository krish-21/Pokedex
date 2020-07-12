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
            print("Couldn't open url.")
            fatalError("Couldn't open url.")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let JSONdata = data else {
                print("Couldn't load data.")
                fatalError("Couldn't load data.")
            }
            
            do {
                let allData = try JSONDecoder().decode(PokemonResults.self, from: JSONdata)
                let data = allData.results
                print("start of data")
                for row in data {
                    print(row)
                }
                print("end of data")                
                
                DispatchQueue.main.async {
                    completion(data)
                }
            }
            catch let error {
                print("E R R O R")
                print(error)
            }
        }
        .resume()
    }
    
    func getPokemonDetails(url: String, completion: @escaping (PokemonInformation) -> ()) {
        guard let url = URL(string: url) else {
            print("Couldn't open url.")
            fatalError("Couldn't open url.")
        }
        
        print("url is alright")
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let JSONData = data else {
                print("Couldn't load data.")
                fatalError("Couldn't load data.")
            }
            
            print("JSON Data is alright")
            print(JSONData)
            
            do {
                let data = try JSONDecoder().decode(PokemonInformation.self, from: JSONData)
                print("start of data")
                print(data)
                print("end of data")
                
                DispatchQueue.main.async {
                    completion(data)
                }
            }
            catch let error {
                print("E R R O R")
                print(error)
            }
        }
        .resume()
    }
}
