//
//  TodoRowView.swift
//  Todooey
//
//  Created by Jiyoon Moon on 3/9/25.
//

import SwiftUI

struct TodoRowView: View {
    @Binding var todos: [Todo]
    @Binding var selectedColor: Color
    
    var body: some View {
        ForEach($todos) { $todo in
            HStack {
                Button {
                    todo.isDone.toggle()
                } label: {
                    Group {
                        todo.isDone
                            ? Image(systemName: "circle.fill")
                            : Image(systemName: "circle")
                    }
                    .foregroundStyle(selectedColor)
                }
                .padding(.trailing, 7)

                TextField("", text: $todo.item)
                    .textFieldStyle(.plain)
                    .foregroundStyle(todo.isDone ? .gray : .white)
                    .font(.title2)
            }
        }
        .onDelete(perform: removeRows)
    }

    func removeRows(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
        print("\(todos)")
    }
}

#Preview {
    @Previewable @State var todoItem = [
        Todo(id: UUID(), item: "chill", isDone: true)
    ]
    @Previewable @State var chosenColor = Color.blue
    TodoRowView(todos: $todoItem, selectedColor: $chosenColor)
}
