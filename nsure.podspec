Pod::Spec.new do |s|
  s.name = "nSure"
  s.version = "1.2.0"
  s.summary = "nSure framework"
  s.authors = "nSure"
  s.homepage = "https://github.com/nsure-ai/ios-sdk"

  s.preserve_paths =  'nSure.xcframework/*'
  s.source_files = 'nSure.xcframework/ios-arm64_armv7/nSure.framework/Headers/*.{h,m,swift}'
  s.source           = { :git => "https://github.com/nsure-ai/ios-sdk.git", :tag => s.version.to_s }

  s.ios.deployment_target = "10.0"
  s.requires_arc = true

  s.preserve_paths = 'nSure.xcframework/*'
  s.source_files = 'nSure.xcframework/ios-arm64_armv7/nSure.framework/Headers/*.{h,m}'
  s.vendored_frameworks = 'nSure.xcframework'
  s.public_header_files = 'nSure.xcframework/ios-arm64_armv7/nSure.framework/Headers/*.{h,m}'
end
