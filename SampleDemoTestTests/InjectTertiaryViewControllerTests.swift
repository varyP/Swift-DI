//
//  InjectTertiaryViewControllerTests.swift
//  SampleDemoTest
//
//  Created by Varun Parakh on 26/1/23.
//

import XCTest

class InjectTertiaryControllerTests: XCTestCase {
    var sut: InjectTertiaryViewController!
    var mockNetwork: MockNetworking!
    
    override func setUp() {
        super.setUp()
        sut = InjectTertiaryViewController()
        InjectedValues[\.networkProvider] = MockNetworking(filename: DataSet.two.filename)
        InjectedValues[\.identifier] = "tertiary"
        mockNetwork = (sut.network as! MockNetworking)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testInjectedProperties() {
        XCTAssertEqual(sut.identifier, "tertiary")
        XCTAssertTrue(sut.network as? MockNetworking != nil)
    }
    
    func testMakeNetworkCallCompletion() {
        let expectation = self.expectation(description: "network call completion")
        mockNetwork.filename = DataSet.one.filename
        mockNetwork.request(from: MockNetworking.MockEndpoint.mock) { data, error in
            expectation.fulfill()
        }
        sut.makeNetworkCall()
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testMakeNetworkCallWithLocalResponse() {
        let responseFile = DataSet.two.filename
        let expectedResponse = MockingUtil.readJSON(name: responseFile)
        let expectation = self.expectation(description: "network call completion")
        mockNetwork.filename = responseFile
        mockNetwork.request(from: MockNetworking.MockEndpoint.mock) { data, error in
            XCTAssertEqual(data, expectedResponse.0)
            XCTAssertEqual(error as NSError?, expectedResponse.1 as? NSError)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testMakeNetworkCallWithLocalResponseError() {
        let responseFile = DataSet.errorData.filename
        let expectedResponse = MockingUtil.readJSON(name: responseFile).0
        let expectedError = NSError(domain: "test", code: 0, userInfo: nil)
        let expectation = self.expectation(description: "network call completion")
        mockNetwork.filename = responseFile
        mockNetwork.request(from: MockNetworking.MockEndpoint.mock) { data, error in
            XCTAssertEqual(data, expectedResponse)
            XCTAssertEqual(error as NSError?, expectedError)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}
