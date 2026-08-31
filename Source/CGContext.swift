import CoreGraphics


public extension CGContext
{
	//	rethrows means draw doesnt have to throw so covers throwing and non throwing
	func DrawInClippedRect(_ clipRect:CGRect,draw:()throws ->Void) rethrows
	{
		let path = CGPath(rect: clipRect, transform: nil)
		try self.DrawInClippedShape(clipPath:[path], draw: draw)
	}
	
	func DrawInClippedShape(clipPath:CGPath,draw:()throws->Void) rethrows
	{
		try DrawInClippedShape(clipPath: [clipPath],draw:draw)
	}
	
	func DrawInClippedShape(clipPath:[CGPath],draw:()throws->Void) rethrows
	{
		//	save graphics state before clipping added
		self.saveGState()
		defer // called even if this function throws
		{
			self.restoreGState()
		}
		
		//	add clipping shapes and bake as the clipping mask
		clipPath.forEach
		{
			self.addPath($0)
		}
		self.clip()
		
		//	draw user's stuff whilst clipped
		try draw()
	}
	
	func DrawFlipped(_ image: CGImage, in rect: CGRect) 
	{
		DrawAndRestoreState
		{
			self.translateBy(x: 0, y: rect.origin.y + rect.height)
			self.scaleBy(x: 1.0, y: -1.0)
			self.draw(image, in: CGRect(origin: CGPoint(x: rect.origin.x, y: 0), size: rect.size))
		}
	}
	
	func DrawAndRestoreState(draw:()->Void)
	{
		saveGState()
		draw()
		restoreGState()
	}
	
}

