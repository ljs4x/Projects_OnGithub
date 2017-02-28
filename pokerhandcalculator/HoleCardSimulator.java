import java.util.*;

/*
 * HoleCardSimulator will basically simulate the dealers actions 
 * in a Texas Holdem card game.
 */
public class HoleCardSimulator {

	public static void main(String[] args) {
		Deck deck = new Deck();
		CommunityCards community = new CommunityCards();
		
		Scanner input = new Scanner(System.in);
		
		//get player count from user
		System.out.println("How many players? ");
		int playerCount = input.nextInt();
		
		//initialize hands, player hand will be index 0
		Hand[] handArray = new Hand[playerCount];
		handArray[0] = new Hand();
		for(int i = 1; i < handArray.length; i++) {
			handArray[i] = new Hand();
		}
		
		//select two cards from user
		for(int i = 1; i <= 2; i++) {
			System.out.println("What is card " + i);
			System.out.println("Suit? (1 - 4)");
			int suit = input.nextInt();
			System.out.println("Face? (2 - 14");
			int face = input.nextInt();
			handArray[0].addCard(deck.drawCard(suit, face));
		}
		
		input.close();
		
		int loops = 1000;
		int wins = 0;
		
		
		//test players hand against the other hands 1000 times
		for(int count = 0; count < loops; count++) {
			
			//randomly deal first card to other hands
			for(int i = 1; i < handArray.length; i++) {
				handArray[i].addCard(deck.drawRandom());
			}
			
			//randomly deal second card to other hands.
			for(int i = 1; i < handArray.length; i++) {
				handArray[i].addCard(deck.drawRandom());
			}
			
			//deal community cards in correct order including 
			//burning a card from the deck as appropriate.
			deck.drawRandom();
			community.flop1 = deck.drawRandom();
			community.flop2 = deck.drawRandom();
			community.flop3 = deck.drawRandom();
			deck.drawRandom();
			community.river = deck.drawRandom();
			deck.drawRandom();
			community.turn = deck.drawRandom();
			
			//first get user's hand score
			int userScore = handScore(handArray[0], community);
			
			//for all players pipe community cards and hand cards into a method that returns the best hand
			for(int i = 1; i < handArray.length; i++) {
				//compare hands, if something beats player, stop comparing
				if(userScore < handScore(handArray[i], community));
			}
			//if player wins, increment wins
		}
		//create a win percentage based on players wins against number of 'random' tests.
		
	}
	
	/*
	 * Helper method to return the best hand using a simple int score 
	 * so that it's easy to compare it against another hand.
	 */
	public static int handScore(Hand hand, CommunityCards community) {
		
		int score = 0;
		ArrayList<Card> sortedSeven = new ArrayList<Card>();
		
		
		//big conditional logic structure goes here
		//working from the best hand down.
		//might break it up into a bunch of separate bool returning helper methods
		//if that makes more sense.
		
		int maxScore = (13 * 11) + 1;
		if(isRoyalFlush()) {
			return maxScore;
		}
		else if(isStraightFlush) {
			int highCard = findHighCard();
			return maxScore - (13 * 1) + highCard;
		}
		else if(isFourOfAKind) {
			int highCard = findHighCard();
			return maxScore - (13 * 2) + highCard;
		}
		else if(isFullHouse) {
			int bestTrip = findHighTrip();
			int bestPair = findHighPair();
			return maxScore - (13 * 4) + bestTrip + bestPair;
		}
		// else if flush
		
		// else if straight
		
		// else if three of a kind
		
		// else if two pair
		
		// else if pair
		
		// else high card
		
		
		return score;
	}
	
	public static boolean isRoyalFlush() {
		
	}

}
