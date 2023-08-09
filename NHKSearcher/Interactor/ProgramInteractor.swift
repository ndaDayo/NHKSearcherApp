//
//  ProgramInteractor.swift
//  NHKSearcher
//
//  Created by hayato sugawara on 2023/08/09.
//

import Foundation

protocol ModelInput{
    func fetchProgram(query: String, completion: @escaping (Result<[Program], ModelError>) -> Void)
}

struct ProgramInteractor: ModelInput{
    private var endpoint: URLComponents{
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.nhk.or.jp"
        return components
    }
    
    func fetchProgram(query: String, completion: (Result<[Program], ModelError>) -> Void) {
        guard !query.isEmpty, let programSearchEndpoint(query: query) else{
            completion(.failure(.urlError))
            return
        }
        
    }
}
