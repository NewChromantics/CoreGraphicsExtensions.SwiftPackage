import CoreGraphics



public extension CGPath
{
	//	.union for multiple paths
	@available(macOS 13.0, *)
	func union(_ others: [CGPath], using fillRule: CGPathFillRule = .winding) -> CGPath 
	{
		others.reduce(self)
		{
			$0.union($1, using: fillRule) 
		}
	}
	
	//	merge multiple paths together
	@available(macOS 13.0, *)
	static func union(_ paths: [CGPath], using fillRule: CGPathFillRule = .winding) -> CGPath? 
	{
		if paths.isEmpty
		{
			return nil
		}
		var paths = paths
		let first = paths.removeFirst()
		return first.union(paths)
	}
}
