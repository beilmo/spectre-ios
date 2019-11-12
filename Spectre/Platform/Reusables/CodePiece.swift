//
//  CodePiece.swift
//  Spectre
//
//  Created by Dorin Danciu on 08/11/2019.
//  Copyright © 2019 Dorin Danciu. All rights reserved.
//

import UIKit

class CodePiece: UITextField, UITextFieldDelegate {
    @IBOutlet weak var nextPiece: CodePiece?
    @IBOutlet weak var previousPiece: CodePiece?

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        delegate = self

        clearsOnInsertion = true

        NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification,
                                               object: self, queue: .main, using:
            { [weak self] _ in
                self?.nextPiece?.becomeFirstResponder()
        })
    }

    override public func deleteBackward() {
        if text == "" {
            // do something when backspace is tapped/entered in an empty text field
            previousPiece?.becomeFirstResponder()
        }
        // do something for every backspace

        text = ""
        previousPiece?.becomeFirstResponder()

        super.deleteBackward()
    }

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
    
    // Use this if you have a UITextField
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // get the current text, or use an empty string if that failed
        let currentText = textField.text ?? ""

        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }

        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        // make sure the result is under 16 characters
        return updatedText.count <= 1
    }
}
