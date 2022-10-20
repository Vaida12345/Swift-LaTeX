//
//  Cases.swift
//  
//
//  Created by Vaida on 10/20/22.
//


public struct Cases: LaTeXComponent {
    
    var content: [Body<Any>]
    
    public var latexExpression: String {
        "\\begin{cases}\(content.map(\.latexExpression).joined(separator: "\\\\"))\\end{cases}"
    }
    
    public struct Body<T>: LaTeXComponent {
        
        var contents: TupleComponents<T>
        
        public var latexExpression: String {
            contents.latexExpression
        }
        
        public init(@LaTeXBuilder contents: () -> TupleComponents<T>) {
            self.contents = contents()
        }
        
        public static func caseIf<T, W>(@LaTeXBuilder contents: () -> TupleComponents<T>, @LaTeXBuilder if condition: () -> TupleComponents<W>) -> Body<(TupleComponents<T>, String, TupleComponents<W>)> {
            .init {
                contents()
                " & "
                condition()
            }
        }
    }
    
    init(content: () -> [Body<Any>]) {
        self.content = content()
    }
    
}
