//
//  PokemonImage.swift
//  Pokedex
//
//  Created by Krishna Nanduri on 12/07/20.
//  Copyright © 2020 Krishna Nanduri. All rights reserved.
//

import SwiftUI

struct PokemonImage: View {
    @ObservedObject var imageLoader: ImageLoader
    @State var image: UIImage = UIImage()
    
    init(url: String) {
        imageLoader = ImageLoader(url: url)
    }
    
    func loadImage(data: Data) -> UIImage {
        UIImage(data: data) ?? UIImage()
    }
    
    var body: some View {
        VStack {
            Image(uiImage: imageLoader.receivedData ? loadImage(data: imageLoader.data!) : UIImage())
                .resizable()
                .frame(width: 100, height: 100)
        }
    }
}

struct PokemonImage_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImage(url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png")
    }
}
