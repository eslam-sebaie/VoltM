//
//  UIView.swift
//  VoltM
//
//  Created by Eslam Sebaie on 9/5/21.
//

import Foundation
import UIKit
extension UIView {
    func setBCdesign(borderWidth: CGFloat, borderColor: UIColor, radius: CGFloat) {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func dropShadow(scale: Bool = true, radius: CGFloat, shadow: CGFloat) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = shadow
        self.layer.shouldRasterize = true
        self.layer.cornerRadius = radius
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    func whiteDropShadow(scale: Bool = true, radius: CGFloat, shadow: CGFloat) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = shadow
        self.layer.shouldRasterize = true
        self.layer.cornerRadius = radius
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func showLoader() {
        let activityIndicator = setupActivityIndicator()
        activityIndicator.startAnimating()
        self.addSubview(activityIndicator)
    }
    
    func hideLoader() {
        if let activityIndicator = viewWithTag(333) {
            activityIndicator.removeFromSuperview()
        }
    }
    
    private func setupActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = self.bounds
        activityIndicator.color = .lightText
        activityIndicator.tintColor = .blue
        activityIndicator.center = self.center
        activityIndicator.style = .white
        activityIndicator.tag = 333
        activityIndicator.transform = CGAffineTransform(scaleX: 2, y: 2)
        return activityIndicator
    }
    
    func setCornerRadius(radius: CGFloat) {
        
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
extension UIImageView {
    func applyshadowWithCorner(containerView : UIView, cornerRadious : CGFloat){
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowRadius = 3
        containerView.layer.cornerRadius = cornerRadious
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: cornerRadious).cgPath
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadious
    }
}
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 20, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 20, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
//@IBDesignable public class HooopTextfield: UITextField, UITextFieldDelegate {
//
//    @IBInspectable public var fontName: String? = "AvenirNext-Bold" {
//        didSet {
//            decorate()
//        }
//    }
//
//    @IBInspectable public var fontSize: CGFloat = 15 {
//        didSet {
//            decorate()
//        }
//    }
//
//    @IBInspectable public var fontColor: UIColor = UIColor.white {
//        didSet {
//            decorate()
//        }
//    }
//
//    @IBInspectable public var customTextAlignment: Int = 0 {
//        didSet {
//            decorate()
//        }
//    }
//
//    @IBInspectable public var borderColor: UIColor = UIColor.white {
//        didSet {
//            decorate()
//        }
//    }
//
//    @IBInspectable public var letterSpacing: CGFloat = 0 {
//        didSet {
//            decorate()
//        }
//    }
//
//    @IBInspectable public var cornerRadius: CGFloat = 0 {
//        didSet {
//            decorate()
//        }
//    }
//
//    @IBInspectable public var customPlaceholder: String? = nil {
//        didSet {
//            decorate()
//        }
//    }
//
//    @IBInspectable public var horizontalInset: CGFloat = 0 {
//        didSet {
//            decorate()
//        }
//    }
//
//    @IBInspectable public var verticalInset: CGFloat = 0 {
//        didSet {
//            decorate()
//        }
//    }
//
//    @IBInspectable public var selfDelegate: Bool = false {
//        didSet {
//            if selfDelegate {
//                self.delegate = self
//            }
//        }
//    }
//
//    @IBInspectable public var borderWidth: CGFloat = 0 {
//        didSet {
//            decorate()
//        }
//    }
//
//    @IBInspectable public var baseLineOffset: CGFloat = 0 {
//        didSet {
//            decorate()
//        }
//    }
//
//    @IBInspectable public var placeholderColor: UIColor? = nil {
//        didSet {
//            decorate()
//        }
//    }
//
//    @IBInspectable public var requiredColor: UIColor? = nil {
//        didSet {
//            decorate()
//        }
//    }
//
//    @IBInspectable public var requiredCharacter: String = "*"{
//        didSet {
//            decorate()
//        }
//    }
//
//    @IBOutlet public var nextField:HooopTextfield?
//
//    /*** more inspectable var can be added **/
//
//    override public func textRect(forBounds bounds: CGRect) -> CGRect {
//        return bounds.insetBy(dx: horizontalInset, dy: verticalInset)
//    }
//
//    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
//        return bounds.insetBy(dx: horizontalInset, dy: verticalInset)
//    }
//
//    func decorate() {
//        // Setup border and corner radius
//        self.layer.cornerRadius = cornerRadius
//        self.layer.borderWidth = borderWidth
//        self.layer.borderColor = borderColor.cgColor
//        // Setup text style
//        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
//        switch customTextAlignment {
//        case 2:
//            paragraphStyle.alignment = .right
//            break
//        case 1:
//            paragraphStyle.alignment = .center
//            break
//        default:
//            paragraphStyle.alignment = .left
//            break
//        }
//        var titleAttributes:[NSAttributedString.Key : Any] = [
//            NSAttributedString.Key.foregroundColor: fontColor,
//            NSAttributedString.Key.kern: letterSpacing,
//            NSAttributedString.Key.baselineOffset: baseLineOffset,
//            NSAttributedString.Key.paragraphStyle: paragraphStyle
//        ]
//        if let _ = fontName {
//            titleAttributes[NSAttributedString.Key.font] = UIFont(name: fontName!, size: fontSize)
//        }
//        if let _ = customPlaceholder {
//            var placeholderAttributes = titleAttributes
//            if let _ = placeholderColor {
//                placeholderAttributes[NSAttributedString.Key.foregroundColor] = placeholderColor
//            }
//            let attributedPlaceholder = NSMutableAttributedString(string: customPlaceholder!, attributes: placeholderAttributes)
//            if let _ = requiredColor {
//                let range = (customPlaceholder! as NSString).range(of: requiredCharacter)
//                attributedPlaceholder.addAttribute(NSAttributedString.Key.foregroundColor, value: requiredColor!, range: range)
//            }
//            self.attributedPlaceholder = attributedPlaceholder
//        }
//        self.defaultTextAttributes = titleAttributes
//    }
//
//    // MARK: - UITexfieldDelegate
//
//    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if (nextField != nil) {
//            nextField?.becomeFirstResponder()
//        }
//        return true
//    }
//}

@IBDesignable
public class HooopTextfield: UITextField {

    // MARK: - IBInspectable properties
    /// Applies border to the text view with the specified width
    @IBInspectable public var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
            layer.borderColor = borderColor.cgColor
        }
    }

    /// Sets the color of the border
    @IBInspectable public var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    /// Make the corners rounded with the specified radius
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    /// Applies underline to the text view with the specified width
    @IBInspectable public var underLineWidth: CGFloat = 0.0 {
        didSet {
            updateUnderLineFrame()
        }
    }

    /// Sets the underline color
    @IBInspectable public var underLineColor: UIColor = .groupTableViewBackground {
        didSet {
            updateUnderLineUI()
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

    /// Sets left margin
    @IBInspectable public var leftMargin: CGFloat = 10.0 {
        didSet {
            setMargins()
        }
    }

    /// Sets right margin
    @IBInspectable public var rightMargin: CGFloat = 10.0 {
        didSet {
            setMargins()
        }
    }

    // MARK: - init methods
    override public init(frame: CGRect) {
        super.init(frame: frame)
        applyStyles()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyStyles()
    }

    // MARK: - Layout
    override public func layoutSubviews() {
        super.layoutSubviews()
        updateUnderLineFrame()
        updateAccessoryViewFrame()
    }

    // MARK: - Styles
    private func applyStyles() {
        applyUnderLine()
        setMargins()
    }

    // MARK: - Underline
    private var underLineLayer = CALayer()
    private func applyUnderLine() {
        // Apply underline only if the text view's has no borders
        if borderStyle == UITextField.BorderStyle.none {
            underLineLayer.removeFromSuperlayer()
            updateUnderLineFrame()
            updateUnderLineUI()
            layer.addSublayer(underLineLayer)
            layer.masksToBounds = true
        }
    }

    private func updateUnderLineFrame() {
        var rect = bounds
        rect.origin.y = bounds.height - underLineWidth
        rect.size.height = underLineWidth
        underLineLayer.frame = rect
    }

    private func updateUnderLineUI() {
        underLineLayer.backgroundColor = underLineColor.cgColor
    }

    // MARK: - Margins
    private var leftAcessoryView = UIView()
    private var rightAcessoryView = UIView()
    private func setMargins() {
        // Left Margin
        leftView = nil
        leftViewMode = .never
        if leftMargin > 0 {
            if nil == leftView {
                leftAcessoryView.backgroundColor = .clear
                leftView = leftAcessoryView
                leftViewMode = .always
            }
        }
        updateAccessoryViewFrame()

        // Right Margin
        rightView = nil
        rightViewMode = .never
        if rightMargin > 0 {
            if nil == rightView {
                rightAcessoryView.backgroundColor = .clear
                rightView = rightAcessoryView
                rightViewMode = .always
            }
            updateAccessoryViewFrame()
        }
    }

    private func updateAccessoryViewFrame() {
        // Left View Frame
        var leftRect = bounds
        leftRect.size.width = leftMargin
        leftAcessoryView.frame = leftRect
        // Right View Frame
        var rightRect = bounds
        rightRect.size.width = rightMargin
        rightAcessoryView.frame = rightRect
    }

}
