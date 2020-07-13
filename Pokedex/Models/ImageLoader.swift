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
    
    // load the image data as soon it ImageLoader instantiated
    init(url: String) {
        // create url
        guard let url = URL(string: url) else {
            print("Couldn't load data.")
            fatalError("Couldn't load data.")
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, respose, error) in
            // check if data is loaded
            guard let URLData = data else {
                print("Couldn't load data")
                fatalError("Couldn't load data")
            }
            
            // dispatch update to main thread
            DispatchQueue.main.sync {
                self.receivedData = true
                self.data = URLData
            }
        }
        task.resume()
    }
}
