//
// Created by James Sangalli on 14/7/18.
// Copyright © 2018 Stormbird PTE. LTD.
//

import Foundation
import BigInt

struct ContractERC721Transfer: Web3Request {

    typealias Response = String
    let from: String
    let to: String
    let tokenId: String
    let contractAddress: String

    var type: Web3RequestType {
        var abi = "{\"constant\":false,\"inputs\":[{\"name\":\"_to\",\"type\":\"address\"},{\"name\":\"_tokenId\",\"type\":\"uint256\"}],\"name\":\"transfer\",\"outputs\":[],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"}, [\"\(to)\" \(tokenId)]"
        let abiSafeTransferTo = "{ \"constant\": false, \"inputs\": [ { \"name\": \"_from\", \"type\": \"address\" }, { \"name\": \"_to\", \"type\": \"address\" }, { \"name\": \"_tokenId\", \"type\": \"uint256\" } ], \"name\": \"safeTransferFrom\", \"outputs\": [], \"payable\": true, \"stateMutability\": \"payable\", \"type\": \"function\"},  [\"\(from)\" \(to), \(tokenId)]"
        if(Constants.legacy721Addresses.contains(contractAddress.drop0x.lowercased())) {
            abi = abiSafeTransferTo
        }
        let run = "web3.eth.abi.encodeFunctionCall(" + abi + ")"
        return .script(command: run)
    }
}
