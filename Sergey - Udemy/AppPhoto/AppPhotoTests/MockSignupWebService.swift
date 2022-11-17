//
//  MockSignupWebService.swift
//  AppPhotoTests
//
//  Created by Wallace Santos on 27/10/22.
//

import Foundation
@testable import AppPhoto

class MockSignupWebService:SignupWebServiceProtocol{
    
    var isSignupMethodCalled:Bool = false
    var shouldReturnError:Bool = false
    
    
    func signup(withForm formModel: AppPhoto.SignupFormRequestModel, completion: @escaping (Result<AppPhoto.SignupResponseModel?, AppPhoto.SignupError>) -> ()) {
        isSignupMethodCalled = true
        if shouldReturnError{
            completion(.failure(.failedRequest(description: "Signup request was not sucefull")))
        } else {
            let responseModel = SignupResponseModel(status: "ok")
            completion(.success(responseModel))
            
        }
    }
}
