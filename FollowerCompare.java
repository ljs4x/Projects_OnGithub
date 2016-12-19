import java.util.*;
import java.io.*;

/*
 * Simple program to sort instagram followers from an old list and a new list to find out who unfollowed us and who is new.
 * Takes two String arrays and outputs a results.txt file so we know who we should unfollow!
 * and who we might want to follow.
*/
public class FollowerCompare {
	public static void main(String[] args) throws IOException {
		//create two arrayLists
		ArrayList<String> oldList = new ArrayList<String>();
		ArrayList<String> newList = new ArrayList<String>();
		
		//read the strings from the files into the arrays
		//oldList first
		Scanner input = new Scanner(new File("oldlist.txt"));
		while(input.hasNext()) {
			oldList.add(input.next());
		}
		
		//newList second
		input = new Scanner(new File("newlist.txt"));
		while(input.hasNext()) {
			newList.add(input.next());
		}
		input.close();
		
		//set-up Writer:
        File statText = new File("results.txt");
        FileOutputStream os = new FileOutputStream(statText);
        OutputStreamWriter osw = new OutputStreamWriter(os);    
        Writer w = new BufferedWriter(osw);

		//iterate through the old list, checking it against the new list
        w.write("These dogs unfollowed us...time to unfollowback?");
		w.write("\n");
		for(int i = 0; i < oldList.size(); i++) {
			//if a name in the first array is not in the second array 
			if(!newList.contains(oldList.get(i))) {
				//output it to the results.txt file.
				w.write(oldList.get(i));
				w.write("\n");
			}
		}
		w.write("These dogs are new, should we follow them?");
		w.write("\n");
		for(int i = 0; i < newList.size(); i++) {
			if(!oldList.contains(newList.get(i))) {
				w.write(newList.get(i));
				w.write("\n");
			}
		}
		w.close();
	}
}
