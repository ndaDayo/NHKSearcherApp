//
//  ProgramSearchPresenter.swift
//  NHKSearcher
//
//  Created by hayato sugawara on 2023/08/09.
//

import Combine

class ProgramSearchPresenter: ObservableObject {
    let router = ProgramSearchRouter()
    let model: ModelInput
    private(set) var objectWillChange = ObservableObjectPublisher()
    @Published var programs: [Program]
    @Published var isNotFound: Bool
    @Published var error: ModelError?
    
    init(model: ProgramInteractor = ProgramInteractor(),
         programs: [Program] = [Program](), isNotFound: Bool = false, error: ModelError? = nil) {
        self.model = model
        self.programs = programs
        self.isNotFound = isNotFound
        self.error = error
    }
    
    func loadStart(area: String) {
        guard !area.isEmpty else { return }
        programs = [Program]()
        isNotFound = false
        error = nil
        
        model.fetchProgram(area: area) { [weak self] result in
            switch result {
            case .success(let programs):
                if !programs.isEmpty {
                    self?.programs = programs
                } else {
                    self?.isNotFound = true
                }
            case .failure(let error):
                self?.error = error
            }
            self?.objectWillChange.send()
        }
    }
}
