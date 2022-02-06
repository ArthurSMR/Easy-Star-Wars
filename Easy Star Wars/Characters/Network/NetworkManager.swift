//
//  NetworkManager.swift
//  Easy Star Wars
//
//  Created by Arthur Rodrigues on 05/02/22.
//

import Foundation

class NetworkManager {
    
    init() { }
    
    func configureCharactersQueries() -> NetworkCharactersQuery {
        let provider = NetworkCharactersProvider()
        return provider
    }
}

