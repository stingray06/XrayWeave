//
//  TrojanOutboundConfigurationObject.swift
//  XrayWeave
//
//  Created by Codex on 2026-04-13.
//

import Foundation

public struct TrojanOutboundConfigurationObject: Encodable, XrayParsable {

    public struct Server: Encodable {
        let address: String
        let port: Int
        let password: String
    }

    public let servers: [Server]

    public init(_ parser: XrayWeave) throws {
        let password = parser.userID

        guard !password.isEmpty else {
            throw NSError.newError("Trojan password is missing")
        }

        servers = [
            Server(
                address: parser.host,
                port: parser.port,
                password: password
            )
        ]
    }
}
