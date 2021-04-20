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
        AppCenter.start(withAppSecret: "c5a5af62-d182-48a4-9096-a7423d96da28", services: [Crashes.self])
    }
}
