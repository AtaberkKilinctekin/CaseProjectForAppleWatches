//
//  BoxModel.swift
//  CaseProjectForAppleWatches
//
//  Created by Ataberk on 22.10.2022.
//

import Foundation

struct BoxModel: Hashable {
    let id: String = UUID().uuidString
    let colorCode: Int
    var number: Int
}
