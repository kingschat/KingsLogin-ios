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

struct Constants {
    static let kingschatAppName = "com.kingschat"
    static let kingschatURL = URL(string: "kingschat://sdk/oauth")!
    static let kingschatAppStoreUrl = URL(string: "itms-apps://itunes.apple.com/app/id895560991")!

    struct UrlParams {
        static let authCode = "code"
        static let clientId = "client_id"
        static let name = "name"
        static let scopes = "scopes"
        static let error = "error"
        static let accessDenied = "accessDenied"
        static let acceptedScopes = "acceptedScopes"
        static let rejectedScopes = "rejectedScopes"
        static let unsupportedScopes = "unsupportedScopes"
    }

    struct Key {
        static let clientId = "KingschatClientId"
        static let appName = "CFBundleDisplayName"
    }
}
