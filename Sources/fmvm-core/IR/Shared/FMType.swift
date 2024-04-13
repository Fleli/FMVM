
/// Represents any type in an FMVM program.
/// Conforms to `CustomStringConvertible` so that `[FMType]`'s descriptions produce lists `[a1, ..., an]` where `ai` is `a.emit()`
public indirect enum FMType: FMVMEmittable, CustomStringConvertible, Equatable {
    
    
    public typealias TupleType = [String : FMType]
    
    
    // MARK: Cases
    
    
    /// The atomic `int16` type, representing one machine word.
    case int16
    
    /// A pointer to a value of a type. The type being pointed to is said to be wrapped.
    case pointer(wrapped: FMType)
    
    /// A tuple containing multiple types. The special case `[:]` is used to represent `void` values. Tuples are unordered since they're unordered. Thus,
    /// no references shall be made to a tuple's layout. These references should be made at a later compilation stage.
    case tuple(types: TupleType)
    
    /// A function type. The function takes one parameter of type `p` and returns a result of type `q`.
    case function(p: FMType, q: FMType)
    
    
    // MARK: Methods
    
    
    public var isVoid: Bool {
        return self == .tuple(types: [:])
    }
    
    
    // MARK: Protocol Conformance
    
    
    public var description: String {
        return emit()
    }
    
    
    public func emit() -> String {
        
        if isVoid {
            return "void"
        }
        
        switch self {
            
        case .int16:
            return "int16"
        case .pointer(let wrapped):
            return wrapped.emit() + "*"
        case .tuple(let types):
            return types.description
        case .function(let p, let q):
            return p.emit() + "->" + q.emit()
        }
        
    }
    
    
    public static func == (lhs: FMType, rhs: FMType) -> Bool {
        
        switch (lhs, rhs) {
            
        case (.int16, .int16):
            return true
        
        case (.pointer(let w1), .pointer(let w2)):
            return w1 == w2
        
        case (.tuple(let l1), .tuple(let l2)):
            return l1 == l2
        
        case (.function(let in1, let out1), .function(let in2, let out2)):
            return in1 == in2  &&  out1 == out2
            
        default:
            return false
            
        }
        
    }
    
}
