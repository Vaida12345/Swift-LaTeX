import XCTest
@testable import LaTeX

final class LaTesTs: XCTestCase {
    func testExample() async throws {
        let formula = LaTeXBuilder.build {
            "a+b+c+\\cdots+d"
                .underBraced("n")
                .font(.mathcal)
        }
        
        print(formula)
        print(formula.latexExpression)
    }
}
