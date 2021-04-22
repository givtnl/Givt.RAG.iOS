//
//  RunningStore.swift
//  RAG.iOS
//
//  Created by Mike Pattyn on 22/04/2021.
//

import Foundation
import RealmSwift

class RunningStore {
    static let shared = RunningStore()
    
    private let realm = RealmService.shared.getRealm(withName: "Running")
    
    func create(object: Object) {
        try! realm.write {
            realm.add(object)
        }
    }
    
    func getBy(objectType: Object.Type, primaryKey: Int) -> Object? {
        return realm.object(ofType: objectType, forPrimaryKey: primaryKey)
    }
    
    func getList(objectType: Object.Type) -> Results<Object> {
        return realm.objects(objectType)
    }
}

class DataEvent: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var startDate: Date = Date()
    @objc dynamic var endDate: Date = Date()
    @objc dynamic var eventDescription: String = ""
    @objc dynamic var city: String = ""
    @objc dynamic var address: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class DataEventGoal: Object {
    @objc dynamic var amount: Double = 0.0
    @objc dynamic var distance: Int = 0
    
    @objc dynamic var event: DataEvent?
}

class DataEventRun: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var distance: String = ""
    @objc dynamic var time: String = ""
    @objc dynamic var start: Date = Date()
    @objc dynamic var end: Date = Date()
    
    @objc dynamic var event: DataEvent?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class DataRunPoint: Object {
    @objc dynamic var latitude: Double = 0.0
    @objc dynamic var longitude: Double = 0.0
    @objc dynamic var elevation: Double = 0.0
    @objc dynamic var timeStamp: Date = Date()
    
    @objc dynamic var run: DataEventRun?
}
