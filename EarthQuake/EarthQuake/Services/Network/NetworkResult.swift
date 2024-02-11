//
//  NetworkResult.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 9/2/24.
//

import Foundation


typealias EmptyCompletion = (NetworkResult<EmptyResponce>) -> Void

public enum NetworkResult<Model> {
    
    case success(Model)
    case failure(APIError)
    
    public var isSuccess: Bool {
        switch self {
        case .success(let model):
            return true
        case .failure(let aPIError):
            return false
        }
    }
    
    public var isFailure: Bool {
        return !isSuccess
    }
    
    public var value: Model? {
        switch self {
        case .success(let model):
            return model
        case .failure(let aPIError):
            return nil
        }
    }
    
    public var error: APIError? {
        switch self {
        case .success(let model):
            return nil
        case .failure(let error):
            return error
        }
    }
}


// MARK: Equatable
extension NetworkResult: Equatable where Model: Equatable {
    public static func == (lhs: NetworkResult, rhs: NetworkResult) -> Bool {
        switch (lhs, rhs) {
        case (.success(let lhs), .success(let rhs)):
            return lhs == rhs
        case (.failure(let lhs), .failure(let rhs)):
            return lhs == rhs
        default:
            return false
        }
    }
}
