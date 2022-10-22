import XCTest
@testable import LaTeX

final class LaTesTs: XCTestCase {
    func testExample() async throws {
        let formula = LaTeXBuilder.build {
            Equals {
                Subtraction {
                    Multiplication {
                        nabla
                    } by: {
                        "B".font(.mathbf).overRightArrowed()
                    }
                } by: {
                    Fraction(1, "C")
                        .colored(.blue)
                }
                
                Fraction {
                    delta
                    "E".font(.mathbf).overRightArrowed()
                } denominator: {
                    delta
                    "t"
                }
            } with: {
                4
                pi
                rho
            }
        }
        
        print(formula)
        print(formula.latexExpression)
    }
}
