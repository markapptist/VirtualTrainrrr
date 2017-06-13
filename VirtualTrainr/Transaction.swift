//
//  Transaction.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 2017-06-13.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import UIKit

struct Transaction {
    var id: Int
    var date: Date
    var payment: Float
    var client: Client
    var trainer: Trainer
}
