import CoreMedia


public func CVGetErrorString(error:CVReturn) -> String
{
	switch error 
	{
		case kCVReturnSuccess:	return "kCVReturnSuccess"
		case kCVReturnInvalidArgument: return "kCVReturnInvalidArgument"
		case kCVReturnAllocationFailed: return "kCVReturnAllocationFailed"
		case kCVReturnUnsupported: return "kCVReturnUnsupported"
		case kCVReturnInvalidDisplay: return "kCVReturnInvalidDisplay"
		case kCVReturnDisplayLinkAlreadyRunning: return "kCVReturnDisplayLinkAlreadyRunning"
		case kCVReturnDisplayLinkNotRunning: return "kCVReturnDisplayLinkNotRunning"
		case kCVReturnDisplayLinkCallbacksNotSet: return "kCVReturnDisplayLinkCallbacksNotSet"
		case kCVReturnInvalidPixelFormat: return "kCVReturnInvalidPixelFormat"
		case kCVReturnInvalidSize: return "kCVReturnInvalidSize"
		case kCVReturnInvalidPixelBufferAttributes: return "kCVReturnInvalidPixelBufferAttributes"
		case kCVReturnPixelBufferNotOpenGLCompatible: return "kCVReturnPixelBufferNotOpenGLCompatible"
		case kCVReturnPixelBufferNotMetalCompatible: return "kCVReturnPixelBufferNotMetalCompatible"
		case kCVReturnWouldExceedAllocationThreshold: return "kCVReturnWouldExceedAllocationThreshold"
		case kCVReturnPoolAllocationFailed: return "kCVReturnPoolAllocationFailed"
		case kCVReturnInvalidPoolAttributes: return "kCVReturnInvalidPoolAttributes"
		case kCVReturnRetry: return "kCVReturnRetry"
		case kCVReturnError:	return "kCVReturnError(Undefined error)"	//	unspecified error
		default: return "\(error)"
	}
}
