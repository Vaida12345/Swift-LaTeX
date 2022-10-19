import XCTest
@testable import LaTeX

import SwiftUI

final class LaTeXTests: XCTestCase {
    func testExample() async throws {
        let lhs = LaTeXSymbols.Greek.delta
            .accent(.bar)
        
        let rhs = LaTeXSymbols.BinaryRelation.in
            .accent(.bar)
        
        let combined = lhs + rhs
        
        print(combined)
        print(combined.latexExpression)
    }
}
