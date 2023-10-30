//
//  Sqrt.swift
//  
//
//  Created by Vaida on 10/19/22.
//


import Foundation


private struct Sqrt<Source: LaTeXComponent>: LaTeXComponent {
    
    private let showLine: Bool
    private let power: Double
    private let source: Group<Source>
    
    private init(power: Double, showLine: Bool, _ source: Group<Source>) {
        self.power = power
        self.showLine = showLine
        self.source = source
    }
    
    internal init(power: Double, _ source: Source) {
        self.init(power: power, showLine: true, Group(source, shouldIncludeCurlyBrackets: true))
    }
    
    var latexExpression: String {
        if !showLine {
            return "\\surd\(self.source.latexExpression)"
        } else if power == 2 {
            return "\\sqrt\(self.source.latexExpression)"
        } else {
            return "\\sqrt[\(power.latexExpression)]\(self.source.latexExpression)"
        }
    }
    
    var pyDescription: String {
        if power == 2 {
            return "math.sqrt(\(self.source.latexExpression))"
        } else {
            return "(\(self.source.latexExpression) ** (1/\(power.latexExpression)))"
        }
    }
    
    func evaluated() -> EvaluatedResult<Self> {
        guard let source = self.source.evaluated().numericValue else { return .symbolic(self) }
        
        if power == 2 {
            return .numeric(Darwin.sqrt(source))
        } else {
            return .numeric(pow(source, 1 / power))
        }
    }
    
    func showLine(_ bool: Bool) -> Sqrt<Source> {
        Sqrt(power: self.power, showLine: bool, self.source)
    }
    
}


public func sqrt(_ x: some LaTeXComponent, power: Double = 2) -> some LaTeXComponent {
    Sqrt(power: power, x)
}

public extension LaTeXComponent {
    
    func sqrt(power: Double = 2) -> some LaTeXComponent {
        Sqrt(power: power, self)
    }
    
}
