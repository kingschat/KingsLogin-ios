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

import XCTest
@testable import KCLoginSDK

class KCLoginSDKTests: XCTestCase {
    var manager: KCLoginManaging!

    override func setUp() {
        manager = KCLoginManager()
        super.setUp()
    }

    override func tearDown() {
        manager = nil
        super.tearDown()
    }

    func testValidTokenResponseUrl() {
        let validUrl = URL(string: "kc12345://response?\(Constants.UrlParams.token)=token")!
        XCTAssertTrue(manager.handle(validUrl, sourceAppName: Constants.kingschatAppName))
        XCTAssert(manager.currentToken?.value == "token")
    }

    func testValidErrorResponseUrl() {
        let validUrl = URL(string: "kc12345://response?\(Constants.UrlParams.error)=errorMessage")!
        XCTAssertTrue(manager.handle(validUrl, sourceAppName: Constants.kingschatAppName))
    }

    func testInvalidTokenResponseUrl() {
        let invalidUrl = URL(string: "kc12345://response?")!
        XCTAssertFalse(manager.handle(invalidUrl, sourceAppName: Constants.kingschatAppName))
    }

    func testInvalidTokenResponseUrlWithParam() {
        let invalidUrl = URL(string: "kc12345://response?something=1")!
        XCTAssertFalse(manager.handle(invalidUrl, sourceAppName: Constants.kingschatAppName))
    }
}
