/*
 * Hand represents a players two hole cards.
 */
public class Hand {
	public Card card1;
	public Card card2;
	
	/*
	 * Empty Hand constructor
	 */
	public Hand() {
		this.card1 = null;
		this.card2 = null;
	}
	
	/*
	 * add card method
	 */
	public void addCard(Card c) {
		if(this.card1.equals(null)) {
			this.card1 = c;
		}
		else if(this.card2.equals(null)) {
			this.card2 = c;
		}
		else {
			System.out.println("Error: This hand already had two cards in it.");
		}
	}
	
	/*
	 * clear hand method
	 */
	public void clearHand() {
		this.card1 = null;
		this.card2 = null;
	}
}
