//
//  ProgramSearchRouter.swift
//  NHKSearcher
//
//  Created by hayato sugawara on 2023/08/13.
//

import SwiftUI

struct ProgramSearchRouter {
    func navigationLink(program: Program) -> some View{
        return NavigationLink(destination: <#T##() -> Destination#>, label: <#T##() -> Label#>)
    }
}

struct ProgramSearchRouter_Previews: PreviewProvider {
    static var previews: some View {
        ProgramSearchRouter().navigationLink(program: Program.mockProgram)
    }
}
