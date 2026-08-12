/*

	General math functions for multiple types.
	Trying to match simd & metal library
	and swift-convention at the same time...

	todo: fix all cases of functions.
	todo: make these generic and work out what base type 
			CGPoint, simd<>, float, double, CGFloat can all use
*/
import CoreGraphics
import simd



public func Clamp<TYPE:Comparable>(_ value:TYPE,min:TYPE,max:TYPE) -> TYPE
{
	if value <= min
	{
		return min
	}
	else if value >= max 
	{
		return max
	}
	return value
}



//	get normalised value within these bounds
public func range<FloatType:BinaryFloatingPoint>(_ start:FloatType,_ end:FloatType,value:FloatType) -> FloatType
{
	return (value-start) / (end-start)
}

public func range<MixType:BinaryInteger,FloatType:BinaryFloatingPoint>(_ start:MixType,_ end:MixType,value:FloatType) -> FloatType
{
	let start = FloatType(start)
	let end = FloatType(end)
	return range(start,end,value:value)
}

public func range01<FloatType:BinaryFloatingPoint>(_ min:FloatType,_ max:FloatType,value:FloatType) -> FloatType
{
	return Clamp( range(min,max,value:value), min:0, max: 1 )
}

@available(*, deprecated, renamed: "range", message: "Use lowercase function name")
public func Range(min:CGFloat,max:CGFloat,value:CGFloat) -> CGFloat
{
	return (value - min) / (max - min)
}

@available(*, deprecated, renamed: "range", message: "Use lowercase function name")
public func Range(min:Int,max:Int,value:Int) -> CGFloat
{
	return Range(min: CGFloat(min), max: CGFloat(max), value: CGFloat(value) )
}



//	get normalised value within these bounds
public func range(_ min:simd_float2,_ max:simd_float2,value:simd_float2) -> simd_float2
{
	return (value-min) / (max-min)
}





//	params matching simd, not metal. But with named arguments it doesnt matter so much 
@available(*, deprecated, renamed: "Clamp", message: "Use generic/PascalCase version")
public func clamp(_ x:Float,min:Float,max:Float) -> Float
{
	return Swift.max( min, Swift.min( x, max ) )
}

@available(*, deprecated, renamed: "Clamp", message: "Use generic version")
public func clamp(_ value:Int,min:Int,max:Int) -> Int
{
	if value < min
	{
		return min
	}
	else if value > max
	{
		return max
	}
	return value
}




public func lerp(min:CGFloat,max:CGFloat,_ time:CGFloat) -> CGFloat
{
	return min + ( (max-min)*time )
}

public func lerp(min:simd_float2,max:simd_float2,_ time:simd_float2) -> simd_float2
{
	return min + ( (max-min)*time )
}

public func lerp(min:simd_float3,max:simd_float3,_ time:Float) -> simd_float3
{
	return min + ( (max-min)*time )
}

public func lerp(min:Double,max:Double,_ time:Double) -> Double
{
	return min + ( (max-min) * time )
}

public func lerp(min:Float,max:Float,_ time:Float) -> Float
{
	return min + ( (max-min) * time )
}

