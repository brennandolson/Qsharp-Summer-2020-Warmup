namespace Solution {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;
    
    operation Solve(unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
        using (q = Qubit[2]) {
            unitary(q);
            return MResetZ(q[1]) == Zero ? 1 | 0;
        }
    }
}


