Pod::Spec.new do |spec|

  spec.name         = "ConvertApiCom"
  spec.version      = "0.0.2"
  spec.summary      = "A ConvertApiCom library written in Swift"

  spec.homepage     = "https://github.com/djups/ConvertApiSwift"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "djups" => "ajog@yandex.ru" }

  spec.platform      = :ios, '12.3'
  spec.swift_version = '4.2'

  spec.source        = { :git => "https://github.com/djups/ConvertApiSwift.git", :tag => "0.0.2" }
  spec.source_files  = "ConvertApiCom/**/*.{h,m,swift}", "ConvertApiCom/Models/*.{h,m,swift}"

end
