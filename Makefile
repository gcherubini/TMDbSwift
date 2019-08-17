setup:
	sudo gem install xcpretty
	pod install
clean-derived-data:
	rm -rf ~/Library/Developer/Xcode/DerivedData
clean:
	xcodebuild clean -workspace TMDbSwift.xcworkspace -scheme TMDbSwift | xcpretty
build:
	xcodebuild build -workspace TMDbSwift.xcworkspace -scheme TMDbSwift | xcpretty
lint:
	swiftlint lint TMDbSwift
format:
	swiftlint autocorrect TMDbSwift
build-and-test:
	xcodebuild -workspace TMDbSwift.xcworkspace -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone X,OS=12.2' -scheme TMDbSwift test | xcpretty
check:	clean lint build-and-test
