import XCTest
@testable import LaTeX

final class LaTeXTests: XCTestCase {
    func testExample() async throws {
        let formula = LaTeXBuilder.build {
            Greek.varepsilon * sqrt(Limit("x", to: MiscSymbols.infinity, body: { variable in
                variable ^ 2
            }))
            
            BinaryRelation.equal
                .not()
                .stackrel("?")
            
            0
        }
        
        print(formula)
        print(formula.latexExpression)
    }
}
