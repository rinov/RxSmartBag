Pod::Spec.new do |s|
  s.name             = 'RxSmartBag'
  s.version          = '1.0.2'
  s.summary          = 'A useful dispose bag for RxSwift.'
  s.description      = <<-DESC
A simple way to omit declararing DisposeBag.
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
