//
//  SignupWebServiceTests.swift
//  AppPhotoTests
//
//  Created by Wallace Santos on 22/10/22.
//

import XCTest
@testable import AppPhoto

class SignupWebServiceTests: XCTestCase {
    
    var sut:SignupWebService!
    var signFormRequestModel:SignupFormRequestModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        
        sut = SignupWebService(urlString: SignupConstants.url, urlSession: urlSession)
        signFormRequestModel = SignupFormRequestModel(firstName: "Sergey", lastName: "Kargopolov", email: "test@test.com", password: "12345678")
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        signFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
        
    }
    
    func testSignupWebService_WhenSuccessResponse_ReturnsSuccess(){
        //Arrange
        let expectedString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = expectedString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup web service response expectation")
        //Act
        sut.signup(withForm: signFormRequestModel) { (result) in
            switch result {
            case .success(let result):
                XCTAssertEqual(result?.status, "ok")
                expectation.fulfill()
            case .failure(let error):
                print(error)
            }
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_ReceivedDifferentJSON_ErrorTookPlace(){
        
        let expectedString = "(\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        
        MockURLProtocol.stubResponseData = expectedString.data(using: .utf8)
        
        
        let expectation = self.expectation(description: "Signup method expectation for a response that contains a different JSON Structure")
        //Act
        sut.signup(withForm: signFormRequestModel) { (result) in
            switch result {
            case .success(let result):
                XCTAssertNil(result)
                expectation.fulfill()
            case .failure(let error):
                XCTAssertEqual(error, .responseModelParsingError)
                expectation.fulfill()
            }
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenEmptyURLProvided_ReturnError(){
        sut = SignupWebService(urlString: "")
        
        sut.signup(withForm: signFormRequestModel) { result in
            switch result {
            case .success(let response):
                XCTAssertNil(response?.status)
            case .failure(let error):
                XCTAssertEqual(error, .invalidURLStringError, "Signup method do not return expected error for invaldi URL")
            }
        }
    }
    
    func testSignupWebService_WhenURLRequestFails_ReturnsErrorMessageDescription(){
        let expectation = self.expectation(description: "A failed request expectation")
        let errorDescription = "A localized description of an error"
        MockURLProtocol.stubError = SignupError.failedRequest(description: errorDescription)
        sut.signup(withForm: signFormRequestModel) { result in
            switch result {
            case .success(let result):
                XCTAssertNil(result)
                
            case .failure(let error):
                XCTAssertEqual(error, .failedRequest(description: errorDescription), "The signup method did not return an expected error")
                expectation.fulfill()
            }
        }
        self.wait(for: [expectation], timeout: 2)
    }
}
