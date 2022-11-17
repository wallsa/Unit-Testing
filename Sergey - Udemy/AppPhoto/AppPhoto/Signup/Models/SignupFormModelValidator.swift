//
//  SignupFormModelValidator.swift
//  AppPhoto
//
//  Created by Wallace Santos on 20/10/22.
//

import Foundation


class SignupFormModelValidator: SignupModelValidatorProtocol{
    func isLastNameValid(lastName: String) -> Bool {
        var isValid = true
        
        if lastName.isEmpty {
            isValid = false
        }
        return isValid
    }
    
    
    func isFirstNameValid(firstName:String) -> Bool{
        var isValid = true
        
        if firstName.isEmpty {
            isValid = false
        }
        return isValid
    }
    
    func firstNameLengthValidator(firstName:String) -> Bool{
        var lenghtLimit = false
        
        if firstName.count < SignupConstants.minLenght || firstName.count > SignupConstants.maxLenght{
            lenghtLimit = true
        }
        return lenghtLimit
    }
    
    func emailValidation(email:String) -> Bool{
        var isValid = false
        if NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email){
            isValid = true
        }
        return isValid
    }
    
    func isPasswordValid(password:String) -> Bool{
        var returnValue = true
        if password.count < SignupConstants.passwordMinLenght || password.count > SignupConstants.passwordMaxLenght{
            returnValue = false
        }
        return returnValue
    }
    
    func checkPasswords(_ passOne:String, _ passTwo:String) -> Bool{
        return passOne == passTwo
    }
}
