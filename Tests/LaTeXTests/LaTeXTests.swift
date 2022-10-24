import XCTest
@testable import LaTeX

final class LaTesTs: XCTestCase {
    func testExample() async throws {
        let formula = LaTeXBuilder.build {
            Fraction(1, 2)
                .stackrel(1)
        }
        
        print(formula)
        print(formula.latexExpression)
        print(formula.evaluated())
    }
}
