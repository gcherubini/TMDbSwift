platform :ios, '9.0'

target 'TMDbSwift' do
  use_frameworks!

	pod 'Moya', '13.0.0'
	pod 'SwiftLint'

	abstract_target 'Tests' do
		target "TMDbSwiftTests"
		target "TMDbSwiftUITests"
		
		pod 'Quick', '2.1.0'
		pod 'Nimble', '8.0.1'
	end
end
