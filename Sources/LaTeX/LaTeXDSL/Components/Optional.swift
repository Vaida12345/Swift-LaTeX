//
//  Optional Component.swift
//  
//
//  Created by Vaida on 10/27/22.
//


public struct OptionalComponent<Wrapped: LaTeXComponent>: LaTeXComponent {
    
    internal let wrapped: Wrapped?
    
    public var latexExpression: String {
        self.wrapped?.latexExpression ?? ""
    }
    
    public func evaluated() -> EvaluatedResult<Wrapped.EvaluatedResultType> {
        if let wrapped {
            return wrapped.evaluated()
        } else {
            return .null
        }
    }
    
    public init(wrapped: Wrapped?) {
        self.wrapped = wrapped
    }
    
}
