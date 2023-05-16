//
//  LocalData.swift
//  MyNotes
//
//  Created by Kacper Grabiec on 16/05/2023.
//

import Foundation

class Storage {
    static func getData<T: Codable>(forKey key: String) -> [T] {
        var data: [T] = []
        
        if let storedData = UserDefaults.standard.data(forKey: key) {
            do {
                let decoder = JSONDecoder()
                data = try decoder.decode([T].self, from: storedData)
            } catch {
                print("Unable to decode an Array!")
            }
        }
        
        return data
    }
    
    static func saveData<T: Codable>(data: [T], forKey key: String) {
        do {
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(data)
            
            UserDefaults.standard.set(encodedData, forKey: key)
        } catch {
            print("Unable to encode an Array!")
        }
    }
}
