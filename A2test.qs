namespace Solution {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;
    
    operation Solve(unitary : (Qubit => Unit is Adj+Ctl)) : Int {
        using (q = Qubit()) {
            H(q);
            unitary(q);
            return MResetX(q) == One ? 1 | 0;
        }
    }

    @EntryPoint()
    operation test() : Unit {
        if (Solve(Z) == 0) {
            Message("Fail on Z");
        } else {
            Message("Pass on Z");
        }

        if (Solve(I) == 1) {
            Message("Fail on I");
        } else {
            Message("Pass on I");
        }
    }
}


