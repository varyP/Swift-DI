//
//  MockNetworking.swift
//  SampleDemoTestTests
//
//  Created by Varun Parakh on 25/1/23.
//

import Foundation

class MockedNetworking: Networking {
    var requestCalled = false
    var requestCompletion: ((Data?, Error?) -> Void)?
    var localResponse: (Data?, Error?)?
    
    func request(from endpoint: Endpoint, completion: @escaping (Data?, Error?) -> Void) {
        requestCalled = true
        if let localResponse = localResponse {
            if let requestCompletion = requestCompletion {
                requestCompletion(localResponse.0, localResponse.1)
            } else {
                completion(localResponse.0, localResponse.1)
            }
        }
    }
}

import XCTest
import Foundation

struct MockNetworking: Networking {
    
    enum MockEndpoint: Endpoint {
        case mock
        var path: String {
            switch self {
            case .mock: return ""
            }
        }
    }
    
    var filename: String
    
    func request(from: Endpoint, completion: @escaping CompletionHandler) {
        let response = MockingUtil.readJSON(name: filename)
        completion(response.0, response.1)
    }
}

struct MockingUtil {
    static func readJSON(name: String) -> (Data?, Error?) {
        let bundle = Bundle(for: InjectTertiaryControllerTests.self)
        guard let url = bundle.url(forResource: name, withExtension: "json") else {
            return (nil, NSError(domain: "test", code: 0, userInfo: nil)) }
        
        do {
            return try (Data(contentsOf: url, options: .mappedIfSafe), nil)
        }
        catch {
            XCTFail("Error occurred parsing test data")
            return (nil,nil)
        }
    }
}

enum DataSet: String {
    case one
    case two
    case errorData
    
    static let all: [DataSet] = [.one, .two, .errorData]
}

extension DataSet {
    var name: String { return rawValue }
    var filename: String { return "dataset-\(rawValue)" }
}
