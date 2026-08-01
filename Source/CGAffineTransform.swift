import CoreGraphics
import simd

public extension CGAffineTransform
{
	var float4x4 : simd_float4x4
	{
		let row_a = simd_float4( Float(self.a), Float(self.b), 0, 0 )
		let row_b = simd_float4( Float(self.c), Float(self.d), 0, 0 )
		let row_c = simd_float4( 0, 0, 1, 0 )
		let row_d = simd_float4( Float(self.tx), Float(self.ty), 0, 1 )
		return simd_float4x4(columns: (row_a,row_b,row_c,row_d) )
	}
}

