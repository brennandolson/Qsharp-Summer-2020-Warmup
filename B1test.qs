namespace Solution {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Arithmetic;
    open Microsoft.Quantum.Convert;
    
    operation Solve(register : LittleEndian) : Unit is Adj+Ctl {
        let qs = register!; // unwrapping
        let n = Length(qs);   
        // Message(IntAsString(n));

        // the order matters here
        for (j in 2..n) {
            let i = n - j; //realized after the fact that i could use n-2..0..-1 to loop backwards
            // Message(IntAsString(i));
            Controlled X(qs[0..i], qs[i+1]);
        }
    

        X(qs[0]);
    }

    operation Int2QubitArray(qs : Qubit[], a : Int) : Unit is Adj {
        // Converts a Qubit Array in 0-state into one representing
        // the int 'a' in LITTLE ENDIAN encoding.
        body(...) {
            let digits = Length(qs);
            let B = IntAsBoolArray(a, digits);
            for (i in 0..digits - 1) {
                if (B[i]) {
                    X(qs[i]);
                }
            }
        }
        adjoint self;
    }

    @EntryPoint()
    operation test() : Unit {
        let digits = 3;
        let max = PowI(2, digits) - 1;
        for (p in 0..max) {
            using (qs = Qubit[digits]) {
                Int2QubitArray(qs, p);
                Solve(LittleEndian(qs));
                DumpMachine();
                Adjoint Solve(LittleEndian(qs));
                Adjoint Int2QubitArray(qs, p); 
            }
        }
    }
}


