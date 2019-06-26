//
//  TransactionTableViewCell.swift
//  Coiner-iOS
//
//  Created by Justin Furstoss on 6/20/19.
//  Copyright © 2019 Justin Furstoss. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    
    var transaction: Transaction? {
        didSet {
            configureTransactionCell()
        }
    }
    
    @IBOutlet weak var transactionDateLabel: UILabel!
    @IBOutlet weak var rewardPointsLabel: UILabel!
    @IBOutlet weak var transactionAmountLabel: UILabel!
    
    
    func configureTransactionCell() {
        if let transaction = transaction {
            // MARK: Format Date in Date Extension && Set up Reward Points && Format Amount
            transactionDateLabel.text = transaction.date.formattedToString(withFormat: "MMMM dd, YYYY hh:mm a")
            transactionAmountLabel.text = transaction.amount.formatToCurrencyString()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
