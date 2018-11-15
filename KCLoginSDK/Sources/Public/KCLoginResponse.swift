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
 * Struct that represent response from KingsChat
 */
public struct KCLoginResponse {
    /**
     * Struct containing authorization code
     */
    public let authCode: String

    /**
    * Array of scopes that has been accepeted
    */
    public let acceptedScopes: [String]

    /**
    * Array of scopes that has been rejected by user or by API
    */
    public let rejectedScopes: [String]

    /**
    * Array of scopes that are invalid if provided custom scopes.
    */
    public let unsupportedScopes: [String]

    init?(params: [URLQueryItem]) {
        guard let authCode = params.value(paramName: Constants.UrlParams.authCode) else {
            return nil
        }

        self.authCode = authCode
        acceptedScopes = params.values(paramName: Constants.UrlParams.acceptedScopes)
        rejectedScopes = params.values(paramName: Constants.UrlParams.rejectedScopes)
        unsupportedScopes = params.values(paramName: Constants.UrlParams.unsupportedScopes)
    }
}
