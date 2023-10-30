//
//  Choose.swift
//  
//
//  Created by Vaida on 10/21/22.
//


public struct Choose<Upper: LaTeXComponent, Lower: LaTeXComponent>: LaTeXComponent {
    
    private let upper: Upper
    
    private let lower: Lower
    
    public var latexExpression: String {
        "{\(upper) \\choose \(lower)}"
    }
    
    public var pyDescription: String {
        fatalError("Attempting to generate python syntax for non mathematical expression")
    }
    
    public func evaluated() -> EvaluatedResult<Self> {
        guard let uppeR = upper.evaluated().numericValue,
              let loweR = lower.evaluated().numericValue else { return .symbolic(self) }
        
        let upper = Int(uppeR)
        let lower = Int(loweR)
        
        guard let numerator = upper.factorial(),
              let denominatorLeft = lower.factorial(),
              let denominatorRight = (upper - lower).factorial() else { return .symbolic(self) }
        
        return .numeric(Double(numerator / denominatorLeft / denominatorRight))
    }
    
    public init(@LaTeXBuilder _ upper: () -> Upper, @LaTeXBuilder choose lower: () -> Lower) {
        self.upper = upper()
        self.lower = lower()
    }
    
}


internal extension Int {
    
    func factorial() -> Int? {
        var cumulative = 1
        
        for i in 1...self {
            if cumulative.multipliedReportingOverflow(by: i).overflow {
                return nil
            } else {
                cumulative *= i
            }
        }
        
        return cumulative
    }
    
}
