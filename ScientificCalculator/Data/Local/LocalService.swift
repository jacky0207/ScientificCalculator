//
//  LocalService.swift
//  CalNotes
//
//  Created by Jacky Lam on 2023-08-27.
//

import Combine
import CoreData

protocol LocalService {
    mutating func deleteAll() -> AnyPublisher<Void, DataError<APIError>>
    // custom functions here
}
