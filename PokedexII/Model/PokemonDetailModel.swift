//
//  PokemonDetailModel.swift
//  PokedexII
//
//  Created by Sarper Kececi on 30.11.2023.
///Users/sarperkececi/Desktop/Swift./PokedexII/PokedexII/Model/PokemonDetailModel.swift



import Foundation
struct PokemonDetailModel : Codable {
    var sprites: PokemonSprites
    var weight: Int
    var height : Int
    var forms : [PokemonForm]
    

    var frontDefaultURL: URL? {
        return URL(string: sprites.front_default)
    }
}

struct PokemonSprites: Codable {
    var front_default:String
}
 
struct PokemonForm : Codable {
    var name : String
    var url : String
}

