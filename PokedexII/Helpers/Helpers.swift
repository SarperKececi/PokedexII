//
//  Helpers.swift
//  PokedexII
//
//  Created by Sarper Kececi on 30.11.2023.
//

import Foundation
import Alamofire

struct PokemonService {
    static func fetchPokemon(completion: @escaping (Result<PokemonResponse, Error>) -> Void) {
        let apiUrl = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151"
        
        AF.request(apiUrl)
          
            .responseDecodable(of: PokemonResponse.self) { response in
                switch response.result {
                case .success(let pokemonResponse):
                    completion(.success(pokemonResponse))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    
    static func fetchPokemonDetail(url: String, completion: @escaping (Result<PokemonDetailModel, Error>) -> Void) {
          AF.request(url)
              .responseDecodable(of: PokemonDetailModel.self) { response in
                  switch response.result {
                  case .success(let pokemonDetail):
                      completion(.success(pokemonDetail))
                  case .failure(let error):
                      completion(.failure(error))
                  }
              }
      }
    
   
}
