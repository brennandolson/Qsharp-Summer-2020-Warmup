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
            unitary(q);
            H(q);
            return MResetZ(q) == One ? 1 | 0;
        }
    }

    @EntryPoint()
    operation test() : Unit {
        if (Solve(S) == 0) {
            Message("Fail on S");
        } else {
            Message("Pass on S");
        }

        if (Solve(Z) == 1) {
            Message("Fail on Z");
        } else {
            Message("Pass on Z");
        }
    }
}


