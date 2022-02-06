//
//  CharactersViewModel.swift
//  Easy Star Wars
//
//  Created by Arthur Rodrigues on 05/02/22.
//

import SwiftUI

class CharactersViewModel: ObservableObject {
    
    @Published private var charactersViewModel: Characters = Characters()
    private var characterProvider: NetworkCharactersQuery
    
    // MARK: - Initialization
    
    init(network: NetworkManager) {
        self.characterProvider = network.configureCharactersQueries()
        
        fetchCharacters()
    }
    
    private func fetchCharacters() {
        
        characterProvider.getCharacters { result in
            
            switch result {
            case let .success(characters):
                self.updateViewModel(with: characters)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func updateViewModel(with characters: [CharacterModel]) {
        charactersViewModel.characters = characters
    }
    
    // MARK: - Access to the model
    
    var characters: [CharacterModel] {
        charactersViewModel.characters
    }
}
