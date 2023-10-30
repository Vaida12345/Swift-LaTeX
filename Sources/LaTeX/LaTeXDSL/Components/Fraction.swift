//
//  Fraction.swift
//  
//
//  Created by Vaida on 10/19/22.
//


public struct Fraction<Numerator: LaTeXComponent, Denominator: LaTeXComponent>: LaTeXComponent {
    
    private let numerator: Numerator
    
    private let denominator: Denominator
    
    public var latexExpression: String {
        "\\frac{\(self.numerator.latexExpression)}{\(self.denominator.latexExpression)}"
    }
    
    public var pyDescription: String {
        "\(self.numerator.pyDescription) / \(self.denominator.pyDescription)"
    }
    
    public func evaluated() -> EvaluatedResult<Self> {
        guard let numerator = numerator.evaluated().numericValue,
              let denominator = denominator.evaluated().numericValue else { return .symbolic(self) }
        
        return .numeric(numerator / denominator)
    }
    
    public init(_ numerator: Numerator, _ denominator: Denominator) {
        self.numerator = numerator
        self.denominator = denominator
    }
    
    public init(@LaTeXBuilder numerator: () -> Numerator, @LaTeXBuilder denominator: () -> Denominator) {
        self.numerator = numerator()
        self.denominator = denominator()
    }
    
}


public extension LaTeXComponent {
    
    func over(_ value: some LaTeXComponent) -> some LaTeXComponent {
        Fraction(self, value)
    }
    
    func over(@LaTeXBuilder _ value: () -> some LaTeXComponent) -> some LaTeXComponent {
        Fraction(self, value())
    }
    
}
