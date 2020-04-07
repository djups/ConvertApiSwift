# Convert files to PDF using https://www.convertapi.com/ for iOS (Swift)
Api call using Swift and native URLRequest for convertapi.com.
Models, based on Codable protocols.

# Install using CocoaPods
- iOS target: 12.3
- swift versions: 4.2, 5.0
```
pod 'ConvertApiCom'
```

# How to initialize:
First you should inject your token in library. Add this line, using your token in didFinishLaunchingWithOptions method.
Don't forget to import module
```
import ConvertApiCom

ConfigImp.shared.saveToken("your_token_here")
```

# How to convert file to PDF:
Be sure, that you send right file format to convertFileToPDF method.
```
import ConvertApiCom

var service: APIConverterService = APIConverterServiceImp()

// you can use Data(contentsOf: URL), or convert your files to Data type.
service.convertFileToPDF(type: .txt, fileData: data) { (response) in
    switch response {
    case .success(let response):
        // handle response based on "response.files.first?.pdfData?""
    case .failure(let error):
      // handle error
    }
}
```

Using enum with types. You can update with types that you need.
```
enum SupportedType: String {
    case docx
    case doc
    case txt
    case html
}
```

Error types are hardcoded in enum:
```
public enum ConvertError: Error {
    case error
    case noResponse
    case mappingFailure
    case noToken
}
```

Feel free to update this lib with new implementation or fixing.
TODO:
- Implement APIConverterService method for url as parameter, and incapsulate file format handling in library. 
- Test for API call, and error handlings.
- Sample project.
