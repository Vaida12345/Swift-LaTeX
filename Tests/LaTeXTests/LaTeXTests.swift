import XCTest
@testable import LaTeX

final class LaTeXTests: XCTestCase {
    func testExample() async throws {
        let formula = LaTeXBuilder.build {
            "E"
            
            BinaryRelation.equal
            
            "M"
            *
            ("c".colored(.red) ^ 2)
        }
        
        print(formula)
        print(formula.latexExpression)
    }
}
