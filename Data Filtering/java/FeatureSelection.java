import java.util.Vector;

public class FeatureSelection {
	
	public static void PearsonBasedSelection(double[][] data, String fileName) {
		
		int row = (data[0].length-1)/51;
		int col = 51;
		
		double[][] result = new double[row][col];
		
		double[][] newData = new double[data.length][row+1];
		
	    for(int i=0; i<data.length; i++) {
	    	newData[i] = new double[row+1];
		}
	    
	    for(int metricNum=0; metricNum<col; metricNum++) {
	    	
	    	for(int i=0; i<data.length; i++) {
	    		
	    		for(int j=0; j<row; j++) {
	    			
	    			newData[i][j] = data[i][j*51+metricNum];
	    		
	    		}
	    		
	    		newData[i][row] = data[i][data[0].length-1];
	    	}
	    	
	    	int[] rank = PearsonRank.getRank(newData);
	    	
	    	for(int i=0; i<row; i++) {
	    		int r = (rank[i]-1)*51+metricNum;
	    		result[i][metricNum] = r;
	    	}
	    	
	    }
	    
	    WriteData.wirteToText(result,fileName);
	
	}
	
	public static void InfoBasedSelection(double[][] data, String fileName) {
		
		try {
		
			int row = (data[0].length-1)/51;
			int col = 51;
			
			double[][] result = new double[row][col];
			
			double[][] newData = new double[data.length][row+1];
			
		    for(int i=0; i<data.length; i++) {
		    	newData[i] = new double[row+1];
			}
		    
		    for(int metricNum=0; metricNum<col; metricNum++) {
		    	
		    	for(int i=0; i<data.length; i++) {
		    		
		    		for(int j=0; j<row; j++) {
		    			
		    			newData[i][j] = data[i][j*51+metricNum];
		    		
		    		}
		    		
		    		newData[i][row] = data[i][data[0].length-1];
		    	}
		    	
		    	int[] rank = InfoGainRank.getRank(ArrayToInstance.convert(newData));
		    	
		    	for(int i=0; i<row; i++) {
		    		int r = (rank[i])*51+metricNum;
		    		result[i][metricNum] = r;
		    	}
		    }
	
		    WriteData.wirteToText(result,fileName);
		    
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
	
	}
	
	public static void RandomSelection(double[][] data, String fileName) {
		
		try {
	
			int row = (data[0].length-1)/51;
			int col = 51;
			
			double[][] result = new double[row][col];

		    for(int metricNum=0; metricNum<col; metricNum++) {

		    	int[] rank = Utility.random_serial(row);

		    	for(int i=0; i<row; i++) {
		    		int r = (rank[i])*51+metricNum;
		    		result[i][metricNum] = r;
		    	}
		    	
		    }
			
		    WriteData.wirteToText(result,fileName);
		    
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
	
	}
	
	public static void main(String[] args) {
		
		try {
		
			//generate rank file
			
//			double[][] data = LoadData.getText("C:\\Users\\li\\Desktop\\experiment\\10\\data.txt");
//			PearsonBasedSelection(data,"C:\\Users\\li\\Desktop\\experiment\\10\\rank_all_P.txt");			
//			InfoBasedSelection(data,"C:\\Users\\li\\Desktop\\experiment\\10\\rank_all_I.txt");
//			RandomSelection(data,"C:\\Users\\li\\Desktop\\experiment\\10\\rank_all_R.txt");
			
			Vector<String> iMethodList = new Vector<String>();
			iMethodList.addElement("KD");
			iMethodList.addElement("ST");
			
			Vector<String> ISR = new Vector<String>();
			ISR.addElement("2");
			ISR.addElement("4");
			ISR.addElement("6");
			ISR.addElement("8");
			
			Vector<String> fMethodList = new Vector<String>();
			fMethodList.addElement("I");
			fMethodList.addElement("P");
			fMethodList.addElement("R");
			
			for(int k1=0; k1<2; k1++) {
				
				String iMethod = iMethodList.elementAt(k1);
				
				for(int k2=0; k2<4; k2++) {
					
					String isr = ISR.elementAt(k2);
					
					String loadPath = "C:\\Users\\li\\Desktop\\experiment\\10\\data_" 
						+ iMethod + isr + ".txt";
					
					for(int k3=0; k3<3; k3++) {
						
						String fMethod = fMethodList.elementAt(k3);
					
						String savePaht = "C:\\Users\\li\\Desktop\\experiment\\10\\rank_"
							+ iMethod + isr + "_" + fMethod + ".txt";
						
						double[][] data = LoadData.getText(loadPath);
						
						if(fMethod.equals("I")) {
							InfoBasedSelection(data,savePaht);
						}
						else if(fMethod.equals("P")) {
							PearsonBasedSelection(data,savePaht);
						}
						else {
							RandomSelection(data,savePaht);
						}
						
					}
					
				}
			
			}
		
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
	}
	
}
