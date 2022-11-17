//
//  SignupViewDelegateProtocol.swift
//  AppPhoto
//
//  Created by Wallace Santos on 27/10/22.
//

import Foundation

protocol SignupViewDelegateProtocol:AnyObject {
    func sucessfullSignup()
    func errorHandler(error:SignupError)
}
