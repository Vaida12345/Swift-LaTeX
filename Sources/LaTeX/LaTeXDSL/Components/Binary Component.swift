//
//  Binary Component.swift
//  
//
//  Created by Vaida on 10/19/22.
//


struct BinaryComponent<LHS: LaTeXComponent, Operator: LaTeXComponent, RHS: LaTeXComponent>: LaTeXComponent {
    
    let lhs: GroupComponent<LHS>
    
    let `operator`: Operator
    
    let rhs: GroupComponent<RHS>
    
    init(lhs: LHS, operator: Operator, rhs: RHS) {
        self.lhs = GroupComponent(lhs)
        self.operator = `operator`
        self.rhs = GroupComponent(rhs)
    }
    
    var latexExpression: String {
        lhs.latexExpression + self.operator.latexExpression + rhs.latexExpression
    }
    
}
