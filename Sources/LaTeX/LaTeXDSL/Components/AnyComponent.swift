//
//  Any Component.swift
//  
//
//  Created by Vaida on 10/26/22.
//


public struct AnyComponent: LaTeXComponent {
    
    internal let content: any LaTeXComponent
    
    public var latexExpression: String {
        content.latexExpression
    }
    
    public var pyDescription: String {
        content.pyDescription
    }
    
    public func evaluated() -> EvaluatedResult<Self> {
        .symbolic(self)
    }
    
    public init(_ content: some LaTeXComponent) {
        self.content = content
    }
    
    init?(from box: Any) {
        guard let box = box as? any LaTeXComponent else { return nil }
        self.content = box
    }
    
}
