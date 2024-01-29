/*
 * Copyright 2024 Gonçalo Frade
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Foundation

struct EncryptedMessage {
    
    struct Recipient {
        let encryptedKey: String
        let header: [String: String]
    }
    
    let ciphertext: String
    let protected: String
    let recipients: [Recipient]
    let tag: String
    let iv: String
}

extension EncryptedMessage: Codable {}
extension EncryptedMessage.Recipient: Codable {}
