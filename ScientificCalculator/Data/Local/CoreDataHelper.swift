//
//  CoreDataHelper.swift
//  CalNotes
//
//  Created by Jacky Lam on 2023-09-04.
//

import CoreData

protocol CoreDataHelperProtocol {
    mutating func deleteAll() throws
    // custom functions here
}

class CoreDataHelper: CoreDataHelperProtocol {
    static let containerName = BuildConfig.shared.appName
    static let shared = CoreDataHelper()
    var container: NSPersistentContainer = NSPersistentContainer(name: containerName)

    private init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
    }

    func deleteAll() throws {
        // Get a reference to a NSPersistentStoreCoordinator
        let storeContainer = container.persistentStoreCoordinator

        // Delete each existing persistent store
        for store in storeContainer.persistentStores {
            try storeContainer.destroyPersistentStore(
                at: store.url!,
                ofType: store.type,
                options: nil
            )
        }

        // Re-create the persistent container
        container = NSPersistentContainer(name: CoreDataHelper.containerName)

        // Calling loadPersistentStores will re-create the persistent stores
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
