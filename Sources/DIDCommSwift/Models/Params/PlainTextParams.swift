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

/// Pack Plaintext Message Parameters
public struct PlainTextParams {
    public let message: Message
    public let fromPriorIssuerKid: String?
    public let didResolver: DIDResolver?
    public let secretResolver: SecretResolver?

    public init(
        message: Message,
        fromPriorIssuerKid: String? = nil,
        didResolver: DIDResolver? = nil,
        secretResolver: SecretResolver? = nil
    ) {
        self.message = message
        self.fromPriorIssuerKid = fromPriorIssuerKid
        self.didResolver = didResolver
        self.secretResolver = secretResolver
    }
}