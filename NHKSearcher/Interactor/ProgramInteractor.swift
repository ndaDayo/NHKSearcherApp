//
//  ProgramInteractor.swift
//  NHKSearcher
//
//  Created by hayato sugawara on 2023/08/09.
//

import Foundation

protocol ModelInput {
    func fetchProgram(area: String, completion: @escaping (Result<[Program], ModelError>) -> Void)
}

struct ProgramInteractor: ModelInput {
    private var endpoint: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.nhk.or.jp"
        return components
    }
    
    func fetchProgram(area: String, completion: @escaping (Result<[Program], ModelError>) -> Void) {
        guard let url = programSearchEndpoint(area: area) else {
                    completion(.failure(.urlError))
                    return
                }
        
        Task {
            let result = await fetch(url: url)
            switch result {
            case .success(let data):
                guard let programs = try? JSONDecoder().decode(Programs.self, from: data) else {
                    completion(.failure(.jsonParseError(String(data: data, encoding: .utf8) ?? "")))
                    return
                }
                completion(.success(programs.items()))
            case .failure(let error):
                completion(.failure(.responseError(error)))
            }
        }
    }
    
    private func programSearchEndpoint(area: String) -> URL? {
        var urlComponents = endpoint
        urlComponents.path = "/v2/pg/list/\(area)/g1/2023-08-15.json"
        urlComponents.queryItems = [
            URLQueryItem(name: "key", value: AccessTokens.accessKey)
           ]
        dump(urlComponents.url)
        return urlComponents.url
    }
    
    @MainActor
    private func fetch(url: URL) async -> Result<Data, Error> {
        do {
            let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
            return .success(data)
        } catch {
            return .failure(error)
        }
    }
}
