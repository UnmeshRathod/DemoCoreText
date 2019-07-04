//
//  MarkupParser.swift
//  DemoCoreText
//
//  Created by Unmesh Rathod on 04/07/19.
//  Copyright © 2019 UnmeshRathod. All rights reserved.
//

import UIKit
import CoreText

class MarkupParser: NSObject {

	// MARK: - Properties

	var color: UIColor = .black
	var fontName: String = "Arial"
	var attrString: NSMutableAttributedString!
	var images: [[String: Any]] = []

	// MARK: - Initializers

	override init() {
		super.init()
	}

	// MARK: - Internal

	func parseMarkup(_ markup: String) {
		attrString = NSMutableAttributedString.init(string: "")

		do {
			let regex = try NSRegularExpression.init(pattern: "(.*?)(<[^>]+>|\\Z)", options: [.dotMatchesLineSeparators, .caseInsensitive])
			let chunks = regex.matches(in: markup, options: .init(rawValue: 0), range: NSRange.init(location: 0, length: markup.count))
		} catch {

		}


	}
}

// MARK: - String

extension String {
	func range(from range: NSRange) -> Range<String.Index>? {
		guard let from16 = utf16.index(utf16.startIndex,
									   offsetBy: range.location,
									   limitedBy: utf16.endIndex),
			let to16 = utf16.index(from16, offsetBy: range.length, limitedBy: utf16.endIndex),
			let from = String.Index(from16, within: self),
			let to = String.Index(to16, within: self) else {
				return nil
		}

		return from ..< to
	}
}

