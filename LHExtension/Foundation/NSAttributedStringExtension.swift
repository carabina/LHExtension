
import Foundation
import UIKit

enum AttriType {
    case fontName(UIFont)
    case fgColor(UIColor)
    case paraStyle(NSParagraphStyle)
    case bgColor(UIColor)
    case ligaName(NSNumber)
    case kernName(NSNumber)
    case strikeStyle(NSNumber)
    case strikeColor(NSNumber)
    case underLineStyle(NSNumber)
    case underLineColor(UIColor)
    case strokeWidth(NSNumber)
    case strokeColor(UIColor)
    case shadow(NSShadow)
    case textEffect(NSString)
    case lineOffset(NSNumber)
    case obliqueness(NSNumber)
    case expansion(NSNumber)
    case writeDriction(NSNumber) //0,1,2,3
    case verticalForm(NSNumber)
    case link(NSURL)
    case attachment(NSTextAttachment)
    
}

extension NSMutableAttributedString{
    
private  func getAttri(_ attri:AttriType) -> (String,Any) {
    
    var attriKey = ""
    var value : Any
    
        switch attri {
            
        case .fontName(let fnt):
            attriKey = NSFontAttributeName
            value = fnt
            
        case .fgColor(let color):
            attriKey = NSForegroundColorAttributeName
            value = color
            
        case .paraStyle(let parastyle):
            attriKey = NSParagraphStyleAttributeName
            value = parastyle
            
        case .bgColor(let color):
            attriKey = NSBackgroundColorAttributeName
            value = color
            
        case .ligaName(let liga):
            attriKey = NSLigatureAttributeName
            value = liga
            
        case .kernName(let kern):
            attriKey = NSKernAttributeName
            value = kern
        
        case .strikeStyle(let strikeStyle):
            attriKey = NSStrikethroughStyleAttributeName
            value = strikeStyle
            
        case .strikeColor(let color):
            attriKey = NSStrikethroughColorAttributeName
            value = color
            
        case .underLineStyle(let underlineStyle):
            attriKey = NSUnderlineStyleAttributeName
            value = underlineStyle
        
        case .underLineColor(let color):
            attriKey = NSUnderlineColorAttributeName
            value = color
        
        case .strokeWidth(let width):
            attriKey = NSStrokeWidthAttributeName
            value = width
            
        case .strokeColor(let color):
            attriKey = NSStrokeColorAttributeName
            value = color
            
        case .shadow(let shadow):
            attriKey = NSShadowAttributeName
            value = shadow
        
        case .textEffect(let textEffect):
            attriKey = NSTextEffectAttributeName
            value = textEffect
        
        case .lineOffset(let lineOffset):
            attriKey = NSBaselineOffsetAttributeName
            value = lineOffset
        
        case .obliqueness(let obliqueness):
            attriKey = NSObliquenessAttributeName
            value = obliqueness
        
        case .expansion(let expansion):
            attriKey = NSExpansionAttributeName
            value = expansion
            
        case .writeDriction(let writeDriction):
            attriKey = NSWritingDirectionAttributeName
            value = writeDriction
        
        case .verticalForm(let verticalForm):
            attriKey = NSVerticalGlyphFormAttributeName
            value = verticalForm
        
        case .link(let url):
            attriKey = NSLinkAttributeName
            value = url
            
        case .attachment(let attachment):
            attriKey = NSAttachmentAttributeName
            value = attachment
            
        }
        return (attriKey,value)
    }
    
    func setAttri(_ attribute: AttriType,_ range:NSRange ) -> NSMutableAttributedString {
       
        let (key,value) = getAttri(attribute)
        let attributes = [key:value]
        self.setAttributes(attributes, range: range)
        return self
    }
    
    func addAttri(_ attribute: AttriType,_ range:NSRange) -> NSMutableAttributedString {
        
        let (key,value) = getAttri(attribute)
        let attributes = [key:value]
        self.addAttributes(attributes, range:range)
        return self
    }
    
    func setAttris(_ attributes: Array<AttriType>,_ range:NSRange ) -> NSMutableAttributedString {
        var returnAttributes = Dictionary<String, Any>()
        for attribute in attributes {
            let (key,value) = getAttri(attribute)
            returnAttributes.updateValue(value, forKey: key)
        }
        self.setAttributes(returnAttributes, range: range)
        return self
    }
    
    func addAttris(_ attributes: Array<AttriType>,_ range:NSRange ) -> NSMutableAttributedString {
        var returnAttributes = Dictionary<String, Any>()
        for attribute in attributes {
            let (key,value) = getAttri(attribute)
            returnAttributes.updateValue(value, forKey: key)
        }
        self.addAttributes(returnAttributes, range: range)
        return self
    }
    
    
}
