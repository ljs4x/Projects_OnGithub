
public class CommunityCards {
	public Card flop1;
	public Card flop2;
	public Card flop3;
	public Card turn;
	public Card river;
	
	/*
	 * Empty CommunityCards constructor
	 */
	public CommunityCards() {
		this.flop1 = null;
		this.flop2 = null;
		this.flop3 = null;
		this.turn = null;
		this.river = null;
	}
	
	/*
	 * clear method
	 */
	public void clearCommunityCards() {
		this.flop1 = null;
		this.flop2 = null;
		this.flop3 = null;
		this.turn = null;
		this.river = null;
	}
}
