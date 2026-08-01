import CoreGraphics
import simd


public extension CGSize 
{
	var cgPoint : CGPoint	{	CGPoint(x:self.width,y:self.height)	}
	@available(*, deprecated, renamed: "cgPoint")
	var toPoint: 	CGPoint { .init(x: width, y: height) }
	@available(*, deprecated, renamed: "cgPoint")
	var asCgPoint : CGPoint	{	CGPoint(x:self.width,y:self.height)	}

	var half: 		CGSize { .init(width: width/2, height: height/2) }
	
	var simd_float2 : simd_float2
	{
		return simd.simd_float2(Float(self.width),Float(self.height))
	}
}


//	operators
public extension CGSize
{
	
	static func + (lhs: CGSize, rhs: CGSize) -> CGSize
	{
		let w = lhs.width + rhs.width
		let h = lhs.height + rhs.height
		return .init(width: w, height: h)
	}

}
