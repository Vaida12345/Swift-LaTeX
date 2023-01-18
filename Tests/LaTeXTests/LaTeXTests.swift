import XCTest
import Foundation

@testable import LaTeX

final class LaTesTs: XCTestCase {
    func testExample() async throws {
        print(Integral("t", from: "-\\infty", to: "x", body: { variable in
            "f(t)"
        }).latexExpression)
    }
}
