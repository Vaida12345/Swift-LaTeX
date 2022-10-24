//
//  Binary Component.swift
//  
//
//  Created by Vaida on 10/19/22.
//


import Foundation


public struct BinaryComponent<LHS: LaTeXComponent, Operator: LaTeXComponent, RHS: LaTeXComponent>: LaTeXComponent {
    
    private let lhs: LHS
    
    private let `operator`: Operator
    
    private let rhs: RHS
    
    internal init(lhs: LHS, operator: Operator, rhs: RHS) {
        self.lhs = lhs
        self.operator = `operator`
        self.rhs = rhs
    }
    
    public var latexExpression: String {
        lhs.latexExpression + self.operator.latexExpression + rhs.latexExpression
    }
    
    public func evaluated() -> EvaluatedResult<Self> {
        guard let lhs = lhs.evaluated().numericValue,
              let rhs = rhs.evaluated().numericValue else { return .symbolic(self) }
        
        switch self.operator.latexExpression {
        case "+":
            return .numeric(lhs + rhs)
        case "-":
            return .numeric(lhs - rhs)
        case "*", "\\times", "\\cdot":
            return .numeric(lhs * rhs)
        case "/", "\\div":
            return .numeric(lhs / rhs)
        case "^":
            return .numeric(pow(lhs, rhs))
        default:
            return .symbolic(self)
        }
    }
    
    public func not() -> some LaTeXComponent {
        BinaryComponent<LHS, LaTeXModifiedContent<Operator, PrefixModifier>, RHS>(lhs: self.lhs, operator: self.operator.not, rhs: self.rhs)
    }
    
}
