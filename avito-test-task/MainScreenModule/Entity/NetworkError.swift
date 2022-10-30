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

extension NetworkError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .connectionFailed:
            return "Waiting for Network"
        case .invalidURL:
            return "Invalire URL"
        case .unableToDecodeData:
            return "Wrong data type reveived"
        }
    }
}
