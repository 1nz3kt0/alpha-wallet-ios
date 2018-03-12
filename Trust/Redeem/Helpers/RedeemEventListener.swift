//
//  RedeemEventListener.swift
//  Alpha-Wallet
//
//  Created by Oguzhan Gungor on 3/12/18.
//  Copyright © 2018 Alpha-Wallet. All rights reserved.
//

import Foundation

class RedeemEventListener {

    var shouldListen = false

    func start(completion: @escaping () -> Void) {
        if !shouldListen {
            return
        }
        EventsRest().getEvents { result in
            print(result)
            switch result {
            case .success(let events):
                print(events)
                completion()
            case .failure(let error):
                print(error)
                self.start(completion: completion)
            }
        }
    }

    func stop() {
        shouldListen = false
        RestClient.cancel()
    }

    deinit {
        print("deinit")
    }

}
