//
//  DataSession.swift
//  TWC
//
//  Created by Jacky on 15/10/2021.
//

import Combine
import CoreData

struct DataSession: DataService {
    static var shared = DataSession()
    var localService: LocalService = LocalSession.shared

    mutating func deleteAll() -> AnyPublisher<Void, DataError<APIError>> {
        return localService.deleteAll()
    }
}
