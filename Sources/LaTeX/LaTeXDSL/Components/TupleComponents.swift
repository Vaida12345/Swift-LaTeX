//
//  Tuple Components.swift
//  
//
//  Created by Vaida on 10/19/22.
//


public struct TupleComponents<T>: LaTeXComponent {
    
    var value: T
    
    let components: [AnyComponent]
    
    public var latexExpression: String {
        self.components.map(\.latexExpression).joined(separator: " ")
    }
    
    public var pyDescription: String {
        fatalError("Attempting to generate python syntax for non mathematical expression")
    }
    
    public func evaluated() -> EvaluatedResult<Self> {
        .symbolic(self)
    }
    
    internal init(_ value: T) {
        self.value = value
        
        var initialComponents = {
            if let tuple = value as? (Any, Any) {
                return [AnyComponent(from: tuple.0)!, AnyComponent(from: tuple.1)!]
            } else if let tuple = value as? (Any, Any) {
                return [AnyComponent(from: tuple.0)!, AnyComponent(from: tuple.1)!]
            } else if let tuple = value as? (Any, Any, Any) {
                return [AnyComponent(from: tuple.0)!, AnyComponent(from: tuple.1)!, AnyComponent(from: tuple.2)!]
            } else if let tuple = value as? (Any, Any, Any, Any) {
                return [AnyComponent(from: tuple.0)!, AnyComponent(from: tuple.1)!, AnyComponent(from: tuple.2)!, AnyComponent(from: tuple.3)!]
            } else if let tuple = value as? (Any, Any, Any, Any, Any) {
                return [AnyComponent(from: tuple.0)!, AnyComponent(from: tuple.1)!, AnyComponent(from: tuple.2)!, AnyComponent(from: tuple.3)!, AnyComponent(from: tuple.4)!]
            } else if let tuple = value as? (Any, Any, Any, Any, Any, Any) {
                return [AnyComponent(from: tuple.0)!, AnyComponent(from: tuple.1)!, AnyComponent(from: tuple.2)!, AnyComponent(from: tuple.3)!, AnyComponent(from: tuple.4)!, AnyComponent(from: tuple.5)!]
            } else if let tuple = value as? (Any, Any, Any, Any, Any, Any, Any) {
                return [AnyComponent(from: tuple.0)!, AnyComponent(from: tuple.1)!, AnyComponent(from: tuple.2)!, AnyComponent(from: tuple.3)!, AnyComponent(from: tuple.4)!, AnyComponent(from: tuple.5)!, AnyComponent(from: tuple.6)!]
            } else if let tuple = value as? (Any, Any, Any, Any, Any, Any, Any, Any) {
                return [AnyComponent(from: tuple.0)!, AnyComponent(from: tuple.1)!, AnyComponent(from: tuple.2)!, AnyComponent(from: tuple.3)!, AnyComponent(from: tuple.4)!, AnyComponent(from: tuple.5)!, AnyComponent(from: tuple.6)!, AnyComponent(from: tuple.7)!]
            } else if let tuple = value as? (Any, Any, Any, Any, Any, Any, Any, Any, Any) {
                return [AnyComponent(from: tuple.0)!, AnyComponent(from: tuple.1)!, AnyComponent(from: tuple.2)!, AnyComponent(from: tuple.3)!, AnyComponent(from: tuple.4)!, AnyComponent(from: tuple.5)!, AnyComponent(from: tuple.6)!, AnyComponent(from: tuple.7)!, AnyComponent(from: tuple.8)!]
            } else if let tuple = value as? (Any, Any, Any, Any, Any, Any, Any, Any, Any, Any) {
                return [AnyComponent(from: tuple.0)!, AnyComponent(from: tuple.1)!, AnyComponent(from: tuple.2)!, AnyComponent(from: tuple.3)!, AnyComponent(from: tuple.4)!, AnyComponent(from: tuple.5)!, AnyComponent(from: tuple.6)!, AnyComponent(from: tuple.7)!, AnyComponent(from: tuple.8)!, AnyComponent(from: tuple.9)!]
            } else {
                return [AnyComponent(from: value)!]
            }
        }()
        
        var counter = 0
        while counter < initialComponents.count {
            let element = initialComponents[counter]
            
            if let tuple = element.content as? TupleComponents<Any> { // unbox any further tuples or groups.
                initialComponents.append(contentsOf: tuple.components)
            } else if let group = element.content as? Group<TupleComponents<Any>> {
                initialComponents.append(contentsOf: group.source.components)
            } else if let optional = element.content as? OptionalComponent<TupleComponents<Any>> { // unbox optional
                initialComponents.append(contentsOf: optional.wrapped?.components ?? [])
            }
            
            counter += 1
        }
        
        self.components = initialComponents
    }
    
}
