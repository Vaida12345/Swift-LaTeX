import XCTest
import Foundation

@testable import LaTeX

let xArray: [Double] = [1, 2, 3]
let yArray: [Double] = [1, 2, 3]

let xMean = 2.0
let yMean = 2.0

final class LaTesTs: XCTestCase {
    func testExample() async throws {
        let formula = LaTeXBuilder.build {
            "123"
            
            "455"
        }
        
        print(formula)
        print(formula.latexExpression)
        print(formula.evaluated())
    }
}
