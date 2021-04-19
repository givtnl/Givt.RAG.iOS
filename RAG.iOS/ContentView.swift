//
//  ContentView.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 19/04/2021.
//

import SwiftUI
import CoreData
import OpenAPIClient

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topLeading) {
                Image("Runner").resizable().scaledToFit().ignoresSafeArea(edges: .top)
                Image("OM_Logo").resizable().scaledToFit().frame(width: 80, height: 80, alignment: .topLeading).offset(x: 20, y: 50)
            }
            VStack(alignment: .leading) {
                Text("SPONSORLOOP")
                    .font(.title)
                    .fontWeight(.bold)
                Group {
                    InfoViewRow(logoString: "OM_Logo", titleString: "Zaterdag 6 Juni, 2021", subTitleString: "9.00u - 12.00u")
                    InfoViewRow(logoString: "OM_Logo", titleString: "Kortrijk", subTitleString: "Kerkstraat 136")
                }
                VStack(alignment: .leading) {
                    Text("Over het evenement")
                        .font(.title2)
                        .fontWeight(.none)
                    Text("Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo")
                        .font(.caption)
                        .fontWeight(.light)
                        .padding(.top, 1)
                    Text("Lees meer")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .padding(.top, 1)
                }.offset(y: 15)
                
                
            }.frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            ).padding(30).background(Color.white).cornerRadius(36, corners: .topRight).ignoresSafeArea(edges: .all).offset(y: -40)
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        ).ignoresSafeArea(edges: .all)
        .onAppear(perform: {
            viewAppeared()
        })

//        VStack(alignment: .leading) {
//            Text("OM")
//            Text("SPONSORLOOP").offset(y:5)
//        }.frame(
//            minWidth: 0,
//            maxWidth: .infinity,
//            minHeight: 0,
//            maxHeight: .infinity,
//            alignment: .topLeading
//        )
//        .background(Color.red)
        //        List {
        //            ForEach(items) { item in
        //                Text("Ah yeet \(item.timestamp!, formatter: itemFormatter)")
        //            }
        //            .onDelete(perform: deleteItems)
        //        }
        //        .toolbar {
        //            #if os(iOS)
        //            EditButton()
        //            #endif
        //
        //            Button(action: addItem) {
        //                Label("Add Item", systemImage: "plus")
        //            }
        //        }
    }
    
    private func viewAppeared() {
        let item = OpenAPIClientAPI()
        item.
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
