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
        VStack {
            let urlString = "https:" + program.service.logoS.url
            AsyncImage(url: URL(string: urlString))
                .clipShape(Circle())
                .frame(width: 10, height: 10)
                .padding()
            Text(program.title)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Text(program.subtitle)
        }
        HStack {
            Text(program.service.id)
            Text(program.service.name)
        }
    }
}
