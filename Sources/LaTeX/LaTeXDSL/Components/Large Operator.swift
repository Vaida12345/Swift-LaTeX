//
//  Large Operator.swift
//  
//
//  Created by Vaida on 10/19/22.
//


public struct LargeOperator<LowerBound: LaTeXComponent, UpperBound: LaTeXComponent, Body: LaTeXComponent>: LaTeXComponent {
    
    private let `operator`: LargeOperatorOperator
    
    private let lowerBound: Group<LowerBound>?
    
    private let upperBound: Group<UpperBound>?
    
    private let body: Group<Body>
    
    public var latexExpression: String {
        "\\\(self.operator.rawValue)_\(self.lowerBound?.latexExpression ?? "")^\(self.upperBound?.latexExpression ?? "") \(self.body.latexExpression)"
    }
    
    public init(_ operator: LargeOperatorOperator, lowerBound: LowerBound, upperBound: UpperBound, body: Body) {
        self.operator = `operator`
        self.lowerBound = Group(lowerBound)
        self.upperBound = Group(upperBound)
        self.body = Group(body)
    }
    
    public init(_ operator: LargeOperatorOperator, lowerBound: LowerBound, body: Body) where UpperBound == EmptyComponent {
        self.operator = `operator`
        self.lowerBound = Group(lowerBound)
        self.upperBound = nil
        self.body = Group(body)
    }
    
    public init(_ operator: LargeOperatorOperator, body: Body) where UpperBound == EmptyComponent, LowerBound == EmptyComponent {
        self.operator = `operator`
        self.lowerBound = nil
        self.upperBound = nil
        self.body = Group(body)
    }
    
    public init<Variable: LaTeXComponent, T: LaTeXComponent>(_ operator: LargeOperatorOperator, _ variable: Variable, from lowerBound: T, to upperBound: UpperBound, body: (_ variable: Variable) -> Body) where LowerBound == BinaryComponent<Variable, LaTeXSymbol, T> {
        self.init(`operator`, lowerBound: BinaryComponent(lhs: variable, operator: equal, rhs: lowerBound), upperBound: upperBound, body: body(variable))
    }
    
}

public enum LargeOperatorOperator: String {
    case sum
    case prod
    case coprod
    case int
    
    case bigcup
    case bigcap
    case bigsqcup
    case oint
    
    case bigvee
    case bigwedge
    
    case bigoplus
    case bigotimes
    case bigodot
    case biguplus
}
