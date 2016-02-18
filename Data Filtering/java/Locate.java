import java.io.*;
import java.text.DecimalFormat;
import java.util.*;

public class Locate {
		    
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
		
		Vector<String> locaList = new Vector<String>();
		Vector<String> fetureList = new Vector<String>();
		
		Vector<Double> rateList = new Vector<Double>();
		rateList.addElement(0.7580);
		rateList.addElement(0.8387);
		rateList.addElement(0.9193);
		rateList.addElement(1.0000);
		rateList.addElement(1.0000);
		
		try {
			
			for(int i=0; i<1; i++) {
				
				String leadTime = leadTimeList.elementAt(i);
				
				String locaFile = "C:\\Users\\li\\Desktop\\" + leadTime + "\\loca.txt";
				
				Scanner locaScan = new Scanner(new File(locaFile));
				String oneLine = "";
				while(locaScan.hasNextLine()) {
					oneLine = locaScan.nextLine();
					locaList.add(oneLine);
				}

				String savaName = "C:\\Users\\li\\Desktop\\" + leadTime + "\\3.txt";
				FileWriter out = new FileWriter(savaName);
				PrintWriter pw = new PrintWriter(out);
				
				for(int j=1; j<2; j++) {
					
					String method = methodList.elementAt(j);
					
					for(int k=0; k<5; k++) {
						
						Integer cRate = cRateList.elementAt(k);
							
						for(int m=1; m<2; m++) {
							
							String folderName = folderList.elementAt(m);
							
							for(int l=0; l<6; l++) {
								
								/* ********************************************************************* */
								
								String rankFile = "C:\\Users\\li\\Desktop\\" + leadTime + "\\" + method
								                  + "\\" + cRate + "\\" + folderName + "\\" + folderName 
								                  + "_" + 10*(l+1) + ".txt";
								
								Scanner attrScan = new Scanner(new File(rankFile)).useDelimiter(",");
								String one = "";
								while(attrScan.hasNext()) {
									one = attrScan.next();
									fetureList.add(one);
								}
								
								/* ********************************************************************* */
								
								int selectedNum = 20*(l+1);
								
								int totalError = 6;
								int aimedError = 0;
								
								int i1 = 0;
								int i2 = 0;
								int i3 = 0;
								int i4 = 0;
								int i5 = 0;
								int i6 = 0;
								
								for(Object err : fetureList) {
									
									int errNum = Integer.parseInt(err.toString());
									
									if(errNum>0&&errNum<52) {
										i1 = 1;
									}
									else if(errNum>51&&errNum<103) {
										i2 = 1;
									}
									else if(errNum>102&&errNum<154) {
										i3 = 1;
									}
									else if(errNum>153&&errNum<205) {
										i4 = 1;
									}
									else if(errNum>204&&errNum<256) {
										i5 = 1;
									}
									else {
										i6 = 1;
									}
									
								}
								
								aimedError = i1 + i2 + i3 + i4 + i5 + i6;
								
								/* ********************************************************************* */   
								
								System.out.println(aimedError + " " + totalError);
								
								String entryName = method + "_" + cRate +  "_" + folderName.substring(0,1) + "_" + selectedNum;
								double iLose = rateList.elementAt(k);
								double fLose = (double)aimedError/totalError;
								
								DecimalFormat df = new DecimalFormat("#.####");
								
								System.out.println(entryName + ": " + iLose + "*" + fLose + "=" + df.format(iLose*fLose));
								pw.println(entryName + ": " + iLose + "*" + fLose + "=" + df.format(iLose*fLose));
								
								/* ********************************************************************* */
								
								fetureList.clear();
								
							}
							
						}
						
					}
					
				}
				
				pw.close();
				out.close();
				
			}
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
	}
}
		