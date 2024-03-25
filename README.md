# Swift-UI-iOS17-Swift-Data-Danny-version
Swift UI iOS17 SwiftData Danny version with comments
## Grab the code - ContentView file
```swift
//
//  ContentView.swift
//  Data Practice
//
//  Created by Eusebio Taba on 3/24/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext//"bridge to SwiftData"
//    PRIVATE means this will only works in this particular view
    @Query private var todoplural: [Todo_Class]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(todoplural) { iterateArrayOfTodos in
                    NavigationLink {
                        Text("How are you?")
                    } label: {
//                        Text(todo)
                        Text(iterateArrayOfTodos.titulito)
                    }
                }
                .onDelete(perform: deleteItems)
            }//end List
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus") //PLUS SIGN - read loud for blind people
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
//            let newItem = Item(timestamp: Date())//create a new object, instantiate class Todo
            let newToBeShownInDisplay = Todo_Class(titulito: "Hello Mommy")
//            modelContext.insert(newItem)// saving into SwiftData
            modelContext.insert(newToBeShownInDisplay)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(todoplural[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Todo_Class.self, inMemory: true)
}

```
## Grab the code - Practice file
```swift
```
## Grab the code - Item file
```swift
```
