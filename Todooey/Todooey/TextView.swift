//
//  TextView.swift
//  Todooey
//
//  Created by Jiyoon Moon on 3/4/25.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(alignment: .leading){
                HStack {Text("Todoey")
                        .font(.largeTitle)
                        .foregroundStyle(.yellow)
                    Spacer()
                }
                Spacer()
            }
            .padding()
        }
    }
}
#Preview {
    TextView()
}
