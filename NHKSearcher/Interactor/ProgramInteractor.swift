//
//  ProgramInteractor.swift
//  NHKSearcher
//
//  Created by hayato sugawara on 2023/08/09.
//

import Foundation

protocol ModelInput{
    func fetchProgram(area: String, service: String, date: String, apiKey: String, completion: @escaping (Result<[Program], ModelError>) -> Void)
}

struct ProgramInteractor: ModelInput{
    private var endpoint: URLComponents{
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.nhk.or.jp"
        return components
    }
    
    func fetchProgram(area: String, service: String, date: String, apiKey: String, completion: (Result<[Program], ModelError>) -> Void) {
        guard let url = programSearchEndpoint(area: area, service: service, date: date, apiKey: apiKey) else {
                    completion(.failure(.urlError))
                    return
                }
        
        Task{
            let result = await fetch(url: url)
        }
    }
    
    private func programSearchEndpoint(area: String, service: String, date: String, apiKey: String) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.path = "/v2/pg/list/\(area)/\(service)/\(date).json"
        urlComponents.queryItems = [
            URLQueryItem(name: "key", value: apiKey)
        ]
        
        return urlComponents.url
    }
    
    @MainActor
    private func fetch(url: URL) async -> Result<Data, Error>{
        do {
            let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
            return .success(data)
        } catch {
            return .failure(error)
        }
    }
}
