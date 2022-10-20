import XCTest
@testable import LaTeX

final class LaTesTs: XCTestCase {
    func testExample() async throws {
        let formula = Integral("x", from: "-N", to: "N") { variable in
            Power {
                log(3)
            } with: {
                variable
            }
        }
        
        print(formula)
        print(formula.latexExpression)
    }
}
