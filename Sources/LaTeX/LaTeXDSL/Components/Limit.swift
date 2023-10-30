//
//  Limit.swift
//  
//
//  Created by Vaida on 10/19/22.
//


public struct Limit<Variable: LaTeXComponent, Bound: LaTeXComponent, Body: LaTeXComponent>: LaTeXComponent {
    
    private let lowerBound: Group<BinaryComponent<Variable, LaTeXSymbol, Bound>>
    
    private let body: Body
    
    public var latexExpression: String {
        "\\lim_\(lowerBound.latexExpression) \(body.latexExpression)"
    }
    
    public var pyDescription: String {
        fatalError("Attempting to generate python syntax for non mathematical expression")
    }
    
    public func evaluated() -> EvaluatedResult<Self> {
        .symbolic(self)
    }
    
    public init(_ variable: Variable, to limit: Bound, body: (_ variable: Variable) -> Body) {
        self.lowerBound = Group {
            BinaryComponent(lhs: variable, operator: rightArrow, rhs: limit)
        }
        self.body = body(variable)
    }
    
}
