//
//  ParsableError.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 9/2/24.
//

import Foundation

public struct ParsableError: Decodable, PresentableError {
    // MARK: - Properties
    private let message: String
    let type: String
    let errors: [DetailError]?

    // MARK: - Nested struct
    struct DetailError: Decodable {
        let name: String
        let message: String
    }

    // MARK: - PresentableError
    var userMessage: String {
        return message
    }

    var isNetworkError: Bool {
        return false
    }
}
