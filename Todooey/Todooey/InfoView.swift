//
//  InfoView.swift
//  Todooey
//
//  Created by Jiyoon Moon on 3/9/25.
//

import SwiftUI

struct InfoView: View {
    @Binding var title: String
    @Binding var selectedColor: Color
    
    let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple, .white]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.darkGray))
                    .frame(width: 300, height: 150)
                    .overlay(
                        VStack {
                            Image(systemName: "list.bullet.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(selectedColor)
                            
                            TextField("", text: $title)
                                .foregroundColor(selectedColor)
                                .font(.title2)
                                .multilineTextAlignment(.center)
                                .padding()
                                .background(Color(.gray).opacity(0.2))
                                .cornerRadius(10)
                                .frame(width: 250)
                        }
                    )
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.darkGray))
                    .frame(width: 300, height: 100)
                    .overlay(
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 5), spacing: 10) {
                            ForEach(colors, id: \.self) { color in
                                Circle()
                                    .fill(color)
                                    .frame(width: 30, height: 30)
                                    .onTapGesture {
                                        selectedColor = color
                                    }
                            }
                        }
                        .padding()
                    )
            }
        }
    }
}


//
//#Preview {
//    InfoView()
//}
