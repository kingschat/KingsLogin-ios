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

public protocol KCLoginManaging {
    /**
     Current scopes. Default scope is user.
    */
    var scopes: [KCScope] { get }

    /**
     Current authorization code.
     */
    var authCode: String? { get }

    /**
     Delegate property. Delegate tells about success and failure of authorization requests.
     */
    var delegate: KCLoginManagerDelegate? { get set }

    /**
     Set scopes.
     
     - parameters:
        - scopes: Scopes that user can have access to
     */
    func setScopes(_ scopes: KCScope...)

    /**
     Makes request for authorization code. The result of this request will be given by a delegate.
    */
    func makeAuthorizationRequest()

    /**
     Handles upcoming URL.
     
     - parameters:
        - url: Sent url
        - sourceAppname: Name of the app that sent url
     
     - returns:
        Bool value that determine if provided URL was handled.
    */
    func handle(_ url: URL?, sourceAppName: String?) -> Bool
}
