import java.util.*;
/*
 * Deck holds a list of cards
 * and methods to randomly draw a card
 * and method to draw a specific card
 */
public class Deck {
	
	// this Deck has a list of cards
	ArrayList<Card> deck = new ArrayList<Card>();
	
	/*
	 * Method to construct a new deck of 52 cards
	 */
	public Deck() {
		//4 passes for suits
		for(int i = 1; i <= 4; i++) {
			//13 passes for cards
			for(int j = 1; j <= 13; j++) {
				deck.add(new Card(i, j));
			}
		}
	}
	
	/*
	 * Method to randomly draw a card
	 */
	public Card drawRandom() {
		//pick a card, any card!
		int elementNumber = (int) Math.floor((Math.random() * deck.size()) + 1);
		//hold the Card
		Card cardToReturn =  deck.get(elementNumber);
		//remove the card from the deck
		deck.remove(elementNumber);
		//return the card to main
		return cardToReturn;
	}
	
	/*
	 * Method to draw a specific card
	 */
	public Card drawCard(int s, int f) {
		Card cardToReturn = null;
		
		//search the deck for the card we need to draw
		for(int i = 0; i < deck.size(); i++) {
			//if you find the card
			if(deck.get(i).suit == s && deck.get(i).face == f) {
				//get the card
				cardToReturn = deck.get(i);
				//remove the card from the deck
				deck.remove(i);
				//break out of the for loop since we're done.
				break;
			}
		}
		
		//if we didn't find the card something is wrong...
		if(cardToReturn.equals(null)) {
			System.out.println("Card not found.");
		}
		
		//return our card
		return cardToReturn;
 	}
}
