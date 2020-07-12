# Nearby Restaurants list App
## Requirements:
* iOS 13.0+
* Xcode 11.5
* Swift 5.2

## Objective:
A Resturant app to demonstrate some examples of MVVM + RxSwift in Swift using **SOLID principles** code organisation, loose coupling, **unit testing** and some of the best practices used in modern iOS programming using `Swift`.

The restaurants data of Australian cities are fetched from [Zomato API](https://developers.zomato.com/api). Please create a free API-KEY from the website if required.


App Goal:
* This project was intended to work as a Resturant search demo projects for iOS using Swift. 
* The demo uses the [Zomato API](https://developers.zomato.com/api) since it is well-maintained API which returns information in a JSON format.
* Use of UITableViewController to display Resturant list information.
* Implemented Unit test for business logic

## Installation

- Xcode **11.5**(required)
- Clean `/DerivedData` folder if any
- Run the pod install `pod install`
- Run Cuckoo script to Mock your Swift objects `./Cuckoo-GeneratedMocks.sh`
- Run SwiftGen script to generator Swift code for assets, Localizable.strings etc `./generate-swiftgen.sh`
- Then clean and build the project in Xcode

## 3rd Party Libraries
 - **`RxSwift`** - [ReactiveX/RxSwift](https://github.com/ReactiveX/RxSwift) is  used to make `Reactive` binding of API call and response
 - **`Kingfisher`** - [onevcat/Kingfisher](https://github.com/onevcat/Kingfisher) for downloading and caching images from the web.
 - **`PKHUD`** - [pkluz/PKHUD](https://github.com/pkluz/PKHUD) to show loading activity indicator
 - **`ReachabilitySwift`** - [ashleymills/Reachability.swift](https://github.com/ashleymills/Reachability.swift) Replacement for Apple's Reachability re-written in Swift with closures
 - **`SwiftLint`** - [realm/SwiftLint](https://github.com/realm/SwiftLint) A tool to enforce Swift style and conventions. 
 - **`SwiftGen`** - [SwiftGen/SwiftGen](https://github.com/SwiftGen/SwiftGen) swift code generator for your assets, storyboards, Localizable.strings. 
 - **`Quick`** - [Quick/Quick](https://github.com/Quick/Quick) is testing framework in swift
 - **`Nimble`** - [Quick/Nimble](https://github.com/Quick/Nimble) is Matcher Framework for Swift to pair with Quick
 - **`Cuckoo`** - [Brightify/Cuckoo](https://github.com/Brightify/Cuckoo) is tasty mocking framework for unit tests in swift

## Technical notes:
- MVVM - My preferred architecture.
    - MVVM stands for “Model View ViewModel”
    - It’s a software architecture often used by Apple developers to replace MVC. Model-View-ViewModel (MVVM) is a structural design pattern that separates objects into three distinct groups:
- Models hold application data. They’re usually structs or simple classes.
- Views display visual elements and controls on the screen. They’re typically - subclasses of UIView.
- View models transform model information into values that can be displayed on a view. They’re usually classes, so they can be passed around as references.

![Alt text](/ScreenShots/MVVM.jpeg?raw=true)

## Screenshot:
![Screen Shot 1](/ScreenShots/screenshot1.png?raw=true)


![Screen Shot 2](/ScreenShots/screenshot2.png?raw=true)


 #### App Demo


 ![](/ScreenShots/restaurants.gif "")

