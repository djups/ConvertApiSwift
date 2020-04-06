//
//  ConvertModel.swift
//  CV-DocumentCreator
//
//  Created by Alexei Jovmir on 3/25/20.
//  Copyright © 2020 Alexei Jovmir. All rights reserved.
//

import Foundation

public enum SupportedType: String {
    case docx
    case doc
    case txt
    case html
}

public struct Converted: Codable {
    public let conversionCost: Int
    public let files: [Files]
    
    private enum CodingKeys : String, CodingKey {
        case conversionCost = "ConversionCost", files = "Files"
    }
}

public struct Files: Codable {
    public let fileName: String
    public let fileSize: Int
    public let fileDataString: String
    public let pdfData: Data?
    
    private enum CodingKeys : String, CodingKey {
        case fileName = "FileName", fileSize = "FileSize", fileDataString = "FileData"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        fileName = try container.decode(String.self, forKey: .fileName)
        fileSize = try container.decode(Int.self, forKey: .fileSize)
        fileDataString = try container.decode(String.self, forKey: .fileDataString)
        pdfData = Data(base64Encoded: fileDataString, options: .ignoreUnknownCharacters)
    }
}

public enum ConvertError: Error {
    case error
    case noResponse
    case mappingFailure
    case noToken
}
