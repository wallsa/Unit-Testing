//
//  SignupErrors.swift
//  AppPhoto
//
//  Created by Wallace Santos on 22/10/22.
//

import Foundation

enum SignupError:LocalizedError, Equatable {
    case responseModelParsingError
    case invalidURLStringError
    case failedRequest(description:String)
    
    
    var errorDescription: String? {
        switch self {
        case .responseModelParsingError:
            return ""
        case .invalidURLStringError:
            return ""
        case .failedRequest(let description):
            return description
        }
    }
}
