namespace Solution {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;
    
    operation Solve(unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        using (qs = Qubit[2]) {
            ApplyToEach(H, qs); // equal superposition
            Controlled unitary(qs[0..0], qs[1]);
            H(qs[0]);

            // At this point, if unitary was Z, we 
            // have an equal superposition of 00 and 11
            // If unitary was -Z, we have an equal superposition
            // of 01 and 10 (with some phase).
            // Measuring separately, we can distinguish these
            // situations by the parity of One's we get.
            return MResetZ(qs[0]) == MResetZ(qs[1]) ? 0 | 1;
        }
    }
}


