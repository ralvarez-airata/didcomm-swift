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
import JSONWebToken
import JSONWebSignature

struct SignedEnvelopePack {
    let message: Message
    let signFrom: String
    let fromPriorIssuerKid: String?
    let didResolver: DIDResolver
    let secretResolver: SecretResolver
    
    func pack() async throws -> SignedResult {
        let senderKeySelector = SenderKeySelector(didResolver: didResolver, secretResolver: secretResolver)

        let (message, fromPriorIssuerKid) = try await FromPrior.packFromPrior(
            message: message,
            fromPriorIssuerKid: fromPriorIssuerKid,
            keySelector: senderKeySelector
        )
        
        let signFromKey = try await senderKeySelector.findSigningKey(signFrom: signFrom)
        let msgJsonData = try message.didcommJson()
        
        return try pack(
            payload: msgJsonData,
            key: signFromKey,
            fromPriorIssuerKid: fromPriorIssuerKid
        )
    }
    
    func pack(payload: Data, key: Key, fromPriorIssuerKid: String?) throws -> SignedResult {
        let msg = try Signer.sign(payload: payload, key: key)

        return SignedResult(
            packedMessage: msg,
            signFromKid: key.id,
            fromPriorIssuerKid: fromPriorIssuerKid
        )
    }
}
