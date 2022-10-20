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
    
    public init(@LaTeXBuilder _ upper: () -> Upper, @LaTeXBuilder choose lower: () -> Lower) {
        self.upper = upper()
        self.lower = lower()
    }
    
}
