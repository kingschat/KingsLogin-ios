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

struct URLBuilder {
    private let clientId: String
    private let scopes: String
    private let appName: String

    var preparedLoginUrl: URL {
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: Constants.UrlParams.name, value: appName),
            URLQueryItem(name: Constants.UrlParams.clientId, value: clientId),
            URLQueryItem(name: Constants.UrlParams.scopes, value: scopes)
        ]

        var comp = URLComponents(url: Constants.kingschatURL, resolvingAgainstBaseURL: true)!
        comp.queryItems = queryItems

        guard let preparedUrl = comp.url else {
            fatalError("Provided values are invalid.")
        }

        return preparedUrl
    }

    init(clientId: String, appName: String?, scopes: [KCScope]) {
        self.clientId = clientId
        self.scopes = scopes.buildJoinedString()
        self.appName = appName ?? ""
    }
}
