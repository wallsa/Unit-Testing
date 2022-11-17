//
//  MockSignupModelValidator.swift
//  AppPhotoTests
//
//  Created by Wallace Santos on 27/10/22.
//

import Foundation
@testable import AppPhoto

class MockSignupModelValidator: SignupModelValidatorProtocol{
    var isFirstNameValidated:Bool = false
    var isLastNameValidated:Bool = false
    var isFirstNameLenghtValidated:Bool = false
    var isEmailValidated:Bool = false
    var isPasswordValidated:Bool = false
    var passwordsMatch:Bool = false
    
    internal func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    func firstNameLengthValidator(firstName: String) -> Bool {
        isFirstNameLenghtValidated = true
        return isFirstNameLenghtValidated
    }
    
    func emailValidation(email: String) -> Bool {
        isEmailValidated = true
        return isEmailValidated
    }
    
    func isPasswordValid(password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }
    
    func checkPasswords(_ passOne: String, _ passTwo: String) -> Bool {
        passwordsMatch = true
        return passwordsMatch
    }
    
}
