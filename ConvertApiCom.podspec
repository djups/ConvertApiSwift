Pod::Spec.new do |spec|

  spec.name         = "ConvertApiCom"
  spec.version      = "0.0.1"
  spec.summary      = "A ConvertApiCom library written in Swift"

  spec.homepage     = "https://github.com/djups/ConvertApiSwift"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "djups" => "ajog@yandex.ru" }

  spec.ios.deployment_target = "11.0"
  spec.swift_version = ["4.2", "5.0"]

  spec.source        = { :git => "https://github.com/djups/ConvertApiSwift.git", :tag => "0.0.1" }
  spec.source_files  = "ConvertApiCom/**/*.{h,m,swift}", "ConvertApiCom/Models/*.{h,m,swift}"

end
