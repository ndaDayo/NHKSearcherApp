//
//  ProgramSearchPresenter.swift
//  NHKSearcher
//
//  Created by hayato sugawara on 2023/08/09.
//

import Combine

class ProgramSearchPresenter: ObservableObject{
    let router = ProgramSearchRouter()
    let model: ModelInput
    
    init(model: ProgramInteractor = ProgramInteractor()) {
        self.model = model
        <#statements#>
    }
}
