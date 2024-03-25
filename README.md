# SwiftUI iOS17 SwiftData Danny version
Swift UI iOS17 SwiftData Danny version with comments<br>
[Index](https://github.com/danielurra/Swift-UI-iOS17-Swift-Data-Danny-version#swiftui-ios17-swiftdata-danny-version)
 * [ContentView file](https://github.com/danielurra/Swift-UI-iOS17-Swift-Data-Danny-version/blob/main/README.md#grab-the-code---contentview-file)
 * [Data_PracticeApp file](https://github.com/danielurra/Swift-UI-iOS17-Swift-Data-Danny-version/blob/main/README.md#grab-the-code---data_practiceapp-file)
 * [Item File](https://github.com/danielurra/Swift-UI-iOS17-Swift-Data-Danny-version/tree/main#grab-the-code---item-file)
<br>
![danny-vesion](https://github.com/danielurra/Swift-UI-iOS17-Swift-Data-Danny-version/assets/51704179/7eadf6ab-96b2-4274-8e14-6c1f0e6a0794)<br>
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
## Grab the code - Data_PracticeApp file
```swift
//
//  Data_PracticeApp.swift
//  Data Practice
//
//  Created by Eusebio Taba on 3/24/24.
//

import SwiftUI
import SwiftData

@main
struct Data_PracticeApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,//here you start adding new classes
            Todo_Class.self,
            
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}

```
## Grab the code - Item file
```swift
//
//  Item.swift
//  Data Practice
//
//  Created by Eusebio Taba on 3/24/24.
//

import Foundation
import SwiftData

@Model// allow you to save data making use of SwiftData 
final class Item {// FINAL = this class can not be changed
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
@Model
final class Todo_Class {
    var titulito: String
    
    init(titulito: String) {
        self.titulito = titulito
    }
}

```
