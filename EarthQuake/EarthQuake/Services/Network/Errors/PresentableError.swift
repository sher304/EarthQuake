//
//  ParsableError.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 9/2/24.
//

import Foundation

protocol PresentableError where Self: Error {
    var userMessage: String { get }
    var isNetworkError: Bool { get }
}

extension APIError {
    var isNetworkError: Bool {
        switch self {
        case .noNetwork:
            return true
        default:
            return false
        }
    }
}
