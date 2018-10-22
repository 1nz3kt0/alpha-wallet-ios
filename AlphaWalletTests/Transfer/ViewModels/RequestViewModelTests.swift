// Copyright SIX DAY LLC. All rights reserved.

import XCTest
@testable import AlphaWallet
import TrustKeystore

class RequestViewModelTests: XCTestCase {
    
    func testMyAddressText() {
        let account: Wallet = .make()
        let viewModel = RequestViewModel(account: account, config: .make())

        XCTAssertEqual(account.address.description, viewModel.myAddressText)
    }

    func testShareMyAddressText() {
        let account: Wallet = .make()
        let config: Config = .make()
        let viewModel = RequestViewModel(account: account, config: .make())

        LiveLocaleSwitcherBundle.switchLocale(to: "en")
        XCTAssertEqual("My \(config.server.name) address is: \(account.address.description)", viewModel.shareMyAddressText)
    }
}
