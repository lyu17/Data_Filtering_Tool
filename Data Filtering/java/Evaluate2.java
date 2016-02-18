import java.text.DecimalFormat;
import java.util.*;

public class Evaluate2 {
		    
	public static void main(String[] args) {
		
		String folderPath = "C:\\Users\\li\\Desktop\\experiment\\10\\";
		
		Vector<String> iMethodList = new Vector<String>();
		iMethodList.addElement("KD");
		iMethodList.addElement("ST");
		
		Vector<String> ISR = new Vector<String>();
		ISR.addElement("2");
		ISR.addElement("4");
		ISR.addElement("6");
		ISR.addElement("8");
		ISR.addElement("a");
		
		Vector<String> fMethodList = new Vector<String>();
		fMethodList.addElement("I");
		fMethodList.addElement("P");
		fMethodList.addElement("R");
		
		Vector<String> FSR = new Vector<String>();
		FSR.addElement("1");
		FSR.addElement("2");
		FSR.addElement("3");
		FSR.addElement("4");
		FSR.addElement("5");
		FSR.addElement("6");
		FSR.addElement("7");
		FSR.addElement("8");
		FSR.addElement("9");
		FSR.addElement("10");
		FSR.addElement("11");
		FSR.addElement("12");
		FSR.addElement("13");
		FSR.addElement("14");
		FSR.addElement("15");
		FSR.addElement("16");
		FSR.addElement("17");
		FSR.addElement("18");
		FSR.addElement("19");
		FSR.addElement("20");
		
		Vector<Double> kRateList = new Vector<Double>();
		kRateList.addElement(0.5172);
		kRateList.addElement(0.9310);
		kRateList.addElement(1.0000);
		kRateList.addElement(1.0000);
		kRateList.addElement(1.0000);
		
		Vector<Double> sRateList = new Vector<Double>();
		sRateList.addElement(0.6207);
		sRateList.addElement(0.9130);
		sRateList.addElement(1.0000);
		sRateList.addElement(1.0000);
		sRateList.addElement(1.0000);
		
//		Vector<Double> rRateList = new Vector<Double>();
//		rRateList.addElement(0.0000);
//		rRateList.addElement(0.0690);
//		rRateList.addElement(0.1034);
//		rRateList.addElement(0.2414);
//		rRateList.addElement(1.0000);
		
		Vector<String> fetureList = new Vector<String>();
		
//		116
//		203
//		204
//		229
//		235
//		236
		
		try {
			
			for(int k1=0; k1<2; k1++) {
				
				String iMethod = iMethodList.elementAt(k1);
				
				for(int k2=0; k2<5; k2++) {
					
					String isr = ISR.elementAt(k2);
					
					for(int k3=0; k3<3; k3++) {
						
						String fMethod = fMethodList.elementAt(k3);
						
						String loadPath = "";
						
						if(isr.equals("a")) {
							loadPath = folderPath + "rank_all_" + fMethod + ".txt";
						}
						else {
							loadPath = folderPath + "rank_" +  iMethod + isr + "_" + fMethod + ".txt";
						}
						
						double[][] rank = LoadData.getText(loadPath);
						
//						System.out.println(loadPath);
						
						for(int k4=0; k4<20; k4++) {
							
							int fsNum = Integer.parseInt(FSR.elementAt(k4));
							
							for(int i=0; i<fsNum; i++) {	
								for(int j=0; j<51; j++) {
									Integer rNum = (int)rank[i][j]+1;
									fetureList.addElement(rNum.toString());
								}
							}
							
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
							
//							System.out.println(aimedError + " " + totalError);
							
							String entryName = iMethod + isr +  "_" + fMethod + "_" + fsNum;
							
							double iLose = 0;
							if(iMethod.equals("KD")) {
								iLose = kRateList.elementAt(k2);
							}
							else {
								iLose = sRateList.elementAt(k2);
							}

							double fLose = (double)aimedError/totalError;
							
							DecimalFormat df = new DecimalFormat("#.####");
							
							System.out.println(entryName + ": " + iLose + "*" + fLose + "=" + df.format(iLose*fLose));
							
							/* ********************************************************************* */
							
							fetureList.clear();
							
						}
					}
				}
			}
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
	}
}
		