import SwiftUI

struct PokemonSplashView: View {
    @State private var isActive: Bool = false

    var body: some View {
        VStack {
            Text("Pokedex App")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding()
            
            Image("poke") // "poke" adlı resminizin ismini kullanın
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
        }
     
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1)) // Sarımsı arka plan
      
    }
}

struct PokemonSplashView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonSplashView()
    }
}
