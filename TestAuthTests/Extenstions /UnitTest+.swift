//
//  UnitTest+.swift
//  TestAuthTests
//
//  Created by Ahmed Elesawy on 15/08/2021.
//

import Foundation
import XCTest
@testable import TestAuth
// ref https://www.swiftbysundell.com/articles/testing-error-code-paths-in-swift/
extension XCTestCase {
    func assert<T>(_ result: Result<T>?,
                   containsError expectedError: Error,
                   in file: StaticString = #file,
                   line: UInt = #line) {
        switch result {
        case .success?:
            XCTFail("No error thrown", file: file, line: line)
        case .failure(let error)?:
            XCTAssertEqual(
                error.localizedDescription,
                expectedError.localizedDescription,
                file: file, line: line)
        case nil:
            XCTFail("Result was nil", file: file, line: line)
        }
    }
    func assert<T>(response: Result<T>?,
                   in file: StaticString = #file,
                   line: UInt = #line) {
        switch response {
        case .success(let val):
            XCTAssertNotNil(val, "ddd")
        case .failure(_):
            XCTFail("No error thrown", file: file, line: line)
        case nil:
            XCTFail("Result was nil", file: file, line: line)
        }
    }
}
