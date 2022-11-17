//
//  SignupModelValidatorProtocol.swift
//  AppPhoto
//
//  Created by Wallace Santos on 27/10/22.
//

import Foundation


protocol SignupModelValidatorProtocol {
    
    func isFirstNameValid(firstName:String) -> Bool
    func isLastNameValid(lastName:String) -> Bool
    func firstNameLengthValidator(firstName:String) -> Bool
      
    
    func emailValidation(email:String) -> Bool
    func isPasswordValid(password:String) -> Bool
        
    
    func checkPasswords(_ passOne:String, _ passTwo:String) -> Bool
       
}
