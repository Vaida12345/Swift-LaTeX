import XCTest
@testable import LaTeX

final class LaTeXTests: XCTestCase {
    func testExample() async throws {
        let formula = LaTeXArgumentMatrix {
            [
                ["a", "b"],
                ["c", "d"]
            ]
        } rhs: {
            ["C", "D".overLeftArrowed()]
        }
        
        print(formula)
        print(formula.latexExpression)
    }
}
