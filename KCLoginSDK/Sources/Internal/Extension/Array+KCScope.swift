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

extension Array where Element == KCScope {
    func joined(separator: String = ",") -> String {
        return map { $0.rawValue }.joined(separator: separator)
    }

    func containsDuplicates() -> Bool {
        return count != removeDuplicates().count
    }

    func removeDuplicates() -> [KCScope] {
        var addedDict = [Element: Bool]()
        return filter { addedDict.updateValue(true, forKey: $0) == nil }
    }

    func buildJoinedString() -> String {
        return map { $0.rawValue }.joined(separator: ",")
    }
}
