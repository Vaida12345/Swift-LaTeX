import XCTest
import Foundation

@testable import LaTeX

final class LaTesTs: XCTestCase {
    func testExample() async throws {
        let formula = LaTeXBuilder.build {
            VerticalComponent {
                "123"

                if true {
                    "789"

                    "101"
                }
            }
        }

        print(formula.latexExpression)
        print(formula.evaluated())
        dump(formula)
    }
}
