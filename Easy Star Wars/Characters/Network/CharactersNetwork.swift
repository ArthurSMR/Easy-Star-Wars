//
//  CharactersNetwork.swift
//  Easy Star Wars
//
//  Created by Arthur Rodrigues on 05/02/22.
//

import Foundation

public typealias NetworkResult<T> = Result<T, NetworkError>

final class NetworkCharactersProvider {
    
//    let requestManager: RequestManager = RequestManager()
    
    init() { }
}

extension NetworkCharactersProvider: NetworkCharactersQuery {
    
    func getCharacters(onCompletion: @escaping (NetworkResult<[CharacterModel]>) -> Void) {
        
        guard let url = URL(string: "https://akabab.github.io/starwars-api/api/all.json") else { return }
        
        URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            
            if let error = error {
                print(error.localizedDescription)
                onCompletion(.failure(.internalError(error)))
            }
            
            if let data = data {
                do {
                    let characters = try JSONDecoder().decode([CharacterModel].self, from: data)
                    onCompletion(.success(characters))
                } catch {
                    onCompletion(.failure(.unableToMapModel))
                }
            }
        }.resume()
        
        // Request to Request Manager
    }
}
