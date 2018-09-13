#
# Be sure to run `pod lib lint AGAlertView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AGAlertView'
  s.version          = '0.1.0'
  s.summary          = 'Custom Good Looking Alert View'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Custom UIAlertView
                       DESC

  s.homepage         = 'https://github.com/azatgoktas/AGAlertView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'azattgoktas@gmail.com' => 'azattgoktas@gmail.com' }
  s.source           = { :git => 'https://github.com/azatgoktas/AGAlertView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'AGAlertView/Classes/**/*'
  s.resources = 'AGAlertView/Assets/*.xcassets'

  
   s.resource_bundles = {
     'AGAlertView' => ['AGAlertView/Assets/*.png']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
