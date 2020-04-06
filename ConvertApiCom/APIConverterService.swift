//
//  APIConverterService.swift
//  PDFPlayground
//
//  Created by Alex on 1/18/20.
//  Copyright © 2020 Alexei Jovmir. All rights reserved.
//

import Foundation

fileprivate let kBaseUrlFormat = "https://v2.convertapi.com/convert/%@"
fileprivate let kSecretParameterFormat = "/to/pdf?Secret=%@"

public protocol APIConverterService {
    typealias Handler = (Result<Converted, ConvertError>) -> Void
    func convertFileToPDF(type: SupportedType, fileData: Data, handler: @escaping Handler)
}

public final class APIConverterServiceImp: APIConverterService {
    var configModel: ConfigModel?
    
    public init() {
        configModel = ConfigImp()
    }
    
    public func convertFileToPDF(type: SupportedType, fileData: Data, handler: @escaping Handler) {
        guard let token = configModel?.getToken() else  {
            handler(.failure(.noToken))
            return
        }
        
        let myBase64Data = fileData.base64EncodedData(options: NSData.Base64EncodingOptions.endLineWithLineFeed)
        guard let string = String(data: myBase64Data, encoding: .utf8) else {
            handler(.failure(.error))
            return
        }
        
        let parameters: [String: [Any]] = ["Parameters": [[
            "Name":"File", "FileValue": [
                "Name":"myFile.\(type.rawValue)","Data":string]]]]
        
        let base = String(format: kBaseUrlFormat, type.rawValue)
        let secret = String(format: kSecretParameterFormat, token)
        
        var request = URLRequest(url: URL(string: "\(base)\(secret)")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            if error != nil {
                handler(.failure(.error))
            }
            
            guard let responseData = data else {
                handler(.failure(.noResponse))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(Converted.self, from: responseData)
                handler(.success(response))
            } catch {
                handler(.failure(.mappingFailure))
            }
        }).resume()
    }
}
