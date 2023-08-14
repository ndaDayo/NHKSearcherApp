//
//  ModelError.swift
//  NHKSearcher
//
//  Created by hayato sugawara on 2023/08/09.
//

import Foundation

enum ModelError: Error {
    case urlError
    case responseError(Error)
    case responseDataEmpty
    case jsonParseError(String)
    
    var localizedDescription: String {
        switch self {
        case .urlError: return "url error"
        case .responseError: return "api error"
        case .responseDataEmpty: return "response is nil"
        case .jsonParseError: return "json parse error"
        }
    }
}
