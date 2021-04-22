//
//  RealmService.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 22/04/2021.
//

import Foundation
import RealmSwift

class RealmService {
    static let shared = RealmService()
    
    func getRealm(withName: String) -> Realm  {
        var config = Realm.Configuration.defaultConfiguration
        config.fileURL!.deleteLastPathComponent()
        config.fileURL!.appendPathComponent(withName)
        config.fileURL!.appendPathExtension("realm")
        return try! Realm(configuration: config)
    }
}
