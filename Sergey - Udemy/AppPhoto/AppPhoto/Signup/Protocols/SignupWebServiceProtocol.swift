//
//  SignupWebServiceProtocol.swift
//  AppPhoto
//
//  Created by Wallace Santos on 27/10/22.
//

import Foundation

protocol SignupWebServiceProtocol {
    func signup(withForm formModel: SignupFormRequestModel, completion : @escaping (Result<SignupResponseModel?, SignupError>) -> ())
        
}
