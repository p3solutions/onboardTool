package bean;
import java.util.Comparator;

public class PriorityComparator implements Comparator {
	public int compare(Object obj1, Object obj2) {
		ProjectComplexity p1 = (ProjectComplexity) obj1;
		ProjectComplexity p2 = (ProjectComplexity) obj2;
		if (p1.priority == p2.priority)
			return 0;
		else if (p1.priority > p2.priority)
			return 1;
		else
			return -1;
	}
}
