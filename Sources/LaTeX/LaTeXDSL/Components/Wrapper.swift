//
//  Wrapper.swift
//  
//
//  Created by Vaida on 10/19/22.
//


public struct Wrapper<Source: LaTeXComponent>: LaTeXComponent {
    
    private let source: Group<Source>
    
    private let name: Name
    
    enum Name: String {
        case overLine = "overline"
        case underLine = "underline"
        
        case overRightArrow = "overrightarrow"
        case overLeftArrow = "overleftarrow"
    }
    
    init(_ name: Name, @LaTeXBuilder source: () -> Source) {
        self.name = name
        self.source = Group(source())
    }
    
    public var latexExpression: String {
        "\\\(name.rawValue)\(self.source)"
    }
    
}
