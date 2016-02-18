import java.util.Random;

public class Utility {
	
	public static int[] random_serial(int limit, int need) {
		
		int[] temp = new int[limit];
		int[] result = new int[need];
		for (int i = 0; i < limit; i++) {
			temp[i] = i;
		}
		int w;
		Random rand = new Random();
		for (int i = 0; i < need; i++) {
			w = rand.nextInt(limit - i) + i;
			int t = temp[i];
			temp[i] = temp[w];
			temp[w] = t;
			result[i] = temp[i];
		}
		
		return result;
	}
	
	public static int[] random_serial(int limit) {
		
		int[] result = new int[limit];
		for (int i = 0; i < limit; i++) {
			result[i] = i;
		}
		int w;
		Random rand = new Random();
		for (int i = limit - 1; i > 0; i--) {
			w = rand.nextInt(i);
			int t = result[i];
			result[i] = result[w];
			result[w] = t;
		}
		
		return result;
	}
}
 