
/// Something that can be emitted (i.e. FMVM IR code can be generated from it)
public protocol FMVMEmittable {
    
    func emit() -> String
    
}
