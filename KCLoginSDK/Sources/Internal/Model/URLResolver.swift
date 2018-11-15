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

final class URLResolver {
    private let url: URL
    private let params: [URLQueryItem]

    convenience init?(url: URL?) {
        guard let url = url else { return nil }
        self.init(url: url)
    }

    init(url: URL) {
        self.url = url
        params = URLComponents(url: self.url, resolvingAgainstBaseURL: true)?
            .queryItems ?? []
    }

    func canResolve() -> Bool {
        return params.contains(paramName: Constants.UrlParams.error) ||
            params.contains(paramName: Constants.UrlParams.accessDenied) ||
            params.contains(paramName: Constants.UrlParams.authCode)
    }

    func resolve() -> LoginResult {
        if let response = KCLoginResponse(params: params) {
            return LoginResult.success(response)
        }

        if let error = KCLoginError.from(params: params) {
            return LoginResult.authorizationFailure(error)
        }

        return LoginResult.unknown
    }
}
