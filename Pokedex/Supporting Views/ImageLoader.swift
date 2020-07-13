//
//  ImageLoader.swift
//  Pokedex
//
//  Created by Krishna Nanduri on 12/07/20.
//  Copyright © 2020 Krishna Nanduri. All rights reserved.
//

import SwiftUI

class ImageLoader: ObservableObject {
    @Published var receivedData = false
    var data: Data?
    
    // load the image as soon it is instantiated
    init(url: String) {
        print("Image URL: ")
        print(url)
        guard let url = URL(string: url) else {
            print("Couldn't load data.")
            fatalError("Couldn't load data.")
        }
        print("URL Ok")
        
        URLSession.shared.dataTask(with: url) { (data, respose, error) in
            guard let URLData = data else {
                print("Couldn't load data")
                fatalError("Couldn't load data")
            }
            
            print("received URL Data")
            
            DispatchQueue.main.sync {
                self.receivedData = true
                self.data = URLData
            }
        }
        .resume()
    }
    
}
