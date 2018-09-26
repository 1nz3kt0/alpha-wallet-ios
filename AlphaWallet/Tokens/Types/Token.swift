//
//  Token.swift
//  Alpha-Wallet
//
//  Created by Oguzhan Gungor on 2/25/18.
//  Copyright © 2018 Alpha-Wallet. All rights reserved.
//

import Foundation
import BigInt

struct Token {
    enum Status {
        case available, sold, redeemed, forSale, transferred, pending, availableButDataUnavailable
    }

    let id: BigUInt
    let index: UInt16
    var name: String
    var status: Status
    let values: [String: AssetAttributeValue]

    static var empty: Token {
        return Token(
                id: Constants.nullTokenIdBigUInt,
                index: 0,
                name: R.string.localizable.tokensTitlecase(),
                status: .available,
                values: [
                    "locality": "N/A",
                    "venue": "N/A",
                    "match": 0,
                    "time": GeneralisedTime.init(),
                    "numero": 0,
                    "category": "N/A",
                    "countryA": "N/A",
                    "countryB": "N/A"
                ]
        )
    }
}
