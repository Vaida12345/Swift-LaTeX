//
//  Function.swift
//  
//
//  Created by Vaida on 10/19/22.
//


import Foundation


/// A structure corresponds to a set of functions in LaTeX.
///
/// - Important: Do not create instances of this structure, use pre-defined ones instead.
public struct Function<Source: LaTeXComponent>: LaTeXComponent {
    
    private let name: String
    private let index: (any LaTeXComponent)?
    private let source: Group<Source>
    
    private init(_ name: String, index: (any LaTeXComponent)? = nil, source: Group<Source>) {
        self.name = name
        self.index = index
        self.source = source
    }
    
    fileprivate init(_ name: String, index: (any LaTeXComponent)? = nil, source: Source) {
        self.init(name, index: index, source: Group(source))
    }
    
    /// Wrap the function body with round brackets `()` if `shouldInclude`.
    ///
    /// ```swift
    /// sin("x")
    /// // LaTeX: $\sin x$
    /// ```
    /// ```swift
    /// sin("x")
    ///     .includeBrackets(true)
    /// // LaTeX: $\sin(x)$
    /// ```
    ///
    /// - Parameters:
    ///   - shouldInclude: A bool determining whether a round brackets `()` should be included.
    public func includeBrackets(_ shouldInclude: Bool) -> Function {
        Function(self.name, index: self.index, source: self.source.includeBrackets(shouldInclude))
    }
    
    public var latexExpression: String {
        if let index {
            return "\\\(name)_\(index.latexExpression)\(self.source.latexExpression)"
        } else {
            return "\\\(name)\(self.source.latexExpression)"
        }
    }
    
    public func evaluated() -> EvaluatedResult<Self> {
        guard let source = self.source.evaluated().numericValue else { return .symbolic(self) }
        
        if name == "log", let index = index?.latexExpression, let value = Double(index) {
            return .numeric(log(source) / log(value))
        } else if name == "log" && index == nil {
            return .numeric(log(source))
        } else if name == "log" {
            return .symbolic(self)
        }
        
        switch name {
        case "arccos":
            return .numeric(acos(source))
        case "arcsin":
            return .numeric(asin(source))
        case "arctan":
            return .numeric(atan(source))
        case "sinh":
            return .numeric(sinh(source))
        case "cos":
            return .numeric(cos(source))
        case "cosh":
            return .numeric(cosh(source))
        case "cot":
            return .numeric(1 / tan(source))
        case "coth":
            return .numeric(cosh(source) / sinh(source))
        case "csc":
            return .numeric(1 / sin(source))
        case "tan":
            return .numeric(tan(source))
        case "exp":
            return .numeric(exp(source))
        case "tanh":
            return .numeric(tanh(source))
        case "lg":
            return .numeric(log10(source))
        case "ln":
            return .numeric(log(source))
        case "sin":
            return .numeric(sin(source))
        default:
            return .symbolic(self)
        }
    }
    
}


/// The `arccos` function.
///
/// - Experiment: Maps to `$\arccos x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func arccos(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("arccos", source: x) }

/// The `arcsin` function.
///
/// - Experiment: Maps to `$\arcsin x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func arcsin(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("arcsin", source: x) }

/// The `arctan` function.
///
/// - Experiment: Maps to `$\arctan x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func arctan(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("arctan", source: x) }

/// The `arg` function.
///
/// - Experiment: Maps to `$\arg x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func arg(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("arg", source: x) }

/// The `sinh` function.
///
/// - Experiment: Maps to `$\sinh x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func sinh(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("sinh", source: x) }

/// The `cos` function.
///
/// - Experiment: Maps to `$\cos x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func cos(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("cos", source: x) }

/// The `cosh` function.
///
/// - Experiment: Maps to `$\cosh x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func cosh(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("cosh", source: x) }

/// The `cot` function.
///
/// - Experiment: Maps to `$\cot x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func cot(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("cot", source: x) }

/// The `coth` function.
///
/// - Experiment: Maps to `$\coth x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func coth(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("coth", source: x) }

/// The `sup` function.
///
/// - Experiment: Maps to `$\sup x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func sup(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("sup", source: x) }

/// The `csc` function.
///
/// - Experiment: Maps to `$\csc x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func csc(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("csc", source: x) }

/// The `deg` function.
///
/// - Experiment: Maps to `$\deg x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func deg(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("deg", source: x) }

/// The `det` function.
///
/// - Experiment: Maps to `$\det x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func det(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("det", source: x) }

/// The `dim` function.
///
/// - Experiment: Maps to `$\dim x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func dim(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("dim", source: x) }

/// The `tan` function.
///
/// - Experiment: Maps to `$\tan x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func tan(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("tan", source: x) }

/// The `exp` function.
///
/// - Experiment: Maps to `$\exp x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func exp(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("exp", source: x) }

/// The `gcd` function.
///
/// - Experiment: Maps to `$\gcd x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func gcd(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("gcd", source: x) }

/// The `hom` function.
///
/// - Experiment: Maps to `$\hom x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func hom(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("hom", source: x) }

/// The `inf` function.
///
/// - Experiment: Maps to `$\inf x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Note: Not to be confused with ``infinity``.
///
/// - Parameters:
///   - x: The body of the function.
public func inf(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("inf", source: x) }

/// The `tanh` function.
///
/// - Experiment: Maps to `$tanh x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func tanh(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("tanh", source: x) }

/// The `ker` function.
///
/// - Experiment: Maps to `$\ker x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func ker(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("ker", source: x) }

/// The `lg` function.
///
/// - Experiment: Maps to `$\lg x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func lg(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("lg", source: x) }

/// The `liminf` function.
///
/// - Experiment: Maps to `$\liminf x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func liminf(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("liminf", source: x) }

/// The `limsup` function.
///
/// - Experiment: Maps to `$\limsup x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func limsup(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("limsup", source: x) }

/// The `log` function.
///
/// - Experiment: Maps to `$\log x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func log(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("log", source: x) }

/// The `log` function.
///
/// - Experiment: Maps to `$\log_{index} x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - subscript: The subscript to the `log` function.
///   - x: The body of the function.
public func log(subscript: some LaTeXComponent, _ x: some LaTeXComponent) -> some LaTeXComponent { Function("log", index: `subscript`, source: x) }

/// The `ln` function.
///
/// - Experiment: Maps to `$\ln x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func ln(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("ln", source: x) }

/// The `max` function.
///
/// - Experiment: Maps to `$\max x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func max(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("max", source: x) }

/// The `min` function.
///
/// - Experiment: Maps to `$\min x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func min(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("min", source: x) }

/// The `Pr` function.
///
/// - Experiment: Maps to `$\Pr x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func Pr(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("Pr", source: x) }

/// The `sec` function.
///
/// - Experiment: Maps to `$\sec x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func sec(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("sec", source: x) }

/// The `sin` function.
///
/// - Experiment: Maps to `$\sin x$` in LaTeX.
///
/// - Note: To wrap the body with brackets `()`, see ``Function/includeBrackets(_:)``.
///
/// - Parameters:
///   - x: The body of the function.
public func sin(_ x: some LaTeXComponent) -> some LaTeXComponent { Function("sin", source: x) }

