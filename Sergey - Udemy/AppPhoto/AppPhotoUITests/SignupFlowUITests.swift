//
//  AppPhotoUITests.swift
//  AppPhotoUITests
//
//  Created by Wallace Santos on 20/10/22.
//

import XCTest

class SignupFlowUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignupViewController_WhenViewisLoaded_RequiredUIElementEnable() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let firstName = app.textFields["First Name"]
        let lastName = app.textFields["Last Name"]
        let password = app.secureTextFields["Password"]
        let repeatPass = app.secureTextFields["Repeat Password"]
        let email = app.textFields["Email"]
        let signupButton = app.buttons["Signup"]
        
        XCTAssertTrue(firstName.isEnabled , "The firstName textfield is not enable for user")
        XCTAssertTrue(lastName.isEnabled , "The LastName textfield is not enable for user")
        XCTAssertTrue(password.isEnabled , "The Password textfield is not enable for user")
        XCTAssertTrue(repeatPass.isEnabled , "The Repeat pass textfield is not enable for user")
        XCTAssertTrue(email.isEnabled , "The email textfield is not enable for user")
        XCTAssertTrue(signupButton.isEnabled , "The signup button is not enable for user")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
