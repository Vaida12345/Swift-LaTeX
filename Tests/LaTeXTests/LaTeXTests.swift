import XCTest
@testable import LaTeX

final class LaTesTs: XCTestCase {
    func testExample() async throws {
        let formula = LaTeXBuilder.build {
            Derivative {
                pi
            } against: {
                "x"
            }
            .compact()
            .partial()

        }
        
        print(formula)
        print(formula.latexExpression)
    }
}
