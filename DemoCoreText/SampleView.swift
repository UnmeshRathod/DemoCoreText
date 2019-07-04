//
//  SampleView.swift
//  DemoCoreText
//
//  Created by Unmesh Rathod on 04/07/19.
//  Copyright © 2019 UnmeshRathod. All rights reserved.
//

import UIKit
import CoreText

class SampleView: UIView {

	override func draw(_ rect: CGRect) {
		guard let context = UIGraphicsGetCurrentContext() else { return }

		context.textMatrix = .identity
		context.translateBy(x: 0, y: bounds.size.height)
		context.scaleBy(x: 1.0, y: -1.0)

		let path = CGMutablePath()
		path.addRect(bounds)

		let attrString = NSAttributedString(string: "Hello Unmesh")
		let framesetter = CTFramesetterCreateWithAttributedString(attrString as CFAttributedString)
		let frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attrString.length), path, nil)

		CTFrameDraw(frame, context)
	}
}
