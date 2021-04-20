//
//  RAG_iOSApp.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 19/04/2021.
//

import SwiftUI
import AppCenter
import AppCenterCrashes

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
        registerForAppCenter()
    }
    
    func registerHandlers() {
        Mediater.shared.registerHandler(handler: StartRunningCommandHandler())
    }
    
    func registerForAppCenter() {
        AppCenter.start(withAppSecret: "ebb07586-528a-48ca-b65c-62ea3b562995", services: [Crashes.self])
    }
}
