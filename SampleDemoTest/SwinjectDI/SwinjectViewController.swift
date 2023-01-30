//
//  ViewController.swift
//  SampleDemoTest
//
//  Created by Varun Parakh on 29/12/22.
//

import UIKit

class SwinjectViewController: UIViewController {

    var service: Networking?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        makeNetworkCall()
    }
    
    func makeNetworkCall() {
        service?.request(from: EthereumServiceConfiguration.ethereum, completion: {[weak self] resp, err in
            print("SwinjectViewController - API Response")
            self?.moveToNext()
        })
    }
    
    func moveToNext() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: { [weak self] in
            guard let self = self else { return }
//            let vc = SubViewController(container: DefaultContainer.sharedContainer.container)
//            self.navigationController?.pushViewController(vc, animated: true)
            
//            let vc = InjectSubViewController()
//            self.navigationController?.pushViewController(vc, animated: true)
            
            guard let vc = OKGWalletModule.shared.uiFactory.resolveViewController(EthereumViewController.self) else {
                assertionFailure("resolve failed")
                return
            }
            
            self.navigationController?.pushViewController(vc, animated: true)
        })
    }
}
