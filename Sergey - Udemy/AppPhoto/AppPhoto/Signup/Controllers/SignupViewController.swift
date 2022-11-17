//
//  SignupViewController.swift
//  AppPhoto
//
//  Created by Wallace Santos on 31/10/22.
//

import UIKit

class SignupViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var reapeatPassTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var signupButton:UIButton!
    
    var signupPresenter:SignupPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if signupPresenter == nil {
            let signupModelValidator = SignupFormModelValidator()
            let webservice = SignupWebService(urlString: SignupConstants.url)
            signupPresenter = SignupPresenter(formModelValidator: signupModelValidator, webservice: webservice, delegate: self)
        }
    }

    @IBAction func signupButtonPressed(_ sender: UIButton) {
        signupPresenter?.processUserSignup(formModel: SignupFormModel(firstName: firstNameTextField.text ?? ""
                                                                     ,lastName: lastNameTextField.text ?? "",
                                                                     email: emailTextField.text ?? "",
                                                                     password: passwordTextField.text ?? "",
                                                                     repeatPassword: reapeatPassTextField.text ?? ""))
    }
    

}

extension SignupViewController:SignupViewDelegateProtocol {
    func sucessfullSignup() {
        //todo
    }
    
    func errorHandler(error: SignupError) {
        //todo
    }
    
    
    
}

