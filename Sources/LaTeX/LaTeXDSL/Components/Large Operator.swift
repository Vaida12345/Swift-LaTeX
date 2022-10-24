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
    
    public func evaluated() -> EvaluatedResult<Self> {
        .symbolic(self)
    }
    
    public init(_ operator: LargeOperatorOperator, lowerBound: LowerBound, upperBound: UpperBound, body: Body) {
        self.operator = `operator`
        self.lowerBound = Group(lowerBound, shouldIncludeCurlyBrackets: true)
        self.upperBound = Group(upperBound, shouldIncludeCurlyBrackets: true)
        self.body = Group(body, shouldIncludeCurlyBrackets: true)
    }
    
    public init(_ operator: LargeOperatorOperator, lowerBound: LowerBound, body: Body) where UpperBound == Never {
        self.operator = `operator`
        self.lowerBound = Group(lowerBound, shouldIncludeCurlyBrackets: true)
        self.upperBound = nil
        self.body = Group(body, shouldIncludeCurlyBrackets: true)
    }
    
    public init(_ operator: LargeOperatorOperator, body: Body) where UpperBound == Never, LowerBound == Never {
        self.operator = `operator`
        self.lowerBound = nil
        self.upperBound = nil
        self.body = Group(body, shouldIncludeCurlyBrackets: true)
    }
    
    public init<Variable: LaTeXComponent, T: LaTeXComponent>(_ operator: LargeOperatorOperator, _ variable: Variable, from lowerBound: T, to upperBound: UpperBound, @LaTeXBuilder body: (_ variable: Variable) -> Body) where LowerBound == BinaryComponent<Variable, LaTeXSymbol, T> {
        self.init(`operator`, lowerBound: BinaryComponent(lhs: variable, operator: equal, rhs: lowerBound), upperBound: upperBound, body: body(variable))
    }
    
}


private struct RangedLargeOperator<Variable: LaTeXComponent, LowerBound: LaTeXComponent, UpperBound: LaTeXComponent, Body: LaTeXComponent>: LaTeXComponent {
    
    private let `operator`: LargeOperatorOperator
    
    private let variable: Variable
    
    private let lowerBound: LowerBound
    
    private let upperBound: Group<UpperBound>
    
    private let body: (_ variable: Double) -> Body
    
    var latexExpression: String {
        "\\\(self.operator.rawValue)_{\(self.variable.latexExpression) = \(self.lowerBound.latexExpression)}^\(self.upperBound.latexExpression) \(Group(self.body(Double.leastNonzeroMagnitude), shouldIncludeCurlyBrackets: true).latexExpression)".replacingOccurrences(of: Double.leastNonzeroMagnitude.description, with: variable.latexExpression)
    }
    
    func evaluated() -> EvaluatedResult<Self> {
        guard let lowerBound = self.lowerBound.evaluated().numericValue,
              let upperBound = self.upperBound.evaluated().numericValue else { return .symbolic(self) }
        
        var cumulative: Double = self.operator == .sum ? 0 : 1
        
        for i in Int(lowerBound)...Int(upperBound) {
            guard let partialValue = body(Double(i)).evaluated().numericValue else { return .symbolic(self) }
            
            if self.operator == .sum {
                cumulative += partialValue
            } else {
                cumulative *= partialValue
            }
        }
        
        return .numeric(cumulative)
    }
    
    init(_ operator: LargeOperatorOperator, _ variable: Variable, from lowerBound: LowerBound, to upperBound: UpperBound, @LaTeXBuilder body: @escaping (_ variable: Double) -> Body) {
        precondition(`operator` == .sum || `operator` == .prod)
        
        self.operator = `operator`
        self.variable = variable
        self.lowerBound = lowerBound
        self.upperBound = Group(upperBound, shouldIncludeCurlyBrackets: true)
        self.body = body
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


/// The sum.
///
/// - Note: For more operations, use ``LargeOperator``.
public func Sum<Variable: LaTeXComponent>(_ variable: Variable, from lowerBound: some LaTeXComponent, to upperBound: some LaTeXComponent, @LaTeXBuilder body: @escaping (_ variable: Double) -> some LaTeXComponent) -> some LaTeXComponent {
    RangedLargeOperator(.sum, variable, from: lowerBound, to: upperBound, body: body)
}

/// The prod.
///
/// - Note: For more operations, use ``LargeOperator``.
public func Product<Variable: LaTeXComponent>(_ variable: Variable, from lowerBound: some LaTeXComponent, to upperBound: some LaTeXComponent, @LaTeXBuilder body: @escaping (_ variable: Double) -> some LaTeXComponent) -> some LaTeXComponent {
    RangedLargeOperator(.prod, variable, from: lowerBound, to: upperBound, body: body)
}

/// The int.
///
/// - Note: For more operations, use ``LargeOperator``.
public func Integral<Variable: LaTeXComponent>(_ variable: Variable, from lowerBound: some LaTeXComponent, to upperBound: some LaTeXComponent, @LaTeXBuilder body: (_ variable: Variable) -> some LaTeXComponent) -> some LaTeXComponent {
    LargeOperator(.int, lowerBound: lowerBound, upperBound: upperBound, body: {
        LaTeXBuilder.build {
            body(variable)
            "\\, \\mathrm{d}\(variable.latexExpression)"
        }
    }())
}
