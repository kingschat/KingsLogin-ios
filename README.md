
# KingsChat For Developers

[![Version](https://img.shields.io/cocoapods/v/KCLoginSDK.svg?style=flat)](https://cocoapods.org/pods/KCLoginSDK)
[![License](https://img.shields.io/cocoapods/l/KCLoginSDK.svg?style=flat)](https://cocoapods.org/pods/KCLoginSDK)
[![Platform](https://img.shields.io/cocoapods/p/KCLoginSDK.svg?style=flat)](https://cocoapods.org/pods/KCLoginSDK)

This library allows your app to login using Kingschat.  
Written in Swift 4.2  
Supported iOS version 11.0 and higher  

# Installation Guide

 Create your app in [Kingschat Dashboard](https://developer.kingsch.at/)

 ## [CocoaPods](http://cocoapods.org/)
 1. Navigate to your project folder in terminal
 2. Make sure you have the CocoaPods installed 
 3. Add `pod 'KCLoginSDK'` to your Podfile
 4. Run the following command in your project root directory from a terminal window
 `$ pod install`

## App implementation

 1. Configure `info.plist` file
 * Right click `info.plist`, and choose Open As Source Code
 * Copy and paste the following XML snippet into the body of your file ( `<dict>...</dict>`).
```html
<key>CFBundleURLTypes</key>
<array>
	<dict>
		<key>CFBundleURLSchemes</key>
		<array>
			<string>kc-[YOUR_CLIENT_ID]</string>
		</array>
	</dict>
</array>
<key>KingschatClientId</key>
<string>[YOUR_CLIENT_ID]</string>
<key>LSApplicationQueriesSchemes</key>
<array>
	<string>kingschat</string>
</array>
```
 2. Connect your `AppDelegate`
 * Set delegate
 ```swift
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize KingsChat login
        LoginManager.delegate = self
        return true
    }
 ```
 * Handle KingsChat URL
 ```swift
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        let sourceAppName = options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String
        let handled = LoginManager.handle(url, sourceAppName: sourceAppName)
        return handled
    }
 ```
 * Implement `KCLoginManagerDelegate` 
 ```swift
extension AppDelegate: KCLoginManagerDelegate {
    func login(succeededWith response: KCLoginResponse) {
        print(response.authCode.value)
    }

    func login(failedWithError error: KCLoginError) {
        print(error.message)
    }
}
 ```
 
 3. Add Kingschat login to your code
```swift 
import UIKit
import KCLoginSDK

class ViewController: UIViewController {
	private lazy var button: KCLoginButton = {
		let button = KCLoginButton()
		return button
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(button)
	}
}
```

## Example
For more information about implementation check our example app

