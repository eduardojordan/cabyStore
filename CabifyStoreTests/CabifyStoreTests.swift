//
//  CabifyStoreTests.swift
//  CabifyStoreTests
//
//  Created by Eduardo Jordan on 16/3/21.
//

import XCTest
@testable import CabifyStore
class CabifyStoreTests: XCTestCase {


    func testParseJsonFile() throws {
        guard let pathString = Bundle(for: type(of: self)).path(forResource: "cabifyStore", ofType: "json") else {
            fatalError("json not found")
        }
        guard let json = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            fatalError("Unable to convert jsont to String")
        }
        let jsonData = json.data(using: .utf8)!
        let item = try! JSONDecoder().decode(Products.self, from: jsonData)

        XCTAssertEqual("Cabify T-Shirt", item.products[1].name)
       
    }
}
