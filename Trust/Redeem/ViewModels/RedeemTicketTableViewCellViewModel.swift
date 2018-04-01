// Copyright © 2018 Stormbird PTE. LTD.

import UIKit

struct RedeemTicketTableViewCellViewModel {
    private let ticketHolder: TicketHolder

    init(
            ticketHolder: TicketHolder
    ) {
        self.ticketHolder = ticketHolder
    }

    var ticketCount: String {
        return "x\(ticketHolder.tickets.count)"
    }

    var title: String {
        return ticketHolder.name
    }

    var seatRange: String {
        return ticketHolder.seatRange
    }

    var zoneName: String {
        return ticketHolder.zone
    }
	var venue: String {
        return ticketHolder.venue
    }

    var date: String {
        //TODO Should format be localized?
        return ticketHolder.date.format("dd MMM yyyy")
    }

    var backgroundColor: UIColor {
        return Colors.appWhite
    }

    var status: String {
        return ""
    }

    var cellHeight: CGFloat {
        return 113
    }

    var checkboxImage: UIImage {
        if ticketHolder.status == .redeemed {
            return R.image.ticket_bundle_checked()!
        } else {
            return R.image.ticket_bundle_unchecked()!
        }
    }
}
