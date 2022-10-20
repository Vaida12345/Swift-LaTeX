import XCTest
@testable import LaTeX

final class LaTeXTests: XCTestCase {
    func testExample() async throws {
        let formula = LaTeXBuilder.build {
            Equals {
                Subscript {
                    "R"
                } with: {
                    theta
                }
            } with: {
                LaTeXMatrix {
                    [
                        [cos(theta), -sin(theta)],
                        [sin(theta),  cos(theta)]
                    ]
                }
            }
        }
        
        print(formula)
        print(formula.latexExpression)
    }
}
