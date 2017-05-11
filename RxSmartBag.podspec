Pod::Spec.new do |s|
  s.name             = 'RxSmartBag'
  s.version          = '0.1.0'
  s.summary          = 'An automatic dispose bag for Rx.'
  s.description      = <<-DESC
An automatic dispose bag for RxSwift written in swift3.
                       DESC

  s.homepage         = 'https://github.com/rinov/RxSmartBag'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rinov' => 'rinov@rinov.jp' }
  s.source           = { :git => 'https://github.com/rinov/RxSmartBag.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'RxSmartBag/Classes/**/*'
  
  # s.resource_bundles = {
  #   'RxSmartBag' => ['RxSmartBag/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'RxSwift', '~> 3.0'
end
