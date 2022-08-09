//
//  Task.swift
//  JustDo
//
//  Created by Michał Barnat on 08/08/2022.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var done: Bool
}


