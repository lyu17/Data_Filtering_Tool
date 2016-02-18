import java.util.*;
import java.io.*;
import weka.core.Instances;
import weka.core.converters.ConverterUtils.DataSource;

public class LoadData {
	
	public static double[][] getText(String fileName) {
		
		int numOfRow = 0;
		int numOfcol = 0;
		double[][] array = new double[1][1];
		
		Vector<String> data = new Vector<String>();
		Vector<String> instance = new Vector<String>();
		
		try {
			
			Scanner input = new Scanner(new File(fileName));
			
			while(input.hasNextLine()) {
				data.add(input.nextLine());
				numOfRow ++;
			}
			
			input.close();
			
		    for(Object obj : data) {
		    	
				Scanner scan = new Scanner((String)obj).useDelimiter(" ");
				
				while(scan.hasNext()) {
					instance.addElement(scan.next());
					numOfcol ++;
				}
				
				scan.close();
				
				break;
				
			}
		    
		    array = new double[numOfRow][numOfcol];
			
		    for(int k=0; k<numOfRow; k++) {
				array[k] = new double[numOfcol];
			}
		    
			for(int i=0; i<numOfRow; i++) {
				
				String oneRow = data.elementAt(i);
				
				Scanner rowScan = new Scanner(oneRow).useDelimiter(" ");
				
				int j = 0;
			    
			    while(rowScan.hasNext()) {
					array[i][j++] = Double.parseDouble(rowScan.next());
				}
			    
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.exit(0);
		}
		
		return array;
		
	}
	
	public static Instances getArff(String fileName) throws Exception {
		
		 DataSource source = new DataSource(fileName);
		 
		 Instances data = source.getDataSet();

		 if (data.classIndex()==-1) {
			 data.setClassIndex(data.numAttributes()-1);
		 }
		 
		 return data;
	
	}
	
}
