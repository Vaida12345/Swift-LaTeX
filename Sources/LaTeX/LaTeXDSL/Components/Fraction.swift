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
    
    public init(_ numerator: Numerator, _ denominator: Denominator) {
        self.numerator = numerator
        self.denominator = denominator
    }
    
    public init(@LaTeXBuilder numerator: () -> Numerator, @LaTeXBuilder denominator: () -> Denominator) {
        self.numerator = numerator()
        self.denominator = denominator()
    }
    
}
