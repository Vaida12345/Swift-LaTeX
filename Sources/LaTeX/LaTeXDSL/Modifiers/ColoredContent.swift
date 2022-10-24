//
//  Colored Content.swift
//  
//
//  Created by Vaida on 10/20/22.
//


import SwiftUI


private struct ColoredContent<Content: LaTeXComponent>: LaTeXComponent {
    
    private let color: String
    private let content: Content
    
    var latexExpression: String {
        "\\color{\(self.color)} \(content.latexExpression)"
    }
    
    func evaluated() -> EvaluatedResult<Content.EvaluatedResultType> {
        self.content.evaluated()
    }
    
    init(color: Color, content: Content) {
        self.color = color.hexDescription
        self.content = content
    }
    
    init(name: String, content: Content) {
        self.color = name
        self.content = content
    }
    
}


public extension LaTeXComponent {
    
    func colored(_ color: Color) -> some LaTeXComponent {
        Group(ColoredContent(color: color, content: self))
    }
    
    func colored(name: String) -> some LaTeXComponent {
        Group(ColoredContent(name: name, content: self))
    }
    
}
