//
//  Arrow.swift
//  
//
//  Created by Vaida on 10/19/22.
//


struct Arrow: LaTeXComponent {
    
    public let latexExpression: String
    
    private init(_ latexExpression: String) {
        self.latexExpression = latexExpression
    }
    
    
    public static let leftArrow = Arrow("\\leftarrow")
    public static let gets = Arrow("\\gets")
    public static let rightArrow = Arrow("\\rightarrow")
    public static let to = Arrow("\\to")
    public static let leftRightArrow = Arrow("\\leftrightarrow")
    public static let LeftArrow = Arrow("\\Leftarrow")
    public static let RightArrow = Arrow("\\Rightarrow")
    public static let LeftRightArrow = Arrow("\\Leftrightarrow")
    public static let mapsto = Arrow("\\mapsto")
    public static let hookLeftArrow = Arrow("\\hookleftarrow")
    public static let leftHarpoonUp = Arrow("\\leftharpoonup")
    public static let leftHarpoonDown = Arrow("\\leftharpoondown")
    public static let rightLeftHarpoons = Arrow("\\rightleftharpoons")
    
    public static let longLeftArrow = Arrow("\\longleftarrow")
    public static let longRightArrow = Arrow("\\longrightarrow")
    public static let longLeftRightArrow = Arrow("\\longleftrightarrow")
    public static let LongLeftArrow = Arrow("\\Longleftarrow")
    public static let LongRightArrow = Arrow("\\Longrightarrow")
    public static let LongLeftRightArrow = Arrow("\\Longleftrightarrow")
    public static let longMapsto = Arrow("\\longmapsto")
    public static let hookRightArrow = Arrow("\\hookrightarrow")
    public static let rightHarpoonUp = Arrow("\\rightharpoonup")
    public static let rightHarpoonDown = Arrow("\\rightharpoondown")
    public static let iff = Arrow("\\iff")
    
    public static let upArrow = Arrow("\\uparrow")
    public static let downArrow = Arrow("\\downarrow")
    public static let upDownArrow = Arrow("\\updownarrow")
    public static let UpArrow = Arrow("\\Uparrow")
    public static let DownArrow = Arrow("\\Downarrow")
    public static let UpDownArrow = Arrow("\\Updownarrow")
    public static let neArrow = Arrow("\\nearrow")
    public static let seArrow = Arrow("\\searrow")
    public static let swArrow = Arrow("\\swarrow")
    public static let nwArrow = Arrow("\\nwarrow")
    public static let leadsTo = Arrow("\\leadsto")
    
}
