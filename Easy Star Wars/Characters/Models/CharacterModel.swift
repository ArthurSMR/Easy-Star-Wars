//
//  CharacterModel.swift
//  Easy Star Wars
//
//  Created by Arthur Rodrigues on 05/02/22.
//

import Foundation

struct CharacterModel: Hashable {
    var identifier: Int
    var name: String
    var species: String
    var image: URL?
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case species
        case image
    }
}

extension CharacterModel: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        identifier = try values.decode(Int.self, forKey: .identifier)
        name = try values.decode(String.self, forKey: .name)
        species = try values.decode(String.self, forKey: .species)
        
        // Duvida (se vier nil, o que acontece? Retorna pelo throws e não segue adiante?
        let imageString = try values.decode(String.self, forKey: .image)
        
        guard let url = URL(string: imageString) else { return }
        self.image = url
    }
}
