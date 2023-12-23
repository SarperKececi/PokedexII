//
//  PokemonModel.swift
//  PokedexII
//
//  Created by Sarper Kececi on 30.11.2023.
//


import Foundation

struct PokemonResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonEntry]
}

struct PokemonEntry: Codable, Identifiable {
    var id: UUID? = UUID() // Eklenen satır
    let name: String
    let url: String
}
