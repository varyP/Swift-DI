//
//  InjectTertiaryViewController.swift
//  SampleDemoTest
//
//  Created by Varun Parakh on 26/1/23.
//

import UIKit

class InjectTertiaryViewController: UIViewController {
    
    @Injected(\.identifier) private(set) var identifier: String
    @Injected(\.networkProvider) private(set) var network: Networking
    
    override func viewDidLoad() {
        makeNetworkCall()
    }
    
    func makeNetworkCall() {
        network.request(from: EthereumServiceConfiguration.ethereum) { _, _ in
            print("InjectTertiaryViewController - API Response")
        }
    }
}
