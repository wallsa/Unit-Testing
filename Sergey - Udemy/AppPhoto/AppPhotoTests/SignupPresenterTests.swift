//
//  SignupPresenterTests.swift
//  AppPhotoTests
//
//  Created by Wallace Santos on 27/10/22.
//

import XCTest
@testable import AppPhoto

final class SignupPresenterTests: XCTestCase {
    
    var signupFormModel:SignupFormModel!
    var mockSignupModelValidator:MockSignupModelValidator!
    var mockSignupWebService:MockSignupWebService!
    var sut:SignupPresenter!
    var mockSignupViewDelegate:MockSignupViewDelegate!

    override func setUp(){
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        //Arrange
        signupFormModel = SignupFormModel(firstName: "Sergey", lastName: "Kargopolov", email: "test@test.com", password: "12345678", repeatPassword: "12345678")
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()
        //Act
        sut = SignupPresenter(formModelValidator: mockSignupModelValidator, webservice: mockSignupWebService, delegate:mockSignupViewDelegate)
    }
    override func tearDown() {
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        mockSignupViewDelegate = nil
        sut = nil
    }

    func testSignupPresenter_WhenInformationProviderPresenterValidateEachProperty(){

        //Act
        sut.processUserSignup(formModel: signupFormModel)
        
        //Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "The first name is not validated")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "The last name is not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "The password is not validated")
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated, "The email is not validated")
        XCTAssertTrue(mockSignupModelValidator.isFirstNameLenghtValidated)
        XCTAssertTrue(mockSignupModelValidator.passwordsMatch, "The passwords is not matching")
    }
    
    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallsSignupMethod(){
        //Act
        sut.processUserSignup(formModel: signupFormModel)
        //Assert
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled , "The signup method was not called")
    }
    
    func testSignupPresenter_WhenSignupOperationSucessfull_CallsSucessOnViewDelegate(){
        //Arrange
        let myExpectation = expectation(description: "Expected the sucessfullSignup() method to be called")
        
        mockSignupViewDelegate.expectation = myExpectation
        
        //Act
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        
        //Assert
        XCTAssertEqual(mockSignupViewDelegate.sucessfullSignupCounter, 1, "The sucessfullSignup method is called more than one time")
    }
    func testSignupPresenter_WhenSignupOperationFails_CallErrorHandlerOnViewDelegate(){
        let errorExpectation = expectation(description: "Expected errorHandler() method to be called")
        mockSignupViewDelegate.expectation = errorExpectation
        mockSignupWebService.shouldReturnError = true
        
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [errorExpectation], timeout: 5)
        //Assert
        XCTAssertEqual(mockSignupViewDelegate.sucessfullSignupCounter, 0)
        XCTAssertEqual(mockSignupViewDelegate.errorHandlerCounter, 1, "The errorHandler() method is called more than one time")
        XCTAssertNotNil(mockSignupViewDelegate.signupError)
        
    }

}
