//
//  CharactersView.swift
//  Easy Star Wars
//
//  Created by Arthur Rodrigues on 09/01/22.
//

import SwiftUI

struct CharactersView: View {
    
    @ObservedObject var viewModel: CharactersViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.characters, id: \.self) { character in
                    CharacterCell(character: character)
                }
            }
            .navigationTitle("Characters")
        }
    }
}

struct CharacterCell: View {
    
    let character: CharacterModel
    
    var body: some View {
        HStack {
            Image(uiImage: character.image?.load() ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 72.0, height: 72.0)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 8) {
                Text(character.name)
                    .foregroundColor(.black)
                    .bold()
                Text(character.species)
                    .foregroundColor(.gray)
            } // VStack
            
            Spacer()
            
            Image("millennium_falcon")
                .resizable()
                .frame(width: 32.0, height: 32.0)
        } // HStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CharactersView(viewModel: CharactersViewModel(network: NetworkManager()))
        }
    }
}
