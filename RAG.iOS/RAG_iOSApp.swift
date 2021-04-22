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
        registerEvents()
    }
    
    func registerHandlers() {
        // RunningHandlers
        Mediater.shared.registerHandler(handler: StartRunningCommandHandler())
        
        // EventHandlers
        Mediater.shared.registerHandler(handler: JoinEventCommandHandler())
        
        // UserHandlers
        Mediater.shared.registerHandler(handler: RegisterUserCommandHandler())
    }
    
    func registerForAppCenter() {
        AppCenter.start(withAppSecret: "c5a5af62-d182-48a4-9096-a7423d96da28", services: [Crashes.self])
    }
    
    func registerEvents() {
        let store: RunningStore = RunningStore()
        
        if let _ = store.getBy(objectType: DataEvent.self, primaryKey: 1) {
            print("Result found, not creating a new one")
        } else {
            let event: DataEvent = DataEvent(value: ["id": 1, "name": "qyeet", "startDate": Date(), "endDate": Date(), "eventDescription": "Blabla"])
            store.create(object: event)
        }
    }
}
