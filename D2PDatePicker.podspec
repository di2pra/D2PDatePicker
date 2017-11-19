#
# Be sure to run `pod lib lint D2PDatePicker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'D2PDatePicker'
  s.version          = '0.1.4'
  s.summary          = 'Elegant and Easy-to-Use iOS Swift Date Picker'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Elegant and Easy-to-Use iOS Swift Date Picker made with love by DI2PRA'

  s.homepage         = 'https://github.com/di2pra/D2PDatePicker'
  s.screenshots     = 'https://raw.githubusercontent.com/di2pra/D2PDatePicker/master/image/screen_1.png', 'https://raw.githubusercontent.com/di2pra/D2PDatePicker/master/image/screen_2.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'di2pra' => 'pas495@gmail.com' }
  s.source           = { :git => 'https://github.com/di2pra/D2PDatePicker.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/di2pra'

  s.ios.deployment_target = '8.0'
  s.source_files = ['D2PDatePicker/Classes/**/*']
# s.resource_bundles = {
#   'D2PDatePicker' => ['D2PDatePicker/Assets/*.{xcassets}']
# }

  s.resource = 'D2PDatePicker/Assets/*.{xcassets}'


end
