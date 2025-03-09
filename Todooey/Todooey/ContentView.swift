//
//  ContentView.swift
//  Todooey
//
//  Created by Jiyoon Moon on 2/23/25.
//

import SwiftUI

struct Todo: Identifiable {
    var id = UUID()
    var item: String
    var isDone: Bool
}

struct ContentView: View {
    @State private var todos = [
        Todo(item: "Buy Groceries", isDone: false),
        Todo(item: "Finish hw", isDone: false), Todo(item: "", isDone: false),
    ]
    @State private var numbers = [Int]()
    @State private var isInfoPresented: Bool = false
    @State private var title: String = "Todoey"
    @State private var selectedColor: Color = .blue
    
    func addTodo() {
        todos.append(Todo(item: "New Task", isDone: false))
    }

    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.largeTitle)
                    .foregroundStyle(selectedColor)
                    .fontWeight(.bold)
                Spacer()

                Button {
                    isInfoPresented.toggle()
                } label: {
                    Image(systemName: "info.circle")
                }
            }
            .foregroundStyle(selectedColor)
            .padding()
            List {
                TodoRowView(todos: $todos, selectedColor: $selectedColor)
            }

            .listStyle(.plain)
            .scrollContentBackground(.hidden)

            HStack {
                Button(action: addTodo) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)

                    Text("New Reminder")
                        .fontWeight(.bold)

                    Spacer()
                }
                .buttonStyle(.plain)
                .padding()
            }
            .foregroundStyle(selectedColor)
        }
        .preferredColorScheme(.dark)
        .sheet(isPresented: $isInfoPresented) {
            InfoView(title: $title, selectedColor: $selectedColor)
        }
    }
}

#Preview {
    ContentView()
}
