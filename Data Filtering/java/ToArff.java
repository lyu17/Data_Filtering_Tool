import java.io.*;
import java.util.*;

public class ToArff {
		    
	public static void main(String[] args) {
		
		Vector<String> leadTimeList = new Vector<String>();
		leadTimeList.addElement("ovis");
		
		Vector<String> methodList = new Vector<String>();
		methodList.addElement("KD");
		methodList.addElement("ST");
		
		Vector<Integer> cRateList = new Vector<Integer>();
		cRateList.addElement(20);
		cRateList.addElement(40);
		cRateList.addElement(60);
		cRateList.addElement(80);
		cRateList.addElement(100);
		
		Vector<String> folderList = new Vector<String>();
		folderList.add("Pearson_Rank_Sep");
		folderList.add("InfoGain_Rank_Sep");

		Vector<Integer> numList = new Vector<Integer>();
		numList.add(20);
		numList.add(40);
		numList.add(60);
		numList.add(80);
		
		Vector<String> dataset = new Vector<String>();
		Vector<String> oneInstance = new Vector<String>();
		
		for(int i=0; i<1; i++) {
			
			String leadTime = leadTimeList.elementAt(i);
			
			for(int j=1; j<2; j++) {
				
				String method = methodList.elementAt(j);
				
				for(int k=0; k<5; k++) {
					
					Integer cRate = cRateList.elementAt(k);
					
					
					for(int m=1; m<2; m++) {
						
						String folderName = folderList.elementAt(m);

						for(int l=0; l<4; l++) {
							
							Integer selectNum = numList.elementAt(l);
							
							try {
								
								String path = "C:\\Users\\li\\Desktop\\" + leadTime + "\\" + method
                                                  + "\\" + cRate + "\\" + folderName + "\\" + selectNum;
								
								/* *************************************************************** */
								
								String oneLine = "";					
								Scanner input = new Scanner(new File(path+".txt"));
								while(input.hasNextLine()) {
									oneLine = input.nextLine();
									dataset.add(oneLine);
								}
								
								/* *************************************************************** */
								
								FileWriter out = new FileWriter(path+".arff");
								PrintWriter pw = new PrintWriter(out);
								
								/* *************************************************************** */
								
								
								pw.println("@RELATION bgplog");
								
								for(int t=0; t<selectNum; t++) {
									pw.println("@ATTRIBUTE " + (t+1) + " NUMERIC");
								}
								pw.println("@ATTRIBUTE class {Y,N}");
								
								pw.println("@DATA");
								
								int count = 0;
								
								for(Object obj : dataset) {
							    	
									Scanner input2 = new Scanner((String)obj).useDelimiter(" ");
									
									while(input2.hasNext()) {
										String oneVar = input2.next();
										oneInstance.addElement(oneVar);
									}
									
									for(int t=0; t<selectNum; t++) {
										pw.print(oneInstance.elementAt(t) + ",");
									}
									
									if(oneInstance.elementAt(selectNum).equals("1")) {
										pw.println("Y");
									}
									else {
										pw.println("N");
									}
									
									oneInstance.clear();
									
									System.out.println(count++);
									
								}
								
								/* *************************************************************** */
							
								dataset.clear();
								
								pw.close();
								out.close();
							
							} catch(Exception e) {
								
								e.printStackTrace();
								
							}
							
						}
						
					}
					
				}
				
			}
			
		}
		
	}
	
}