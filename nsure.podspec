Pod::Spec.new do |s|
  s.name = "nSure"
  s.version = "1.3.12"
  s.summary = "nSure framework"
  s.authors = "nSure"
  s.homepage = "https://github.com/nsure-ai/ios-sdk"
  s.license = { :type => 'LICENSE', :file => 'LICENSE' }

  s.preserve_paths =  'nSure.xcframework/*'
  s.source_files = 'nSure.xcframework/ios-arm64/nSure.framework/Headers/*.{h,m,swift}'
  s.source           = { :git => "https://github.com/nsure-ai/ios-sdk.git", :tag => s.version.to_s }

  s.ios.deployment_target = "13.0"
  s.swift_version = '5.0'
  s.requires_arc = true

  s.preserve_paths = 'nSure.xcframework/*'
  s.source_files = 'nSure.xcframework/ios-arm64/nSure.framework/Headers/*.{h,m}'
  s.vendored_frameworks = 'nSure.xcframework'
  s.public_header_files = 'nSure.xcframework/ios-arm64/nSure.framework/Headers/*.{h,m}'
end
