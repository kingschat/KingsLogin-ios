Pod::Spec.new do |s|
  s.name         = "KCLoginSDK"
  s.version      = "0.1"
  s.summary      = "Swift 4.2 Framework for authenticating with the KingsChat"
  s.homepage     = "https://github.com/kingschat/KingsLogin-ios"
  s.license      = "Apache 2.0"
  s.author             = { "Lukasz Niedzwiedz" => "lukasz.niedzwiedz@appunite.com" }
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.2' }
  s.ios.deployment_target = "11.0"
  s.source       = { :git => "https://github.com/kingschat/KingsLogin-ios.git", :tag => s.version.to_s }
  s.source_files = "KCLoginSDK/Sources/**/*.{swift}"
  s.swift_version = "4.2"
  s.resources = "KCLoginSDK/Resources/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"
  s.requires_arc = true

end
