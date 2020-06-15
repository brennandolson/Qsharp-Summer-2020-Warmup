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

    operation IX(qs : Qubit[]) : Unit is Adj+Ctl {
        X(qs[1]);
    }

    operation CNOT2(qs : Qubit[]) : Unit is Adj+Ctl {
        CNOT(qs[0], qs[1]);
    }


    @EntryPoint()
    operation test() : Unit {
        if (Solve(CNOT2) == 0) {
            Message("Fail on CNOT");
        } else {
            Message("Pass on CNOT");
        }

        if (Solve(IX) == 1) {
            Message("Fail on IX");
        } else {
            Message("Pass on IX");
        }
    }
}


