//
//  MockSignupViewDelegate.swift
//  AppPhotoTests
//
//  Created by Wallace Santos on 27/10/22.
//

import Foundation
import XCTest
@testable import AppPhoto

class MockSignupViewDelegate:SignupViewDelegateProtocol{
    var expectation:XCTestExpectation?
    var sucessfullSignupCounter = 0
    var errorHandlerCounter = 0
    var signupError:SignupError?
    
    func sucessfullSignup() {
        sucessfullSignupCounter += 1
        expectation?.fulfill()
        
    }
    
    func errorHandler(error: AppPhoto.SignupError) {
        signupError = error
        errorHandlerCounter += 1
        expectation?.fulfill()
    }
    
    
    
}
