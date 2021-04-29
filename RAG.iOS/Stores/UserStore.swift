//
//  UserStore.swift
//  RAG.iOS
//
//  Created by Bjorn Derudder on 22/04/2021.
//

import Foundation
import RealmSwift

class UserStore {
    static let shared = UserStore()
    private let realm = RealmService.shared.getRealm(withName: "User")
    
    func getUser(objectType: Object.Type) -> Object? {
        return realm.objects(objectType).first
    }
    
    func create(object: Object) {
        try! realm.write {
            realm.add(object)
        }
    }
}

class DataUser: Object {
    @objc dynamic var email: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var id: String = ""
    @objc dynamic var eventId: String = ""
    @objc dynamic var averageRunKm: Double = 0.0
}
