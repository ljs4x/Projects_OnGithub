import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

/********************************
 * Challenge can be found here:
 * https://www.reddit.com/r/dailyprogrammer/comments/4uhqdb/20160725_challenge_277_easy_simplifying_fractions/
 *******************************/

// chose to do this the hard/long/dumb(?) way, not using the gcd built in functionality.
public class SimplifyingFractions {
	
	//PRIMES is always the first 100 prime numbers so I made it GLOBAL
	static int[] PRIMES = new int[1000]; 
	
	public static void main(String[] args) throws FileNotFoundException {
		
		// found a list of the first 1000 primes in plaintext online
		// https://primes.utm.edu/lists/small/1000.txt
		
		File f = new File("primes.txt");
		Scanner primesFile = new Scanner(f);
		for(int i = 0; i < PRIMES.length; i++) {
			PRIMES[i] = primesFile.nextInt();
		}
		primesFile.close();
		
		Scanner console = new Scanner(System.in);
		System.out.print("Please enter the numerator: ");
		int numerator = console.nextInt();
		System.out.print("Please enter the denominator: ");
		int denominator = console.nextInt();
		console.close();
		
		int[] fraction = new int[2];
		fraction[0] = numerator;
		fraction[1] = denominator;
		fraction = Simplifier(fraction);
		
		System.out.println(fraction[0] + " " + fraction[1]);
	}
	
	//recursive simplifier
	public static int[] Simplifier(int[] fraction) {
		
		//in case the fraction is actually a whole number
		if(fraction[0] % fraction[1] == 0) {
			fraction[0] = fraction[0] / fraction[1];
			fraction[1] = 1;
			return fraction;
		}
		
		//the recursive part, 
		//iterate through the primes list, if you hit a divisible prime, simplify and call again
		for(int i = 0; i < PRIMES.length; i++) {
			if(fraction[0] % PRIMES[i] == 0 && fraction[1] % PRIMES[i] == 0) {
				fraction[0] = fraction[0] / PRIMES[i];
				fraction[1] = fraction[1] / PRIMES[i];
				fraction = Simplifier(fraction);
			}
		}
		return fraction;
	}

}
