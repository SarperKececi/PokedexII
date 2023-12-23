import SwiftUI

class PokemonListViewModel: ObservableObject {
    @Published var pokemon: [PokemonEntry] = []
    @Published var pokemonImageURL: [String: String] = [:]
    @Published var pokemonDetail: PokemonDetailModel?

    func fetchPokemon() {
        PokemonService.fetchPokemon { result in
            switch result {
            case .success(let pokemonResponse):
                DispatchQueue.main.async {
                    self.pokemon = pokemonResponse.results
                }
            case .failure(let error):
                print("API Request Error: \(error)")
            }
        }
    }

    func fetchPokemonDetailForImage(url: String, completion: @escaping (Result<String, Error>) -> Void) {
        print("Fetching image URL for Pokemon with URL: \(url)")
        PokemonService.fetchPokemonDetail(url: url) { result in
            switch result {
            case .success(let pokemonDetail):
                DispatchQueue.main.async {
                    // Sadece görsel URL'yi döndür
                    let imageURL = pokemonDetail.frontDefaultURL?.absoluteString ?? ""
                    completion(.success(imageURL))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }


    func fetchPokemonDetail(url: String) {
        print("Fetching details for Pokemon with URL: \(url)")
        PokemonService.fetchPokemonDetail(url: url) { result in
            switch result {
            case .success(let pokemonDetail):
                DispatchQueue.main.async {
                    self.pokemonDetail = pokemonDetail
                }
            case .failure(let error):
                print("API Request Error: \(error)")
            }
        }
    }
}
