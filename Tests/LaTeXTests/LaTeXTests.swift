import XCTest
@testable import LaTeX

import SwiftUI

final class LaTeXTests: XCTestCase {
    func testExample() async throws {
        let symbol = LaTeXSymbols.Greek.delta
            .accent(.bar)
        print(symbol)
        print(symbol.latexExpression)
    }
}
