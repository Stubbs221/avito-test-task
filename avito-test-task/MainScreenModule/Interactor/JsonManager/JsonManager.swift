//
//  JsonManager.swift
//  avito-test-task
//
//  Created by Vasily Maslov on 30.10.2022.
//

import Foundation

class JsonManager {
    static let shared = JsonManager()
    
    func writeJSON(with data: Data) {
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let pathWithFileName = documentDirectory.appending(path: "companyData.json")
            do {
                print(pathWithFileName)
                try data.write(to: pathWithFileName)
            } catch {
                print("error")
            }
        }
    }
    
    func readJSON() -> FetchedData?  {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        
        guard let url = path?.appending(path: "companyData.json"),
              let data = NSData(contentsOf: url),
              let jsonData = try? JSONDecoder().decode(FetchedData.self, from: data as Data) else {
            print("json error")
            return nil
        }
        return jsonData
    }
    
    func deleteJSON() {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        guard let url = path?.appending(path: "companyData.json") else { return }
        
        do {
            try FileManager.default.removeItem(at: url)
            print("json has been deleted")
        } catch {
            print("unable to delete json file")
        }
    }
}
