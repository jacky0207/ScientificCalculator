//
//  LocalSession.swift
//  CalNotes
//
//  Created by Jacky Lam on 2023-08-27.
//

import Combine
import CoreData

struct LocalSession: LocalService {
    static let shared = LocalSession()
    private var coreDataHelper = CoreDataHelper.shared

    mutating func deleteAll() -> AnyPublisher<Void, DataError<APIError>> {
        do {
            try coreDataHelper.deleteAll()
            return Just(())
                .setFailureType(to: DataError<APIError>.self)
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: DataError.local(.unknown))
                .eraseToAnyPublisher()
        }
    }
}
