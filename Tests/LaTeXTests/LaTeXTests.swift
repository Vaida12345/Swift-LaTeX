import XCTest
@testable import LaTeX

final class LaTeXTests: XCTestCase {
    func testExample() async throws {
        let formula = LaTeXBuilder.build {
            nabla * LaTeXT("B").font(.mathbf).overRightArrowed()
            -
            Fraction(1, "C")
            Fraction {
                delta
                LaTeXT("E").font(.mathbf).overRightArrowed()
            } denominator: {
                delta
                "t"
            }
            ==
            4
            pi
            rho
        }
        
        print(formula)
        print(formula.latexExpression)
    }
}
