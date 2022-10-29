//
//  CustomError.swift
//  avito-test-task
//
//  Created by Vasily Maslov on 29.10.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case connectionFailed
    case unableToDecodeData
}
