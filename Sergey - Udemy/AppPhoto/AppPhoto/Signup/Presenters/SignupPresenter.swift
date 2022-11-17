//
//  SignupPresenter.swift
//  AppPhoto
//
//  Created by Wallace Santos on 27/10/22.
//

import Foundation

class SignupPresenter:SignupPresenterProtocol{
    
    private var formModelValidator:SignupModelValidatorProtocol
    private var webservice:SignupWebServiceProtocol
    private weak var delegate:SignupViewDelegateProtocol?
    
    required init(formModelValidator:SignupModelValidatorProtocol, webservice:SignupWebServiceProtocol, delegate:SignupViewDelegateProtocol) {
        self.formModelValidator = formModelValidator
        self.webservice = webservice
        self.delegate = delegate
    }
    
    
    func processUserSignup(formModel: SignupFormModel){
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName){
            //TODO implementar erro - em caso do boolean acima ser false
            return
        }
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName){
            //TODO - Error
            return
        }
        if !formModelValidator.firstNameLengthValidator(firstName: formModel.firstName){
            //TODO - Error
            return
        }
        if !formModelValidator.isPasswordValid(password: formModel.password){
            //TODO - Error
            return
        }
        if !formModelValidator.emailValidation(email: formModel.email){
            //TODO - Error
            return
        }
        if !formModelValidator.checkPasswords(formModel.password, formModel.repeatPassword){
            //TODO - Error
            return
        }
        let requestModel = SignupFormRequestModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)
        
        webservice.signup(withForm: requestModel) { [weak self] result in
            switch result {
            case .success( _):
                self?.delegate?.sucessfullSignup()
            case .failure(let error):
                self?.delegate?.errorHandler(error: error)
            }
        }
        
    }
}
