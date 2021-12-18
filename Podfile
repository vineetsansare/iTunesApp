# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

# For mulitple targets we may want to use same pods, defining common_pods below -
def common_pods
  pod 'SwiftLint'
  pod 'SnapKit'
  pod 'Alamofire'  
  pod 'CollectionKit', '~> 2.4.0'
  pod 'CollectionKit/WobbleAnimator', '~> 2.4.0'
end

def testing_pods
  pod 'Quick'
  pod 'Nimble'
end

target 'iTunesApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for iTunesApp
  common_pods

  target 'iTunesAppTests' do
    inherit! :search_paths
    # Pods for testing
    testing_pods
  end

  target 'iTunesAppUITests' do
    # Pods for testing
    testing_pods
  end
  
end
