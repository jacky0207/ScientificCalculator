//
//  ModelData.swift
//  NASA Data
//
//  Created by Jacky Lam on 2023-08-09.
//

import Combine
import Foundation

final class ModelData: ObservableObject {
    
}

// For example:
// var apiSuccessModel: APISuccessModel = load("apiSuccessModel.json")
fileprivate func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
