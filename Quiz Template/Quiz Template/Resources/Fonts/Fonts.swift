//
//  Fonts.swift
//
//
//  Created by Mykyta Yankov on 01.09.2025.
//

import Foundation
import SwiftUI

// Info: - Mapping of Figma design font weight
//  300 - light,
//  400 - regular
//  500 - medium
//  600 - semibold

public extension Font {
    
    static func poppins(_ font: Poppins, size: CGFloat) -> Font {
        custom(font.rawValue, size: size)
    }
 
    static func kaisei(_ font: Kaisei, size: CGFloat) -> Font {
        custom(font.rawValue, size: size)
    }
}

public extension UIFont {
    
    static func poppins(_ font: Poppins, size: CGFloat) -> UIFont {
        UIFont(name: font.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
 
    static func kaisei(_ font: Kaisei, size: CGFloat) -> UIFont {
        UIFont(name: font.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
    
}

public extension View {
    
    func customFont(_ font: UIFont, lineHeight: CGFloat, tracking: CGFloat? = nil) -> some View {
        modifier(CustomizedFont(font: font, lineHeight: lineHeight, tracking: tracking))
    }
    
}

struct CustomizedFont: ViewModifier {
    let font: UIFont
    let lineHeight: CGFloat
    let tracking: CGFloat?
    
    func body(content: Content) -> some View {
        return content
            .font(Font(font))
            .lineSpacing(lineHeight - font.lineHeight)
            .padding(.vertical, (lineHeight - font.lineHeight) / 2)
            .tracking(tracking ?? 0)
    }
}

public enum Poppins: String, CaseIterable {

    case thin = "Poppins-Thin"
    case extraLight = "Poppins-ExtraLight"
    case light = "Poppins-Light"
    case regular = "Poppins-Regular"
    case medium = "Poppins-Medium"
    case semiBold = "Poppins-SemiBold"
    case bold = "Poppins-Bold"
    case extraBold = "Poppins-ExtraBold"
    case black = "Poppins-Black"
    case italic = "Poppins-Italic"
    
}

public enum Kaisei: String, CaseIterable {
    case bold = "KaiseiTokumin-Bold"
    case extraBold = "KaiseiTokumin-ExtraBold"
    case medium = "KaiseiTokumin-Medium"
    case regular = "KaiseiTokumin-Regular"
}
