platform :ios, '10.0'
use_frameworks!
inhibit_all_warnings!

source 'https://github.com/CocoaPods/Specs.git'

def my_pods
  pod 'Hero', '~> 1.3.0'
end

target 'AnimateUITableViewLoad' do
  my_pods
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if config.name == 'Debug'
        config.build_settings['OTHER_SWIFT_FLAGS'] = ['$(inherited)', '-Onone']
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
      else
        # config.build_settings['OTHER_SWIFT_FLAGS'] = ['$(inherited)', '-Owholemodule']
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
      end
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '10.0'
    end
  end
end
