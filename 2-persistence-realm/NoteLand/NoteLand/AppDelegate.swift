//
//  AppDelegate.swift
//  NoteLand
//
//  Created by Mehmet Tarhan on 6.04.2021.
//

import RealmSwift
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        /// - Initializing a Realm container
        do {
            let realm = try Realm()

            let note = NoteRealmModel()
            note.title = "My first note"
            note.content = "I hope Realm is a better solution than CoreData :D"

            do {
                try realm.write {
                    realm.add(note)
                    print("REALM: Added a note with title: \(note.title)")
                }

            } catch {
                print("REALM: Cannot add a note: \(error.localizedDescription)")
            }

        } catch {
            print("REALM: Cannot create a Realm: \(error.localizedDescription)")
        }

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
