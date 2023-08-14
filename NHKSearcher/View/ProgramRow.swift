//
//  ProgramRow.swift
//  NHKSearcher
//
//  Created by hayato sugawara on 2023/08/13.
//

import SwiftUI

struct ProgramRow: View {
    let program: Program
    
    var body: some View {
        HStack {
            Text(program.title)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
        }
    }
}
