namespace Solution {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Convert;
    
    operation Solve(qs : Qubit[]) : Unit {
        using (anc = Qubit()) {
            repeat {
                ApplyToEach(H, qs);
                (ControlledOnInt(0, X)) (qs, anc);
            } until(MResetZ(anc) == Zero)
            fixup {
                ResetAll(qs);
            }
        }
    }

    @EntryPoint()
    operation test() : Unit {
        using (qs = Qubit[2]) {
            Solve(qs);
            DumpMachine();
            ResetAll(qs);
        }
    }
}
