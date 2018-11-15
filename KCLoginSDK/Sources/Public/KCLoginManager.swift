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

import Foundation

/**
 * Global instance of KingsChat Manager
 */
public var LoginManager: KCLoginManaging = KCLoginManager()

/**
 * Delegate of KCLoginManager
 */
public protocol KCLoginManagerDelegate: class {
    /**
     * Method that will be invoked when authorization request succeded
     */
    func login(succeededWith response: KCLoginResponse)

    /**
     * Method that will be invoked when authorization request failed
     */
    func login(failedWithError error: KCLoginError)
}

/**
 * Class that manage Authorization request
 */
public final class KCLoginManager: NSObject, KCLoginManaging {
    /**
     * Current scopes. Default scopes is `user`
    */
    public private(set) var scopes: [KCScope] = [.user]

    /**
     * Current authorization code
     */
    public private(set) var authCode: String?

    /**
     * Delegate property
     */
    public weak var delegate: KCLoginManagerDelegate?

    /**
     * Makes authorization request. If KingsChat App is not installed it will open AppStore with Kingschat App
     */
    @objc public func makeAuthorizationRequest() {
        if UIApplication.shared.canOpenURL(Constants.kingschatURL) {
            openKingschat()
        } else {
            UIApplication.shared.open(Constants.kingschatAppStoreUrl,
                                      options: [:],
                                      completionHandler: nil)
        }
    }

    /**
    * Handles open request from another app. Returns true if it is valid KingsChat response
    */
    public func handle(_ url: URL?, sourceAppName: String?) -> Bool {
        guard
            sourceAppName == Constants.kingschatAppName,
            let resolver = URLResolver(url: url),
            resolver.canResolve() else {
                return false
        }

        switch resolver.resolve() {
        case .success(let response):
            delegate?.login(succeededWith: response)
        case .authorizationFailure(let error):
            delegate?.login(failedWithError: error)
        case .unknown:
            assertionFailure("Recieved unknown url. Check for newer version of framework or contact with support by github.")
            return false
        }

        return true
    }

    /**
     * Set scopes with validation.
     */
    public func setScopes(_ scopes: KCScope...) {
        assert(scopes.containsDuplicates(), "Some of scope are duplicated.")

        self.scopes = scopes.removeDuplicates()
    }

    private func openKingschat() {
        guard let clientId = Bundle.main.string(forDictionaryKey: Constants.Key.clientId) else {
            fatalError("Kingschat client ID not found")
        }

        let appName = Bundle.main.string(forDictionaryKey: Constants.Key.appName)
        let url = URLBuilder(clientId: clientId, appName: appName, scopes: scopes)

        UIApplication.shared.open(url.preparedLoginUrl, options: [:], completionHandler: nil)
    }
}
