import java.text.DecimalFormat;
import java.util.Vector;

public class RandInsSelection {
	
	public static void main(String[] args) {
	
		try {
			
			double[][] data = LoadData.getText("C:\\Users\\li\\Desktop\\experiment\\60\\data.txt");
			int col = data[0].length;
			
			Vector<String> ISR = new Vector<String>();
			ISR.addElement("2");
			ISR.addElement("4");
			ISR.addElement("6");
			ISR.addElement("8");
			
			Vector<Integer> selectIdx = new Vector<Integer>();
			
			for(int k1=0; k1<4; k1++) {
				
				int selectRate = Integer.parseInt(ISR.elementAt(k1));
				
				String savePaht = "C:\\Users\\li\\Desktop\\experiment\\60\\data_RN"
					+ selectRate + ".txt";
				
				int row = (int)(selectRate * (double)data.length / 100);
				
				int[] randSerial = Utility.random_serial(data.length);
				
				double[][] newData = new double[row][col];
				
				for(int i=0; i<row; i++) {
					newData[i] = new double[col];
					int srcIdx = randSerial[i];
					for(int j=0; j<col; j++) {
						newData[i][j] = data[srcIdx][j];
					}
					selectIdx.addElement(srcIdx);
				}
				
				WriteData.wirteToText(newData, savePaht);
				
				double failureNum = 0;
				double failureSelected = 0;
				double instanceNum = data.length;
				double instanceSelected = selectIdx.size();
					
				for(int i=0; i<data.length; i++) {
					if(data[i][col-1]==1.0) {
						failureNum ++;
					}
				}
					
				for(int i=0; i<instanceSelected; i++) {
					if(data[selectIdx.elementAt(i)][col-1]==1.0) {
						failureSelected ++;
					}
				}
					
				DecimalFormat df = new DecimalFormat("#.####");
					
				System.out.println(instanceSelected + " " + instanceNum + " ISR=" + df.format(instanceSelected/instanceNum) 
						+ " " + failureSelected + " " + failureNum + " TIP=" + df.format(failureSelected/failureNum));
				
				selectIdx.clear();
				
			}
				
		} catch(Exception e) {
				
			e.printStackTrace();
				
		}
			
	}
	
}

