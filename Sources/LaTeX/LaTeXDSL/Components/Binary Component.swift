//
//  Binary Component.swift
//  
//
//  Created by Vaida on 10/19/22.
//


public struct BinaryComponent<LHS: LaTeXComponent, Operator: LaTeXComponent, RHS: LaTeXComponent>: LaTeXComponent {
    
    private let lhs: Group<LHS>
    
    private let `operator`: Operator
    
    private let rhs: Group<RHS>
    
    public init(lhs: LHS, operator: Operator, rhs: RHS) {
        self.lhs = Group(lhs)
        self.operator = `operator`
        self.rhs = Group(rhs)
    }
    
    public var latexExpression: String {
        lhs.latexExpression + self.operator.latexExpression + rhs.latexExpression
    }
    
    public func not() -> some LaTeXComponent {
        BinaryComponent<LHS, LaTeXModifiedContent<Operator, PrefixModifier>, RHS>(lhs: self.lhs.source, operator: self.operator.not, rhs: self.rhs.source)
    }
    
}
