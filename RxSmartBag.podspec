Pod::Spec.new do |s|
  s.name             = 'RxSmartBag'
  s.version          = '2.0.0'
  s.summary          = 'A useful dispose bag for RxSwift.'
  s.description      = <<-DESC
A simple way to omit declararing DisposeBag.
                       DESC

  s.homepage         = 'https://github.com/rinov/RxSmartBag'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rinov' => 'rinov@rinov.jp' }
  s.source           = { :git => 'https://github.com/rinov/RxSmartBag.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'RxSmartBag/Classes/**/*'
  s.dependency 'RxSwift', '~> 4.0'
end
