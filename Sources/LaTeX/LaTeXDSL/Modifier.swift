//
//  LaTeX Modifier.swift
//  
//
//  Created by Vaida on 10/19/22.
//


public protocol LaTeXModifier {
    
    func modify(_ component: some LaTeXComponent) -> String
    
}
