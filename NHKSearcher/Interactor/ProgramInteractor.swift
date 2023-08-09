//
//  ProgramInteractor.swift
//  NHKSearcher
//
//  Created by hayato sugawara on 2023/08/09.
//

import Foundation

protocol ModelInput{
    func fetchProgram(query: String, completion: @escaping (Result<[Program], ModelError>) -> Void){
        
    }
}
