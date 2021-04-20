//
//  RAG_iOSApp.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 19/04/2021.
//

import SwiftUI

@main
struct RAG_iOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            EventView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
    
    init() {
        registerHandlers()
    }
    
    func registerHandlers() {
        Mediater.shared.registerHandler(handler: StartRunningCommandHandler())
    }
}
