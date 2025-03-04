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
    @State private var todos = [Todo(item: "Buy Groceries", isDone: false), Todo(item: "Finish hw", isDone: false), Todo(item: "", isDone: false)]
    @State private var numbers = [Int]()
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
    
    func addTodo() {
            todos.append(Todo(item: "New Task", isDone: false))
        }
    
    var body: some View {
        VStack{
            HStack{Text("Todoey")
                    .font(.largeTitle)
                    .foregroundStyle(.yellow)
                Spacer()
            }
            .padding()
            List {
                ForEach($todos) {$todo in
                    HStack {Button {
                        todo.isDone.toggle()
                    } label:
                        {todo.isDone ? Image(systemName: "circle.fill"):Image(systemName: "circle")}
                        TextField("", text: $todo.item)
                            .textFieldStyle(.roundedBorder)
                            .foregroundStyle(todo.isDone ? .gray : .black)
                    }
                }
                .onDelete(perform: removeRows)
            }
            
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            
            HStack {Button(action: addTodo) {
                Image(systemName: "plus.circle.fill")
                    .foregroundStyle(.yellow)
                    .font(.title)
                Text("Add New Task")
                Spacer()
                }
            .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
