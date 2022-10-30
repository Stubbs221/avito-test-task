//
//  NetworkService.swift
//  avito-test-task
//
//  Created by Vasily Maslov on 29.10.2022.
//

import UIKit

class NetworkService {
    
    static let shared = NetworkService()
    
    static let url = URL(string: "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c")
    
    func downloadJSON(completion: @escaping (LoadingState) -> Void) {
        guard let url = NetworkService.url else {
            completion(LoadingState.failure(NetworkError.invalidURL))
            return
        }
        
        if let jsonData = JsonManager.shared.readJSON() {
            DispatchQueue.main.async {
                completion(LoadingState.loaded(jsonData.company))

            }
        } else {
            
//      MARK: - Базовая имплементация CachePolicy не включает настройку expiration date, нужную по тз, поэтому реализовано кастомное кеширование
            let request = URLRequest(url: url, timeoutInterval: 10)
            
            let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, let response = response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    completion(LoadingState.failure(NetworkError.connectionFailed))
                    return
                }
                guard let fetchedData = try? JSONDecoder().decode(FetchedData.self, from: data) else {
                    completion(LoadingState.failure(NetworkError.unableToDecodeData))
                    return
                }
                
                JsonManager.shared.writeJSON(with: data)
                
                DispatchQueue.main.async {
                    completion(LoadingState.loaded(fetchedData.company))
                }
            }
            dataTask.resume()
        }
    }
}

