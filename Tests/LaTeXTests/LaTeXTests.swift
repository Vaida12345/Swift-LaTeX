import XCTest
@testable import LaTeX

import SwiftUI

final class LaTeXTests: XCTestCase {
    func testExample() async throws {
        let variable = Greek.delta
        
        let formula = LargeOperator(.sum, variable, from: Greek.gamma, to: Greek.varepsilon) { variable in
            variable + variable
        }
        
        print(formula)
        print(formula.latexExpression)
    }
}
