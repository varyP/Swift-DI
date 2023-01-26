//
//  ServiceHelper.swift
//  SampleDemoTest
//
//  Created by Varun Parakh on 26/1/23.
//

import Foundation

enum EthereumServiceConfiguration {
    case ethereum
}
extension EthereumServiceConfiguration: Endpoint {
    var path: String {
        switch self {
        case .ethereum: return "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=ethereum"
        }
    }
}
