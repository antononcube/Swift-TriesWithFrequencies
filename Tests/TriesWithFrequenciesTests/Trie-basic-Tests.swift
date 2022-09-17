import XCTest
@testable import TriesWithFrequencies

final class TrieBasicTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let res = Trie()
        
        let res2 = res.make(chars: "apples".map({ String($0) }))
        print(res2.toJSON())
    }
}
