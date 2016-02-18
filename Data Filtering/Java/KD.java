import java.util.*;

public class KD {
	
	public static Integer[] select(double[][] data, int[] order, int bufSize, 
			double binSize, int sampleRate, double t1, int t2) throws Exception {
		
		int row = data.length;
		int col = data[0].length;
		
		Vector<Integer> selectedList = new Vector<Integer>();
		
		int iterNum = row / bufSize;
		
		int[] cSum = new int[col-1];
		
		for(int k=0; k<=iterNum; k++) {
			
	    	int startIdx = k * bufSize;
	    	int endIdx = (k+1) * bufSize - 1;
	    	
	    	if(endIdx>row-1) {
	    		endIdx = row-1;
	    	}
	    	
	    	if(startIdx>endIdx) {
	    		break;
	    	}
	    	
	    	/* ************************************************************************************** */
	    	
	    	Queue<Integer[]> queue = new LinkedList<Integer[]>();
	    	Vector<Integer[]> leaf = new Vector<Integer[]>();
	    	
	    	Integer[] root = new Integer[endIdx-startIdx+2];
			root[0] = 0;
			for(int i=1,j=startIdx; j<=endIdx; i++,j++) {
				root[i] = j;
			}
			
			/* ************************************************************************************** */
			
			queue.add(root);
			
			while(!queue.isEmpty()) {
				
				Integer[] node = queue.remove();
				int nodeSize = node.length - 1;
				int layer = node[0];
				
				if(nodeSize>binSize) {
					
					int dim = order[layer];
					
					Vector<Integer> leftChild = new  Vector<Integer>();
					leftChild.addElement(layer+1);
					Vector<Integer> rightChild = new  Vector<Integer>();
					rightChild.addElement(layer+1);
					
					int avg = 0;
					
					for(int i=1; i<=nodeSize; i++) {
						avg += data[node[i]][dim];
					}
					avg /= nodeSize;
					
					for(int i=1; i<=nodeSize; i++) {
						
						if(data[node[i]][dim]>avg) {
							
							leftChild.addElement(node[i]);
							
						}
						else {
							
							rightChild.addElement(node[i]);
							
						}
						
					}
					
					Integer[] lc = new Integer[leftChild.size()];
					for(int i = 0 ; i<leftChild.size(); i++){
						lc[i] = (Integer)leftChild.get(i);
					}
					
					Integer[] rc = new Integer[rightChild.size()];
					for(int i = 0 ; i<rightChild.size(); i++){
						rc[i] = (Integer)rightChild.get(i);
					}
					
					if(lc.length>1) {
						queue.add(lc);
					}
					
					if(rc.length>1) {
						queue.add(rc);
					}
					
				}
		
				else {
					leaf.addElement(node);
				}
				
			}
			
			/* ************************************************************************************** */
			
			int[] currentMean = new int[col-1];
			
			for(int j=0; j<col-1; j++) {
				
				for(int i=startIdx; i<=endIdx; i++) {
				
					cSum[j] += data[i][j];
					currentMean[j] += data[i][j];
				
				}
				
				currentMean[j] = currentMean[j] / bufSize;
				
			}
			
			int[] cMean = new int[col-1];
			
			for(int i=0; i<col-1; i++) {
				
				cMean[i] = cSum[i] / (k+1) * bufSize;
				
			}
			
			int changeCount = 0;
			double changRate = 0;
			
			for(int i=0; i<col-1; i++) {
				
				if(cMean[i]==0 && currentMean[i]!=0) {
					changRate = 1;
				}
				else if(cMean[i]!=0) {
					changRate = Math.abs(currentMean[i]-cMean[i]) / cMean[i];
				}
				
				if(changRate>t1) {
					changeCount = changeCount + 1;
				}
				
			}
			
//			System.out.println(changeCount);
			
			int sr = sampleRate;
			
			if(changeCount>=t2) {
				sr = 1;
			}
			else if(changeCount>=(t2-t2/10)) {
				sr = 2;
			}
			
			/* ************************************************************************************** */
			
			for(Object candidate : leaf) {
				
				Integer[] leafarray = (Integer[])candidate;
				int leafSize = leafarray.length - 1;
				int[] randSerial = Utility.random_serial(leafSize);
				int selectedNum = leafSize / sr;
				
				if(selectedNum==0) {
					selectedNum = 1;
				}
				
				for(int i=0; i<selectedNum; i++) {
					selectedList.addElement(leafarray[randSerial[i]+1]);
				}
				
			}
			
		}
		
		Integer[] result = new Integer[selectedList.size()];
		for(int i = 0 ; i<selectedList.size(); i++){
			result[i] = (Integer)selectedList.get(i);
		}
		
		return result;
		
	}
	
}

 


