//
//  Binary Component.swift
//  
//
//  Created by Vaida on 10/19/22.
//


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
    
    public func not() -> some LaTeXComponent {
        BinaryComponent<LHS, LaTeXModifiedContent<Operator, PrefixModifier>, RHS>(lhs: self.lhs, operator: self.operator.not, rhs: self.rhs)
    }
    
}
