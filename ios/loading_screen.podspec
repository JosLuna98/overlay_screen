#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint loading_screen.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'loading_screen'
  s.version          = '1.0.1'
  s.summary          = 'A Flutter plugin to easily display loading screens.'
  s.description      = <<-DESC
  A Flutter plugin to easily display and dispose standard or custom loading screens anywhere in your app.
                       DESC
  s.homepage         = 'https://github.com/JosLuna98/loading_screen.git'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'JosTech.Dev' => 'josluna1098@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
  s.swift_version = '5.0'
end
