Pod::Spec.new do |s|
  s.name             = 'Networking'
  s.version          = '2.1.0'
  s.summary          = 'Layer responsible for all networking of the application.'
  s.homepage         = 'https://github.com/iCookbook/Networking'
  s.author           = { 'htmlprogrammist' => '60363270+htmlprogrammist@users.noreply.github.com' }
  s.source           = { :git => 'https://github.com/iCookbook/Networking.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.swift_version = '5.0'

  s.source_files = 'Networking/**/*.{swift}'
  s.dependency 'Models'
end
