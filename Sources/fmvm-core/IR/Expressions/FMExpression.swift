
/// An RValue expression.
public indirect enum FMExpression: FMVMEmittable {
    
    
    // MARK: Cases
    
    
    /// An atomic ("simple") expression
    case atomic(expression: FMAtomicExpression)
    
    /// The expression is a mathematical operation (with exactly two operands)
    case math(operation: FMMath, arg1: FMAtomicExpression, arg2: FMAtomicExpression)
    
    /// Load a value from main memory. This is equivalen to dereferencing a pointer.
    case load(pointer: FMAtomicExpression)
    
    /// Get a pointer to a member of a tuple type.
    /// _Note:_ This only returns a _pointer_ to the member, not the value of the member itself.
    /// Getting the member itself, e.g. `int y = point.y;`, is equivalent to loading (dereferencing) a pointer to the element, i.e. `int y = *(&(point.y));`.
    /// This can be accomplished by creating an intermediate variable `declare t: ptr int16 = memberPtr point, y of <type(point)>`, and let the final
    /// value be found by `declare y: int16 = load local t`.
    case memberPtr(source: FMAtomicExpression, type: FMType.TupleType, member: String)
    
    /// Function calls are always expressions in FMVM IR.
    /// Thus, a function call may only appear on the right-hand side of a local variable declaration.
    /// However, this variable may be `void` (i.e. `tuple<[:]>`), in which case it's "deallocated" immediately.
    /// Part of the call is passing an atomic expression as argument. For multi-parameter functions, this argument needs to be a local tuple variable.
    case call(function: String, argument: FMAtomicExpression)
    
    /// Phi nodes are inserted whenever the execution may end up in one of multiple possible paths, and we need to select one of several variables to assign to a local variable.
    /// In FMVM IR, all phi nodes include exactly two "source" nodes.
    /// Note that phi nodes only make sense on local variables.
    case phi(optionA: FMLocal, optionB: FMLocal)
    
    
    // MARK: Protocol Conformance
    
    
    public func emit() -> String {
        
        switch self {
            
        case .atomic(let expression):
            return "atomic " + expression.emit()
            
        case .math(let operation, let arg1, let arg2):
            return "math " + operation.emit() + " " + arg1.emit() + ", " + arg2.emit()
        
        case .load(let pointer):
            return "load " + pointer.emit()
            
        case .memberPtr(let src, let typ, let mem):
            return "memberPtr " + src.emit() + ", " + mem + " of " + typ.description
            
        case .call(let function, let argument):
            return "call " + function + " arg " + argument.emit()
            
        case .phi(let optionA, let optionB):
            return "phi " + optionA.name + ", " + optionB.name
            
        }
        
    }
    
    
}
