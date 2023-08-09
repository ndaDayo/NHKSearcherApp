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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ProgramSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ProgramSearchView()
    }
}
