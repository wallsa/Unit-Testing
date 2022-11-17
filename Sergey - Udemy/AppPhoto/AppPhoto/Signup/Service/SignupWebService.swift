//
//  SignupWebService.swift
//  AppPhoto
//
//  Created by Wallace Santos on 22/10/22.
//

import Foundation


class SignupWebService:SignupWebServiceProtocol{
    
    //Construction dependency ingection
    private var urlSession:URLSession
    private var urlString:String
    
    init(urlString:String, urlSession:URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signup(withForm formModel: SignupFormRequestModel, completion : @escaping (Result<SignupResponseModel?, SignupError>) -> ()){
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURLStringError))
            return
            
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        urlSession.dataTask(with: request) { data, response, error in
            if let requestError = error {
                completion(.failure(.failedRequest(description: requestError.localizedDescription)))
                return
            }
        
            if let data = data, let signupResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data){
                print("sucess")
                completion(.success(signupResponseModel))
            } else {
                completion(.failure(.responseModelParsingError))
                print("failure")
            }
          
        }
        .resume()
    }
    
}
