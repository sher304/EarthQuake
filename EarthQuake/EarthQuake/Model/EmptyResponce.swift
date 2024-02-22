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
    let bbox: [Double]?
}

// MARK: - Feature
struct Feature: Codable {
    let type: FeatureType
    let properties: Properties
    let geometry: Geometry
    let id: String
}

// MARK: - Geometry
struct Geometry: Codable {
    let type: GeometryType
    let coordinates: [Double]
}

enum GeometryType: String, Codable {
    case point = "Point"
}

// MARK: - Properties
struct Properties: Codable {
    let mag: Double
    let place: String
    let time, updated: Int
    let tz: JSONNull?
    let url, detail: String
    let felt: Int?
    let cdi, mmi: Double?
    let alert: String?
    let status: Status
    let tsunami, sig: Int
    let net: Net
    let code, ids, sources, types: String
    let nst: Int?
    let dmin, rms: Double?
    let gap: Int?
    let magType: MagType
    let type: PropertiesType
    let title: String
}

enum MagType: String, Codable {
    case mb = "mb"
    case ml = "ml"
    case mww = "mww"
}

enum Net: String, Codable {
    case hv = "hv"
    case ok = "ok"
    case us = "us"
}

enum Status: String, Codable {
    case reviewed = "reviewed"
}

enum PropertiesType: String, Codable {
    case earthquake = "earthquake"
}

enum FeatureType: String, Codable {
    case feature = "Feature"
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
