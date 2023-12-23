import SwiftUI
import Kingfisher

struct PokemonDetail: View {
    let pokemonUrl: String
    @ObservedObject private var detailViewModel = PokemonListViewModel()

    var body: some View {
        VStack {
            Text("Pokemon Detail")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)

            if let pokemonDetail = detailViewModel.pokemonDetail {
                KFImage(pokemonDetail.frontDefaultURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                
                Text("Weight: \(pokemonDetail.weight)")
                    .font(.title2)
                    .padding()
                Text("Height: \(pokemonDetail.height)")
                    .font(.title2)
                    .padding()
            } else {
                Text("Loading...")
                    .font(.title2)
            }
        }
        .onAppear {
            detailViewModel.fetchPokemonDetail(url: pokemonUrl)
        }
        .padding()
    }
}
