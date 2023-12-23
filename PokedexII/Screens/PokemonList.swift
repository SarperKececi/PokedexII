import SwiftUI
import Kingfisher

struct PokemonList: View {
    @ObservedObject var viewModel = PokemonListViewModel()
    @State private var searchText = ""
 
    var filteredPokemon: [PokemonEntry] {
        if searchText.isEmpty {
            return viewModel.pokemon
        } else {
            return viewModel.pokemon.filter { pokemon in
                pokemon.name.lowercased().contains(searchText.lowercased())
            }
        }
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(filteredPokemon, id: \.name) { pokemon in
                        NavigationLink(destination: PokemonDetail(pokemonUrl: pokemon.url)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundColor(Color.gray.opacity(0.1))
                                    .frame(height: 80)
                                
                                HStack {
                                    if let pokemonImageURL = viewModel.pokemonImageURL[pokemon.url] {
                                        KFImage(URL(string: pokemonImageURL))
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50, height: 50)
                                            .clipShape(Circle())
                                    } else {
                                        Circle()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(.black)
                                    }
                                    
                                    Text(pokemon.name)
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.blue)
                                        .lineLimit(1) // Sadece bir satıra sığdır
                                    
                                    Spacer()

                                    Image(systemName: "chevron.right.circle")
                                        .foregroundColor(.gray)
                                }
                                .padding()
                            }
                            .onAppear {
                                viewModel.fetchPokemonDetailForImage(url: pokemon.url) { result in
                                    switch result {
                                    case .success(let imageURL):
                                        viewModel.pokemonImageURL[pokemon.url] = imageURL
                                    case .failure(let error):
                                        print("Error fetching Pokemon image URL: \(error)")
                                    }
                                }
                            }
                        }
                        .buttonStyle(PlainButtonStyle()) // Yol tarifindeki NavigationLink'leri düzelten bir stil
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, 10)
            }
            .navigationBarTitle("Pokemons", displayMode: .inline)
            .searchable(text: $searchText)
        }
        .onAppear {
            viewModel.fetchPokemon()
        }
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    }
}
