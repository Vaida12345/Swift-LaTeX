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
            Fraction {
                1
            } denominator: {
                Multiplication {
                    Group {
                        xArray.map { pow($0 - xMean, 2) }.reduce(0, +)
                    }
                } by: {
                    Group {
                        yArray.map { pow($0 - yMean, 2) }.reduce(0, +)
                    }
                }
                .sqrt()
                
            }
        }
        
        print(formula)
        print(formula.latexExpression)
        print(formula.evaluated())
    }
}
