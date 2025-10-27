//
//  LaTeX Renderer.swift
//  
//
//  Created by Vaida on 10/18/22.
//

import SwiftUI
import WebKit


@available(macOS 26.0, iOS 26, *)
internal struct LaTeXRenderer: View {
    
    private let formula: String
    private let alignment: Alignment
    
    let webPage: WebPage
    
    @Environment(\.colorScheme) var colorScheme
    
    init(formula: String, alignment: Alignment) {
        self.formula = formula
        self.alignment = alignment
        
        self.webPage = WebPage()
        
        
        let htmlValue = LaTeXRenderer.content.replacingOccurrences(of: "## The body of equal goes here ##", with: "$$" + formula + "$$")
            .replacingOccurrences(of: "## foreground color ##", with: "#" + Color.foreground(for: colorScheme).hexDescription)
            .replacingOccurrences(of: "## background color ##", with: "#" + Color.background(for: colorScheme))
            .replacingOccurrences(of: "## text alignment ##", with: self.alignment.htmlAlignment.text)
            .replacingOccurrences(of: "## vertical alignment ##", with: self.alignment.htmlAlignment.vertical)
        
        webPage.load(html: htmlValue)
    }
    
    var body: some View {
        WebView(self.webPage)
    }
    
    private static let content =
"""
<!DOCTYPE html>

<html lang="en">
    <head>
      <meta charset="utf-8">
      <meta http-equiv="x-ua-compatible" content="ie=edge">
      <meta name="viewport" content="width=device-width">

      <title>MathJax v3 with TeX input and HTML output</title>

      <script>
          MathJax = {
            tex: {
                    inlineMath: [['$', '$'], ['\\(', '\\)']]
                }
          };
      </script>

      <script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-chtml.js"></script>

        <style>
            body {
                background: ## background color ##;
                color: ## foreground color ##;
                text-align: center;
                vertical-align: middle;
            }

            * {
                margin: 0;
                padding: 0;
                border: 0;
                outline: 0;
                font-size: 100%;
                text-align: ## text alignment ##;
                background: transparent;
                vertical-align: ## vertical alignment ##;
            }

            #LaTeXView {
                display: inline-block;
                min-height: 0px;
                min-width: 0px;
                overflow: hidden;
                padding: 0px;
                text-align: ## text alignment ##;
                vertical-align: ## vertical alignment ##;
            }
        </style>
    </head>

    <body>
        <div id='LaTeXView'>
            ## The body of equal goes here ##
        </div>
    </body>
</html>
"""
    
}


internal extension Color {
    
    var animatableData: [Double] {
#if canImport(AppKit) && !targetEnvironment(macCatalyst)
        let color = NSColor(self).usingColorSpace(.displayP3)!
        return [color.redComponent, color.greenComponent, color.blueComponent, color.alphaComponent]
#elseif canImport(UIKit)
        let color = UIColor(self).cgColor.converted(to: CGColorSpace(name: CGColorSpace.displayP3)!, intent: .defaultIntent, options: nil)!
        return color.components!.map { Double($0) } + [color.alpha]
#endif
    }
    
    /// The Hexadecimal description of the image
    ///
    /// **Example**
    ///
    ///     Color.white.hexDescription // "ffffff"
    var hexDescription: String {
        let vector = self.animatableData
        
        var red   = String(Int(vector[0] * 255), radix: 16, uppercase: false)
        var green = String(Int(vector[1] * 255), radix: 16, uppercase: false)
        var blue  = String(Int(vector[2]  * 255), radix: 16, uppercase: false)
        
        if red.count   == 1 { red.insert("0",   at: red.startIndex) }
        if green.count == 1 { green.insert("0", at: green.startIndex) }
        if blue.count  == 1 { blue.insert("0",  at: blue.startIndex) }
        
        return red + green + blue
    }
    
    static func background(for colorScheme: ColorScheme) -> String {
        var red   = ""
        var green = ""
        var blue  = ""
        
        if colorScheme == .dark {
            red   = String(29, radix: 16, uppercase: false)
            green = String(28, radix: 16, uppercase: false)
            blue  = String(28, radix: 16, uppercase: false)
        } else {
            red   = String(235, radix: 16, uppercase: false)
            green = String(234, radix: 16, uppercase: false)
            blue  = String(234, radix: 16, uppercase: false)
        }
        
        if red.count   == 1 { red.insert("0",   at: red.startIndex) }
        if green.count == 1 { green.insert("0", at: green.startIndex) }
        if blue.count  == 1 { blue.insert("0",  at: blue.startIndex) }
        
        return red + green + blue
    }
    
    static func foreground(for colorScheme: ColorScheme) -> Color {
        if colorScheme == .dark {
            return Color(.displayP3, red: 220 / 255, green: 220 / 255, blue: 220 / 255)
        } else {
            return Color(.displayP3, red: 36 / 255, green: 36 / 255, blue: 36 / 255)
        }
    }
    
}


private extension Alignment {
    
    var htmlAlignment: (text: String, vertical: String) {
        var textAlignment: String {
            switch self {
            case .leading, .topLeading, .bottomLeading:
                return "left"
            case .center, .top, .bottom:
                return "center"
            case .trailing, .topTrailing, .trailing:
                return "right"
            default:
                return "center"
            }
        }
        
        var verticalAlignment: String {
            switch self {
            case .top, .topLeading, .topTrailing:
                return "top"
            case .center, .leading, .trailing:
                return "middle"
            case .bottom, .bottomLeading, .bottomTrailing:
                return "bottom"
            default:
                return "middle"
            }
        }
        
        return (textAlignment, verticalAlignment)
    }
    
}


struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            LaTeXView(formula: "\\alpha + \\beta")
        }
        .preferredColorScheme(.light)
    }
}
