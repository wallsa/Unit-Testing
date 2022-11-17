//
//  SignupPresenterProtocol.swift
//  AppPhoto
//
//  Created by Wallace Santos on 31/10/22.
//

import Foundation

protocol SignupPresenterProtocol:AnyObject {
    init(formModelValidator:SignupModelValidatorProtocol, webservice:SignupWebServiceProtocol, delegate:SignupViewDelegateProtocol)
    func processUserSignup(formModel: SignupFormModel)
}
