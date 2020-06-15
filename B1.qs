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
}


