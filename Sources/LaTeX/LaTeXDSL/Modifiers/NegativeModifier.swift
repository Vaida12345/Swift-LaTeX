//
//  File.swift
//  
//
//  Created by Vaida on 10/21/22.
//


struct NegativeModifier: LaTeXModifier {
    
    public func modify(_ component: some LaTeXComponent) -> String {
        "-" + component.latexExpression
    }
    
}


public extension LaTeXComponent {
    
    static prefix func -(x: Self) -> some LaTeXComponent {
        x.modifier(NegativeModifier())
    }
    
}
