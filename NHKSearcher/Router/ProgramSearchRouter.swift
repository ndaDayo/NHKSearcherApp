//
//  ProgramSearchRouter.swift
//  NHKSearcher
//
//  Created by hayato sugawara on 2023/08/13.
//

import SwiftUI

struct ProgramSearchRouter {
    func navigationLink(program: Program) -> some View {
        return NavigationLink(program.title, destination: ProgramRow(program: program))
    }
}
