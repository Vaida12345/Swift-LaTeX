import XCTest
@testable import LaTeX

final class LaTesTs: XCTestCase {
    func testExample() async throws {
        let formula = LaTeXBuilder.build {
            Sum("x", from: 1, to: 10) { x in
                x
                    .colored(.blue)
                    .squared()
            }
        }
        
        print(formula)
        print(formula.latexExpression)
        print(formula.evaluated())
    }
}
