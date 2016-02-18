import java.util.Vector;

public class InstanceSelection {
	
	public static void main(String[] args) {
		
		try {
			
			double[][] data = LoadData.getText("C:\\Users\\li\\Desktop\\experiment\\60\\data.txt");
			int col = data[0].length;
			
			Vector<String> methodList = new Vector<String>();
			methodList.addElement("KD");
			methodList.addElement("ST");
			
			Vector<String> ISR = new Vector<String>();
			ISR.addElement("2");
			ISR.addElement("4");
			ISR.addElement("6");
			ISR.addElement("8");
			
			for(int k1=0; k1<2; k1++) {
				
				String iMethod = methodList.elementAt(k1);
				
				for(int k2=0; k2<4; k2++) {
					
					String isr = ISR.elementAt(k2);
					
					String loadPath = "C:\\Users\\li\\Desktop\\experiment\\60\\idx_" 
						+ iMethod + isr + ".txt";
					String savePath = "C:\\Users\\li\\Desktop\\experiment\\60\\data_"
						+ iMethod + isr + ".txt";
					
					double[][] idx = LoadData.getText(loadPath);
					int row = idx[0].length;
					
					double[][] newData = new double[row][col];
					
					for(int i=0; i<row; i++) {
						newData[i] = new double[col];
						int srcIdx = (int)idx[0][i];
						for(int j=0; j<col; j++) {
							newData[i][j] = data[srcIdx][j];
						}
					}
					
					WriteData.wirteToText(newData, savePath);
					
				}
				
			}

		
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
	}
	
}
