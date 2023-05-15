// Copyright © 2019 Stormbird PTE. LTD.

import Foundation

enum TransactionsSource {
    case etherscan(apiKey: String?, apiUrl: URL)
    case blockscout(apiKey: String?, apiUrl: URL)
    case covalent(apiKey: String?)
    case oklink(apiKey: String?)
    case unknown
}

public enum TransactionProviderState: Int {
    case pending
    case running
    case stopped
}

public protocol SingleChainTransactionProvider: AnyObject {
    var state: TransactionProviderState { get }
    
    func start()
    func resume()
    func pause()
    func isServer(_ server: RPCServer) -> Bool
}
