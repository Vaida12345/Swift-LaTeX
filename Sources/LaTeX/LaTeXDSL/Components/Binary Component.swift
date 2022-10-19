//
//  Binary Component.swift
//  
//
//  Created by Vaida on 10/19/22.
//


struct BinaryComponent: LaTeXComponent {
    
    let lhs: LaTeXComponent
    
    let `operator`: LaTeXComponent
    
    let rhs: LaTeXComponent
    
    var latexExpression: String {
        lhs.latexExpression + self.operator.latexExpression + rhs.latexExpression
    }
    
}
