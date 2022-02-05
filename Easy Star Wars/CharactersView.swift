//
//  CharactersView.swift
//  Easy Star Wars
//
//  Created by Arthur Rodrigues on 09/01/22.
//

import SwiftUI

struct CharacterViewModel: Hashable {
    var name: String
    var specie: String
    var image: String
}

struct CharactersView: View {
    
    let characters: [CharacterViewModel] = [
        CharacterViewModel(name: "Luke Skywalker", specie: "Human", image: "phasma"),
        CharacterViewModel(name: "Phasma", specie: "Human", image: "phasma")
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(characters, id: \.self) { character in
                        CharacterCell(character: character)
                    }
                } // Section
                header: {
                    Text("Human").foregroundColor(.green)
                }
                .headerProminence(.increased)
            }
            .navigationTitle("Characters")
        }
    }
}

struct CharacterCell: View {
    
    let character: CharacterViewModel
    
    var body: some View {
        HStack {
            Image("Phasma")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 72.0, height: 72.0)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 8) {
                Text(character.name)
                    .foregroundColor(.black)
                    .bold()
                Text(character.specie)
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
            CharactersView()
            CharactersView()
        }
    }
}
