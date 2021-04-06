//
//  Model.swift
//  NoteLand
//
//  Created by Mehmet Tarhan on 6.04.2021.
//

import Foundation
import RealmSwift

class NoteRealmModel: Object {
    @objc dynamic var title = ""
    @objc dynamic var content = ""
}
