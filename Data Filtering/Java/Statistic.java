import java.text.*;
import java.util.*;

public class Statistic {
	
	public static Vector<Integer> select(double[][] data, int bufSize, 
			double threshold, int featureCounted) throws Exception {
		
		int row = data.length;
		int col = data[0].length;
		
		double[] meanRecord = new double[col-1];
		for(int i=0; i<col-1; i++) {
			meanRecord[i] = -1;
		}
		
		int iterNum = row / bufSize;
	    Vector<Integer> selectIdx = new Vector<Integer>();
	    
	    for(int k=0; k<=iterNum; k++) {
	    	
	    	int startIdx = k * bufSize;
	    	int endIdx = (k+1) * bufSize - 1;
	    	
	    	if(endIdx>row-1) {
	    		endIdx = row-1;
	    	}
	    	
	    	if(startIdx>endIdx) {
	    		break;
	    	}
	    
	    	for(int k1=startIdx; k1<=endIdx; k1++) {
	    		
	    		int meanCount = 0;
	    		double[] oneIns = data[k1];
	    		
	    		for(int k2=0; k2<col-1; k2++) {
	    			
	    			double meanChange = Math.abs(oneIns[k2]-meanRecord[k2]) / Math.abs(meanRecord[k2]);
	    			
	    			if(meanChange>threshold) {
	    				meanCount ++;
	    			}
	    			
	    		}
	    		
	    		if(meanCount>featureCounted) {
	    			selectIdx.addElement(k1);
	    		}
	    		
	    	}
	    	
	    	for(int c=0; c<col-1; c++) {
	    		
	    		double sum = 0;
	    		
	    		for(int r=startIdx; r<=endIdx; r++) {
	    			
	    			sum = sum + data[r][c];
	    			
	    		}
	    		
	    		meanRecord[c] = sum / bufSize;
	    		
			}
	    	
	    }
	    
	    return selectIdx;
		
	}

	public static void main(String args[]) {
		
		double[][] data = LoadData.getText("C:\\Users\\li\\Desktop\\experiment\\10\\data.txt");
		int row = data.length;
		int col = data[0].length;
		
		try {
			
			int buffsize = 30;
			double threshold = 0.4;
			int featurecounted = 100;
			
			Vector<Integer> selectedIdx = Statistic.select(data,buffsize,threshold,featurecounted);
			
			double failureNum = 0;
			double failureSelected = 0;
			double instanceNum = row;
			double instanceSelected = selectedIdx.size();
			
			for(int i=0; i<row; i++) {
				if(data[i][col-1]==1.0) {
					failureNum ++;
				}
			}
			
			for(int i=0; i<instanceSelected; i++) {
				if(data[selectedIdx.elementAt(i)][col-1]==1.0) {
					failureSelected ++;
				}
			}
			
			DecimalFormat df = new DecimalFormat("#.####");
			
			System.out.println(buffsize + " " + threshold + " " + featurecounted);
			System.out.println(instanceSelected + " " + instanceNum + " ISR=" + df.format(instanceSelected/instanceNum) 
					+ " " + failureSelected + " " + failureNum + " TIP=" + df.format(failureSelected/failureNum));
			
		} catch(Exception e) {
			
			e.printStackTrace();
			System.exit(0);
		
		}
		
	}
	
}

 


