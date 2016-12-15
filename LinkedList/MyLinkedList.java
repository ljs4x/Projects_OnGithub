
public class  MyLinkedList {
	public int size;
	public LinkedListNode front;
	
	public MyLinkedList(LinkedListNode start) { 
		this.front = start;
		size = 1;
	}
	
	public void add(LinkedListNode addOn) {
		LinkedListNode current = front;
		while(current.next != null) {
			current = current.next;
		}
		current.next = addOn;
		addOn.prev = current;
		size++;
	}
	
	public void insertFront(LinkedListNode addOn) {
		addOn.next = front;
		front.prev = addOn;
		front = addOn;
		size++;
	}
	
	public void insertIndex(LinkedListNode addOn, int index) {
		
		LinkedListNode current = front;
		
		for(int i = 0; i <= index - 1; i++) {
			current = current.next;
		}
		
		addOn.next = current.next;
		current.next = addOn;
		addOn.prev = current;
		addOn.next.prev = addOn;
		size++;
	}
	
	public void printList() {
		LinkedListNode current = front;
		
		while(current != null) {
			System.out.print(current.data + " ");
			//move to next
			current = current.next;
		}
		System.out.println();
	}
	
	public int getSize() {
		return size;
	}
	
	public int getMax() {
		LinkedListNode current = front;
		int max = current.data;
		while(current != null) {
			if(current.data > max) {
				max = current.data;
			}
			current = current.next;
		}
		return max;
	}
	
	public int getMin() {
		LinkedListNode current = front;
		int min = current.data;
		while(current != null) {
			if(current.data < min) {
				min = current.data;
			}
			current = current.next;
		}
		return min;
	}
	
	public int getSum() {
		LinkedListNode current = front;
		int sum = 0;
		while(current != null) {
			sum += current.data;
			current = current.next;
		}
		return sum;
	}
}
