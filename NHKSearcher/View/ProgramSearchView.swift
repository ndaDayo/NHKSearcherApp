//
//  ProgramSearchView.swift
//  NHKSearcher
//
//  Created by hayato sugawara on 2023/08/09.
//

import SwiftUI

struct ProgramSearchView: View {
    @State private var  searchText: String = ""
    @StateObject var presenter: ProgramSearchPresenter
    
    init(presenter: ProgramSearchPresenter = ProgramSearchPresenter()) {
        _presenter = StateObject(wrappedValue: presenter)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("area", text: $searchText)
                    .onChange(of: searchText) { _ in
                        presenter.loadStart(area: searchText)
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.asciiCapable)
                    .padding()
                if let error = presenter.error {
                    Text(error.localizedDescription)
                } else {
                    List(presenter.programs) { program in
                        presenter.router.navigationLink(program: program)
                    }
                    .refreshable {
                        presenter.loadStart(area: searchText)
                    }
                }
            }
        }
        .navigationTitle("Search NHK Program")
    }
}

struct ProgramSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramSearchView()
    }
}
