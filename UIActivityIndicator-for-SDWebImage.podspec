Pod::Spec.new do |s|
  s.name          = "UIActivityIndicator-for-SDWebImage"
  s.version       = "1.0.2"
  s.summary       = "The easiest way to add a UIActivityView to your SDWebImage view."
  s.description   = 'A category that easily allows you to use a UIActivityIndicator in SDWebImage.'
  s.homepage      = "https://github.com/JJSaccolo/UIActivityIndicator-for-SDWebImage"
  s.license       = { :type => 'MIT License', :file => 'LICENSE.txt' }
  s.author        = { "Giacomo Saccardo" => "gsaccardo@gmail.com" }
  s.source        = { :git => "https://github.com/WhistleLabs/UIActivityIndicator-for-SDWebImage.git" }
  s.platform      = :ios, '7.0'
  s.source_files  = '*.{h,m}'
  s.requires_arc  = true
  s.dependency 'SDWebImage', '~> 3.7.5'
  s.dependency 'AFNetworking', '~> 2.6.3'
end
