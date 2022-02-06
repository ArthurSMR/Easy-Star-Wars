//
//  NetworkInterface.swift
//  Easy Star Wars
//
//  Created by Arthur Rodrigues on 05/02/22.
//

import Foundation

public enum NetworkError: Error {
    case invalidURL
    case statusCodeNotAcceptable
    case errorWithStatusCode(statusCode: Int?, error: Error)
    case notSafeData
    case notJSONSerializable
    case unableToMapModel
    case unableToDetermineDataAsJSON
    case unableToGetUserToken
    case unableToGetOffer
    case providerDoNotMatchType
    case internalError(Error)
}

protocol NetworkQuery {}

protocol NetworkCharactersQuery: NetworkQuery {
    func getCharacters(onCompletion: @escaping (NetworkResult<[CharacterModel]>) -> Void)
}
