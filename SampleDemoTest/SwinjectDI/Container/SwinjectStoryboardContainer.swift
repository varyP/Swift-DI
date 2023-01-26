//
//  SwinjectStoryboardContainer.swift
//  SampleDemoTest
//
//  Created by Varun Parakh on 24/1/23.
//

import Foundation
import Swinject
import SwinjectStoryboard
import SwinjectAutoregistration

extension SwinjectStoryboard {
    @objc class func setup() {
        let mainContainer = DefaultContainer.sharedContainer.container
        Container.loggingFunction = nil
        defaultContainer.storyboardInitCompleted(SwinjectViewController.self) { _, controller in
            controller.service = mainContainer.resolve(Networking.self)
        }
    }
}
