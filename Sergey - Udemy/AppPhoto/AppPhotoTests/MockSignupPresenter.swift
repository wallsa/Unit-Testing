//
//  MockSignupPresenter.swift
//  AppPhotoTests
//
//  Created by Wallace Santos on 31/10/22.
//

import Foundation
@testable import AppPhoto

class MockSignupPresenter : SignupPresenterProtocol{
    var processUserSignupCalled:Bool = false
    
    required init(formModelValidator: AppPhoto.SignupModelValidatorProtocol, webservice: AppPhoto.SignupWebServiceProtocol, delegate: AppPhoto.SignupViewDelegateProtocol) {
        //TODO
    }
    
    func processUserSignup(formModel: AppPhoto.SignupFormModel) {
        processUserSignupCalled = true
    }
    
    

    
}
