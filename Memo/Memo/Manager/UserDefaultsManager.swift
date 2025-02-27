//
//  UserDefaultsManager.swift
//  Memo
//
//  Created by Eunsung on 2/27/25.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private init() {}
    
    func saveCodable<T: Codable>(_ object: T, forKey key: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(object) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }

    func loadCodable<T: Codable>(forKey key: String, type: T.Type) -> T? {
        if let savedData = UserDefaults.standard.data(forKey: key) {
            let decoder = JSONDecoder()
            return try? decoder.decode(type, from: savedData)
        }
        return nil
    }
}
