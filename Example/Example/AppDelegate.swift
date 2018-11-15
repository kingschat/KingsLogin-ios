// Copyright (c) 2018 Kinging LLC.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import UIKit
import KCLoginSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize KingsChat login
        LoginManager.delegate = self
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        let sourceAppName = options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String
        let handled = LoginManager.handle(url, sourceAppName: sourceAppName)
        return handled
    }
}

extension AppDelegate: KCLoginManagerDelegate {
    func login(succeededWith response: KCLoginResponse) {
        displayAlertInTopController(message: response.authCode)
    }

    func login(failedWithError error: KCLoginError) {
        displayAlertInTopController(message: error.message)
    }

    private func displayAlertInTopController(message: String) {
        let alertController = UIAlertController(title: "Login", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)

        AppDelegate.topViewController()?.present(alertController, animated: true)
    }
}

extension AppDelegate {
    static func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }

        if let tabController = controller as? UITabBarController,
            let selected = tabController.selectedViewController {
            return topViewController(controller: selected)
        }

        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }

        return controller
    }
}
