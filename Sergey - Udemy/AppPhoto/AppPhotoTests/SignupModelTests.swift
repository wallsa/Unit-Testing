//
//  AppPhotoTests.swift
//  AppPhotoTests
//
//  Created by Wallace Santos on 20/10/22.
//

import XCTest
@testable import AppPhoto

class SignupModelTests: XCTestCase {
    
    var sut:SignupFormModelValidator!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = SignupFormModelValidator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testSignupForModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue(){
        //Arrange
        let testName = "John"
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: testName)
        //Assert
        XCTAssertTrue(isFirstNameValid, "The provided name is not valid - Expected True")
    }
    
    func testSigupFormModelValidator_WhenTooShortName_ShouldReturnFalse(){
        //Arrange
        let testName = "Si"
        //Act
        let isNameTooShort = sut.firstNameLengthValidator(firstName: testName)
        //Assert
        XCTAssertFalse(isNameTooShort, "The provide name is too short, less than 2 characters - Expected False")
    }
    
    func testSignupFormModelValidator_WhenTooLongName_ShouldReturnFalse(){
        //Arrange
        let testName = "Wallace"
        //Act
        let isNameTooLong = sut.firstNameLengthValidator(firstName: testName)
        //Assert
        XCTAssertFalse(isNameTooLong, "The provide name is too long, more than 10 characters - Expected False")
    }
    
    func testSignupModelValidator_ValidEmail_ShouldReturnTrue(){
        //Arrange
        let testEmail = "Wallace@gmail.co"
        //Act
        let isEmailValid = sut.emailValidation(email:testEmail)
        //Assert
        XCTAssertTrue(isEmailValid, "The provide email is not valid - Expected True")
        
    }
    
    func testSignupModelValidator_PasswordMatch_ShouldReturnTrue(){
        //Arrange
        let passOne = "testingpass"
        let passTwo = "testingpass"
        //Act
        let isPassMatching = sut.checkPasswords(passOne, passTwo)
        //Assert
        XCTAssertTrue(isPassMatching, "The provider passwords is not matching - Expected True")
    }
    
    func testSignupModelValidator_PasswordNotMatch_ShouldReturnFalse(){
        //Arrange
        let passOne = "testingpass"
        let passTwo = "testingpasz"
        //Act
        let isPassMatching = sut.checkPasswords(passOne, passTwo)
        //Assert
        XCTAssertFalse(isPassMatching, "The provider passwords is matching - Expected False")
        
        
    }

}
