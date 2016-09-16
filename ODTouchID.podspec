Pod::Spec.new do |s|

s.name          = "ODTouchID"
s.version       = "1.0.0"
s.license       = "MIT"
s.summary       = "Use Touch ID with one line in Swift"
s.homepage      = "https://github.com/olddonkey/ODTouchID/"
s.author        = { "olddonkey" => "olddonkeyblog@gmail.com" }
s.source        = { :git => "https://github.com/olddonkey/ODTouchID.git", :tag => "1.0.0" }
s.requires_arc  = true
s.description   = <<-DESC
Use Touch ID with one line in Swift
DESC
s.source_files  = "ODTouchID/*"
s.platform      = :ios, '8.0'
s.framework     = 'Foundation', 'LocalAuthentication'

end
