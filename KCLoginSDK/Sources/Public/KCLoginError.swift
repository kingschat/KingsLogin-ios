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

public enum KCLoginError: Error {
    case denied
    case auhtorization(message: String)

    public var message: String {
        switch self {
        case .denied:
            return Localization.deniedAuthorizationMessage
        case .auhtorization(message: let msg):
            return msg
        }
    }

    static func from(params: [URLQueryItem]) -> KCLoginError? {
        if let message = params.value(paramName: Constants.UrlParams.error) {
            return .auhtorization(message: message)
        }

        return params.contains(paramName: Constants.UrlParams.accessDenied) ?
            KCLoginError.denied : nil
    }
}
