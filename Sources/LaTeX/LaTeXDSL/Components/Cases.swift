//
//  Cases.swift
//  
//
//  Created by Vaida on 10/20/22.
//


public struct Cases: LaTeXComponent {
    
    var content: [Body]
    
    public var latexExpression: String {
        "\\begin{cases}\(content.map(\.latexExpression).joined(separator: " \\\\ "))\\end{cases}"
    }
    
    public struct Body: LaTeXComponent {
        
        var contents: [any LaTeXComponent]
        
        public var latexExpression: String {
            contents.map(\.latexExpression).joined(separator: " ")
        }
        
        public init(@LaTeXBuilder contents: () -> some LaTeXComponent) {
            self.contents = [contents()]
        }
        
        public static func caseIf(@LaTeXBuilder contents: () -> some LaTeXComponent, @LaTeXBuilder condition: () -> some LaTeXComponent) -> Body {
            Body {
                contents()
                "&"
                condition()
            }
        }
    }
    
    init(content: () -> [Body]) {
        self.content = content()
    }
    
}
