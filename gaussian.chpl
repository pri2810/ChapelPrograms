/*
The linear equations in n variables can be expressed as AX=Y
where A is nxn matrix and X and Y are vectors.
*/
proc main() {
	var n: int;
	writeln("Enter the number of variables");
	n = stdin.read(int);
	var j: int;
	var k: int;
	var i: int;
	var X: [0..n-1] real;
	
	var A: [0..n-1, 0 ..n-1] real;
	var Y: [0..n-1] real; 
	
	// Enter the coefficients A of linear equations in n variables
	writeln("Enter the coefficients of the equations");
	for i in (0..n-1) {
		for j in (0..n-1) {
			A(i,j) = stdin.read(real);
		}
	}
	
	
	// Enter the vector Y of linear equations in n variables
	writeln("Enter the Y values of the equations");
	for i in 0..n-1 {
		Y[i] = stdin.read(real);
	}
	
	//loop for the generation of upper triangular matrix
	for k in 0..n-1 {
		for i in k+1..n-1 {
			var c = A(i,k)/A(k,k);
			forall j in 0..n-1 {
				A(i,j) = A(i,j) - c*A(k,j);
			}
			Y[i] = Y[i] - c * Y[k];
		}
	}
	X[n-1] = Y[n-1]/A(n-1,n-1);
	
	const r = 0..n-2;
	//loop for backward substitution
	forall i in r # -1 {
		var sum: real = 0.0;
		for j in i+1..n-1 {
			sum = sum + A(i,j) * X[j];
		}
		X[i] = (Y[i] - sum)/A(i,i);
	}
	writeln("The solution is:");
	for i in 0..n-1 {
        	writeln("X["+i+"]="+X[i]);
       }
}	
