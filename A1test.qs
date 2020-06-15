namespace Solution {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;
    
    operation Solve(unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        using (q = Qubit()) {
            unitary(q);
            return MResetZ(q) == One ? 1 | 0;
        }
    }

    @EntryPoint()
    operation test() : Unit {
        if (Solve(Z) == 0) {
            Message("Fail on X");
        } else {
            Message("Pass on X");
        }

        if (Solve(I) == 1) {
            Message("Fail on I");
        } else {
            Message("Pass on I");
        }
    }
}


