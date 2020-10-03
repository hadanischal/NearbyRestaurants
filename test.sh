xcodebuild \
-workspace NearbyRestaurants.xcworkspace \
-scheme NearbyRestaurants \
-sdk iphonesimulator \
-destination "generic/platform=iOS" \
# -destination 'platform=iOS Simulator,name=iPhone 11 Pro Max,OS=13.7' \
test | xcpretty
