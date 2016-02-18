import java.io.*;
import java.util.*;

public class DataToArff {
		    
	public static void main(String[] args) {
		
		Vector<String> dataset = new Vector<String>();
		Vector<String> oneInstance = new Vector<String>();
		
		int attrNum = 2499;
		
		String loadName = "C:\\Users\\li\\Desktop\\experiment\\dataset_60.txt";
		String saveName = "C:\\Users\\li\\Desktop\\experiment\\dataset_60.arff";
		
		try {
			
			Scanner fileScan = new Scanner(new File(loadName));
			
			while(fileScan.hasNextLine()) {
				dataset.add(fileScan.nextLine());
			}
			
			FileWriter out = new FileWriter(saveName,true);
			PrintWriter pw = new PrintWriter(out);
			
			
			pw.println("@RELATION bgplog");
			
			for(int n=0; n<attrNum; n++) {
				pw.println("@ATTRIBUTE " + (n+1) + " NUMERIC");
			}
			pw.println("@ATTRIBUTE class {Y,N}");
			
			pw.println("@DATA");
			
			int count = 0;
			
			for(Object obj : dataset) {
		    	
				Scanner input = new Scanner((String)obj).useDelimiter(" ");
				
				while(input.hasNext()) {
					String oneVar = input.next();
					oneInstance.addElement(oneVar);
				}
				
				for(int n=0; n<attrNum; n++) {
					pw.print(oneInstance.elementAt(n) + ",");
				}
				
				if(oneInstance.elementAt(attrNum).equals("1")) {
					pw.println("Y");
				}
				else {
					pw.println("N");
				}
				
				oneInstance.clear();
				
				System.out.println(count++);
				
			}
			
			pw.close();
			out.close();
		
		} catch(Exception e) {
			
			e.printStackTrace();
			System.exit(0);
		
		}
		
	}
	
}