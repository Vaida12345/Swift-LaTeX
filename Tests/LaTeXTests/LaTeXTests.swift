import XCTest
@testable import LaTeX

final class LaTeXTests: XCTestCase {
    func testExample() async throws {
        let formula = LaTeXBuilder.build {
            MiscSymbols.forAll
            "x"
            BinaryRelation.in
            LaTeXT("R")
                .font(.mathbf)
            ":"
            Spacer.qquad
            "x" ^ 2
            >=
            arccos(0)
            
        }
        
        print(formula)
        print(formula.latexExpression)
    }
}
