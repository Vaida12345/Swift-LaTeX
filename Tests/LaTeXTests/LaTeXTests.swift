import XCTest
@testable import LaTeX

final class LaTeXTests: XCTestCase {
    func testExample() async throws {
        let variable = Greek.delta
        
        let formula = sqrt(Fraction {
            LargeOperator(.sum, variable, from: Greek.gamma, to: Greek.varepsilon) { variable in
                variable + variable
            }
        } denominator: {
            (Arrow.LeftArrow -- Arrow.rightArrow) ^ Arrow.DownArrow
        })
        
        print(formula)
        print(formula.latexExpression)
        
        print(Text("123").font(.bold).latexExpression)
    }
}
