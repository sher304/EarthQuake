//
//  Accident.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 7/2/24.
//

import Foundation


// MARK: - EmptyResponce
struct EmptyResponce: Codable {
    let type: String
    let metadata: Metadata
    let features: [Feature]
}

// MARK: - Feature
struct Feature: Codable {
    let properties: Properties
    let geometry: Geometry
    let id: String
}

// MARK: - Geometry
struct Geometry: Codable {
    let coordinates: [Double]
}

// MARK: - Properties
struct Properties: Codable {
    let mag: Double
    let place: String
    let time, updated: Int
    let url, detail: String
    let magType: String
    let title: String
}


// MARK: - Metadata
struct Metadata: Codable {
    let generated: Int
    let url: String
    let title: String
    let status: Int
    let api: String
    let count: Int
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
