public class PearsonRank {
	
	public static int[] getRank(double[][] data) {
		
		int row = data.length;
		int col = data[0].length;
		
		double[] corr = new double[col-1];
		
		double[] y = new double[row];
		
		for(int i=0; i<row; i++) {
			y[i] = data[i][col-1];
		}
		
		for(int j=0; j<col-1; j++) {
			
			double[] x = new double[row];
			
			for(int i=0; i<row; i++) {
				
				x[i] = data[i][j];
				
				corr[j] = PearsonCorr.GetPearson(x,y);
				
			}
			
		}
		
		IndexSort sorter = new IndexSort(corr);
		sorter.quickSort(0,corr.length-1);
		
		return sorter.getIndex();
		
	}
	
}
