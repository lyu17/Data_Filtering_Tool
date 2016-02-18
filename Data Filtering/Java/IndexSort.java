public class IndexSort {
	
	private double[] array;
	private int[] arrayIdx;
	
	public IndexSort(double[] src) {
		
		array = src;
		arrayIdx = new int[src.length];
		
		for(int i=0; i<src.length; i++) {
			arrayIdx[i] = i+1;
		}
		
	}

	public void quickSort(int left, int right) {
		
		int i = left;
		int j = right;
		
		int midposi = left;
		double midValue = array[midposi];
		int midIValue = arrayIdx[midposi];
		
		while(i <= j) {

			while(array[j] <= midValue && j > left) {
				j--;	
			}

			while(array[i] >= midValue && i < right) {
				i++;
			}

			if(i <= j) {
				
				array[midposi] = array[j];
				array[j] = array[i];
				array[i] = midValue;
				
				arrayIdx[midposi] = arrayIdx[j];
				arrayIdx[j] = arrayIdx[i];
				arrayIdx[i] = midIValue;

				midposi = i;
				midValue = array[midposi];
				midIValue = arrayIdx[midposi];

				i++;
				j--;
			
			}

			if(j>left) {
				quickSort(left, j);
			}
			
			if(i<right) {
				quickSort(i, right);
			}
			
		}
	}

	public double[] getValue() {
		
		return array;
		
	}
	
	public int[] getIndex() {
		
		return arrayIdx;
		
	}

}
