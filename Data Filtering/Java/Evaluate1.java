import java.text.DecimalFormat;
import java.util.*;
import weka.classifiers.Evaluation;
import weka.core.Instances;

public class Evaluate1 {
		    
	public static void main(String[] args) {
		
		String folderPath = "C:\\Users\\li\\Desktop\\experiment\\60\\arff\\";
		
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
		FSR.addElement("49");
		
/*		Vector<Double> kRateList = new Vector<Double>();
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
		
		Vector<Double> rRateList = new Vector<Double>();
		rRateList.addElement(0.0000);
		rRateList.addElement(0.0690);
		rRateList.addElement(0.1034);
		rRateList.addElement(0.2414);
		rRateList.addElement(1.0000);*/
		
// lead time = 10
		
/*		Vector<Double> iRateList = new Vector<Double>();
		iRateList.addElement(0.0268);
		iRateList.addElement(0.0411);
		iRateList.addElement(0.0617);
		iRateList.addElement(0.0816);
		iRateList.addElement(0.0249);
		iRateList.addElement(0.0477);
		iRateList.addElement(0.0601);
		iRateList.addElement(0.0810);*/
		
// lead time = 0
		
		/*		Vector<Double> iRateList = new Vector<Double>();
		iRateList.addElement(0.0268);
		iRateList.addElement(0.0411);
		iRateList.addElement(0.0617);
		iRateList.addElement(0.0801);
		iRateList.addElement(0.0212);
		iRateList.addElement(0.0424);
		iRateList.addElement(0.0601);
		iRateList.addElement(0.0810);*/
		
// lead time = 30
		
		/*		Vector<Double> iRateList = new Vector<Double>();
		iRateList.addElement(0.0268);
		iRateList.addElement(0.0411);
		iRateList.addElement(0.0617);
		iRateList.addElement(0.0816);
		iRateList.addElement(0.0231);
		iRateList.addElement(0.0477);
		iRateList.addElement(0.0601);
		iRateList.addElement(0.0810);*/
		
// lead time = 60
		
		Vector<Double> iRateList = new Vector<Double>();
		iRateList.addElement(0.0268);
		iRateList.addElement(0.0405);
		iRateList.addElement(0.0617);
		iRateList.addElement(0.0822);
		iRateList.addElement(0.0221);
		iRateList.addElement(0.0474);
		iRateList.addElement(0.0601);
		iRateList.addElement(0.0810);

		
		try {
			
			for(int k1=0; k1<2; k1++) {
				
				String iMethod = iMethodList.elementAt(k1);
				
				for(int k2=0; k2<5; k2++) {
					
					String isr = ISR.elementAt(k2);
					
					for(int k3=0; k3<3; k3++) {
						
						String fMethod = fMethodList.elementAt(k3);
						
						for(int k4=0; k4<21; k4++) {
							
							int fsNum = Integer.parseInt(FSR.elementAt(k4));
							
							String loadPath = "";
							
							if(isr.equals("a")) {
								loadPath = folderPath + "rank_all_" + fMethod + "_" + fsNum + ".arff";
							}
							else {
								loadPath = folderPath + "rank_" +  iMethod + isr + "_" + fMethod + "_" + fsNum + ".arff";
							}
							
							double iRate = 0;
							double fRate = (double)fsNum*51/2499;
							if(isr.equals("a")) {
								iRate = 1;
							}
							else {
								iRate = iRateList.elementAt(k1*4+k2);
							}
							
//							System.out.println(loadPath);
							
							Instances data = LoadData.getArff(loadPath);
							Evaluation eval = Classifier.corssValidate(data);
//							System.out.println(iMethod + isr + "_" + fMethod + "_" + fsNum + " : " + eval.fMeasure(0));
							
							DecimalFormat df = new DecimalFormat("#.####");
							System.out.println(iMethod + isr + "_" + fMethod + "_" + fsNum + " : " 
								+ df.format(eval.fMeasure(0)) + " " + df.format(1-iRate*fRate));
//							System.out.println(eval.confusionMatrix()[0][0]);
							
						}
					}
				}
			}
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
	}
}
		