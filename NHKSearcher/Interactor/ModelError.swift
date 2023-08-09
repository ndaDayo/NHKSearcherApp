//
//  ModelError.swift
//  NHKSearcher
//
//  Created by hayato sugawara on 2023/08/09.
//

import Foundation

enum ModelError{
    case urlError
    case responseError(Error)
    case responseDataEmpty
    case jsonParseError(String)
}
