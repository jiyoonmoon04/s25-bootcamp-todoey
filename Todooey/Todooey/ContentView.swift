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
        NavigationStack {
            VStack {
                HStack {
                    Text(title)
                        .font(.largeTitle)
                        .foregroundStyle(selectedColor)
                        .fontWeight(.bold)
                    Spacer()
                    
                    
                }
                .foregroundStyle(selectedColor)
                .padding()
                List {
                    TodoRowView(todos: $todos, selectedColor: $selectedColor)
                }
                
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .preferredColorScheme(.dark)
                .sheet(isPresented: $isInfoPresented) {
                    InfoView(title: $title, selectedColor: $selectedColor)
                }
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button {
                            isInfoPresented.toggle()
                        } label: {
                            Image(systemName: "info.circle")
                        }
                    }
                    ToolbarItem(placement: .bottomBar) {
                        Button(action: addTodo) {
                            Image(systemName: "plus.circle.fill")
                                .font(.title)
                                .foregroundStyle(selectedColor)
                            
                            Text("New Reminder")
                                .fontWeight(.bold)
                                .foregroundStyle(selectedColor)
                        }
                        .padding(.trailing, 190)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
