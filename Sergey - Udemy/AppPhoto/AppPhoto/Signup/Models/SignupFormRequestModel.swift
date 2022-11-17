//
//  SignupFormRequestModel.swift
//  AppPhoto
//
//  Created by Wallace Santos on 22/10/22.
//

import Foundation

struct SignupFormRequestModel:Encodable{
    let firstName:String
    let lastName:String
    let email:String
    let password:String
    
}
