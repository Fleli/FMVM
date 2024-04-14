
/// Function attributes give the FMVM optimizer and late compilation stages extra information about the function.
/// This is useful both for optimization purposes, and for guaranteeing correctness of the program.
/// If attributes are propagated from the high-level program to FMVM, it also gives the programmer an opportunity to communicate with the FMVM optimizer.
public enum FMFunctionAttribute: FMVMEmittable, CustomStringConvertible, Hashable {
    
    /// The function has no side effects. This attribute requires that the function never writes to main memory.
    case hasNoSideEffects
    
    
    
    public var description: String {
        return emit()
    }
    
    
    public func emit() -> String {
        switch self {
        case .hasNoSideEffects:
            return "hasNoSideEffects"
            
        }
    }
    
    
}
