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
        NavigationLink(<#LocalizedStringKey#>) {
            VStack {
                TextField("area", text: $searchText)
                    .onChange(of: searchText) { _ in
                        presenter.loadStart(area: searchText)
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle()
                    .keyboardType(.asciiCapable)
                    .padding()
            }
        }
    }
}

struct ProgramSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramSearchView()
    }
}
