//
//  SignupViewControllersTests.swift
//  AppPhotoTests
//
//  Created by Wallace Santos on 31/10/22.
//

import XCTest
@testable import AppPhoto

final class SignupViewControllersTests: XCTestCase {
    
    var storyboard:UIStoryboard!
    var sut:SignupViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
        //Act
        sut?.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        storyboard = nil
        sut = nil
    }

    func testSignupViewController_WhenCreated_RequiredTextFieldsEmpty() throws{
        //Arrange
        
        //Assert
        //Testando se os IBOutlets estao conectados
        let firstNameTextField = try XCTUnwrap(sut.firstNameTextField, "The fistNameTextField is not connected to an IBOutlet")
        let lastNameTextField = try XCTUnwrap(sut.lastNameTextField, "The lastNameTextField is not connected to an IBOutlet")
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "The passwordTextField is not connected to an IBOutlet")
        let repeatPassTextField = try XCTUnwrap(sut.reapeatPassTextField, "The repeatPass is not connected to an IBOutlet")
        let emailTextField = try XCTUnwrap(sut.emailTextField, "The emailTextField is not connected to an IBOutlet")
        //Testando que os campos de texto estão vazios ao iniciar o APP
        XCTAssertEqual(firstNameTextField.text, SignupConstants.emptyString, "First name text field is not empty when viewcontroller initially loaded")
        XCTAssertEqual(lastNameTextField.text, SignupConstants.emptyString)
        XCTAssertEqual(passwordTextField.text, SignupConstants.emptyString)
        XCTAssertEqual(repeatPassTextField.text, SignupConstants.emptyString)
        XCTAssertEqual(emailTextField.text, SignupConstants.emptyString)
    }
    
    func testSignupViewController_WhenCreated_HasSnigupButtonAndAction() throws{
        let signupButton = try XCTUnwrap(sut.signupButton, "The signup Button is not referencing outlet")
        
        let signupActions = try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "Signup button has no actions assigned to it")
        XCTAssertEqual(signupActions.count, 1 , "The actions has more than 1 attached")
        XCTAssertEqual(signupActions.first, ("signupButtonPressed:"), "The signup button has no action for touchUp Inside")
    }
    
    func testSignupViewController_WhenSignupButtonTapped_InvokeSignupProcess(){
        //Arrange
        let mockSignupModelValidator = MockSignupModelValidator()
        let mockSignupWebService = MockSignupWebService()
        let mockSignupViewDelegate = MockSignupViewDelegate()
        
        let mockSignupPresenter = MockSignupPresenter(formModelValidator: mockSignupModelValidator, webservice: mockSignupWebService, delegate: mockSignupViewDelegate)
        
        //Act
        sut.signupPresenter = mockSignupPresenter
        sut.signupButton.sendActions(for: .touchUpInside)
        //Assert
        XCTAssertTrue(mockSignupPresenter.processUserSignupCalled, "The method was not called on a Presenter when user tapped a Signup Button")
    }

}
