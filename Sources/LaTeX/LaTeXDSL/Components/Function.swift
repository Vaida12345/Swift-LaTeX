//
//  Function.swift
//  
//
//  Created by Vaida on 10/19/22.
//


/// A structure corresponds to a set of functions in LaTeX.
///
/// - Important: Do not create instances of this structure, use pre-defined ones instead.
public struct Function<Source: LaTeXComponent>: LaTeXComponent {
    
    private let name: String
    private let index: LaTeXComponent?
    private let source: Group<Source>
    
    private init(_ name: String, index: LaTeXComponent? = nil, source: Group<Source>) {
        self.name = name
        self.index = index
        self.source = source
    }
    
    fileprivate init(_ name: String, index: LaTeXComponent? = nil, source: Source) {
        self.init(name, index: index, source: Group(source))
    }
    
    public func includeBrackets(_ bool: Bool) -> Function<Source> {
        Function(self.name, index: self.index, source: self.source.includeBrackets(bool))
    }
    
    public var latexExpression: String {
        if let index {
            return "\\\(name)_\(index)\(self.source.latexExpression)"
        } else {
            return "\\\(name)\(self.source.latexExpression)"
        }
    }
    
}


/// The `arccos` function.
///
/// - Experiment: Maps to `$arccos x$` in LaTeX.
public func arccos(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("arccos", source: x) }

public func arcsin(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("arcsin", source: x) }

public func arctan(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("arctan", source: x) }

public func arg(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("arg", source: x) }

public func sinh(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("sinh", source: x) }

public func cos(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("cos", source: x) }

public func cosh(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("cosh", source: x) }

public func cot(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("cot", source: x) }

public func coth(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("coth", source: x) }

public func sup(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("sup", source: x) }

public func csc(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("csc", source: x) }

public func deg(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("deg", source: x) }

public func det(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("det", source: x) }

public func dim(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("dim", source: x) }

public func tan(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("tan", source: x) }

public func exp(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("exp", source: x) }

public func gcd(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("gcd", source: x) }

public func hom(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("hom", source: x) }

public func inf(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("inf", source: x) }

public func tanh(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("tanh", source: x) }

public func ker(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("ker", source: x) }

public func lg(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("lg", source: x) }

public func liminf(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("liminf", source: x) }

public func limsup(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("limsup", source: x) }

public func log(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("log", source: x) }

public func log(index: some LaTeXComponent, _ x: some LaTeXComponent) -> some LaTeXComponent { Function("log", index: index, source: x) }

public func ln(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("ln", source: x) }

public func max(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("max", source: x) }

public func min(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("min", source: x) }

public func Pr(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("Pr", source: x) }

public func sec(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("sec", source: x) }

public func sin(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("sin", source: x) }

