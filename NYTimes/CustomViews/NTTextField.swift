//
//  NTTextField.swift
//  NYTimes


import UIKit

@IBDesignable
public class NTTextField: UITextField {
    
    
    var padding = UIEdgeInsets(top: 0, left: 12, bottom: -10, right: 0)
    
    @IBInspectable public var isEnableSquareBox: Bool = false {
        didSet {
            self.updateSquareBox()
            padding = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
        }
    }
    
    @IBInspectable public var squareBoxColor: UIColor = UIColor.white {
        didSet {
            self.updateSquareBox()
        }
    }
    
    /// Sets the placeholder color
    @IBInspectable public var placeholderColor: UIColor = .lightGray {
        didSet {
            let placeholderStr = placeholder ?? ""
            attributedPlaceholder = NSAttributedString(string: placeholderStr, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        }
    }
    
    public override var placeholder: String? {
        didSet {
            let placeholderStr = placeholder ?? ""
            attributedPlaceholder = NSAttributedString(string: placeholderStr, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        }
    }
    
    // MARK: - init methods
    override public init(frame: CGRect) {
        super.init(frame: frame)
        applyStyles()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyStyles()
    }
    
    // MARK: - Layout
    override public func layoutSubviews() {
        super.layoutSubviews()
    }
    
    // MARK: - Styles
    private func applyStyles() {
        self.autocorrectionType = .no
        self.updateSquareBox()
    }
    
    private func updateSquareBox() {
        if self.isEnableSquareBox {
            self.layer.borderWidth = 0.5
            self.layer.borderColor = squareBoxColor.cgColor
            self.layer.cornerRadius = 4
        }
    }
    
}

extension NTTextField {
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
