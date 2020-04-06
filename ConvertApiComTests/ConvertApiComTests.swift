//
//  ConvertApiComTests.swift
//  ConvertApiComTests
//
//  Created by Alex on 4/5/20.
//  Copyright © 2020 Alexei Jovmir. All rights reserved.
//

import XCTest
@testable import ConvertApiCom

class ConvertApiComTests: XCTestCase {

    var converterAPI: APIConverterService!
    var dataFile: Data!
    
     override func setUp() {
        converterAPI = APIConverterServiceImp()
        let url = Bundle(for: ConvertApiComTests.self).url(forResource: "TextTestFile", withExtension: "txt")!
        if let data = NSData(contentsOfFile: url.path) as Data? {
            dataFile = data
        }
     }

     func testAdd() {
        converterAPI.convertFileToPDF(type: .txt, fileData: dataFile) { (result) in
            switch result {
//            case .success(let _):
//                XCTFail("No error thrown")
//            case .failure(let _):
//                XCTFail("Error thrown")
//            }
        }
     }
}
