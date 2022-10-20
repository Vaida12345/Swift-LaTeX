//
//  Sqrt.swift
//  
//
//  Created by Vaida on 10/19/22.
//


private struct Sqrt<Source: LaTeXComponent>: LaTeXComponent {
    
    private let showLine: Bool
    private let power: Int
    private let source: Group<Source>
    
    private init(power: Int, showLine: Bool, _ source: Group<Source>) {
        self.power = power
        self.showLine = showLine
        self.source = source
    }
    
    internal init(power: Int, _ source: Source) {
        self.init(power: power, showLine: true, Group(source))
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
    
    func showLine(_ bool: Bool) -> Sqrt<Source> {
        Sqrt(power: self.power, showLine: bool, self.source)
    }
    
}


public func sqrt(_ x: some LaTeXComponent, power: Int = 2) -> some LaTeXComponent {
    Sqrt(power: power, x)
}
