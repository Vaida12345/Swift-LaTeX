import XCTest
@testable import LaTeX

final class LaTeXTests: XCTestCase {
    func testExample() async throws {
        let formula = LaTeXBuilder.build {
            Equals {
                Subtraction {
                    Multiplication {
                        nabla
                    } by: {
                        LaTeXT("B").font(.mathbf).overRightArrowed()
                    }
                } by: {
                    Fraction(1, "C")
                }
                
                Fraction {
                    delta
                    LaTeXT("E").font(.mathbf).overRightArrowed()
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
