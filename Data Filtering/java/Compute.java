import java.io.*;
import java.text.DecimalFormat;
import java.util.*;

public class Compute {
		    
	public static void main(String[] args) {
		
		Vector<Integer> list = new Vector<Integer>();
		list.addElement(47);
		list.addElement(52);
		list.addElement(57);
		list.addElement(62);
		list.addElement(62);
		
		Vector<Double> rateList = new Vector<Double>();
		rateList.addElement(0.0283);
		rateList.addElement(0.0442);
		rateList.addElement(0.0607);
		rateList.addElement(0.0816);
		rateList.addElement(1.0000);
		
		Vector<String> dataset = new Vector<String>();
		DecimalFormat df = new DecimalFormat("#.######");
		
		int totalF = 62;
		int lostF = 0;
		
		double iRate = 0;
		double fRate = 0;
		
		try {
			
			String path = "C:\\Users\\li\\Desktop\\ovis\\T1.txt"; 					
			Scanner input = new Scanner(new File(path));
			while(input.hasNextLine()) {
				dataset.add(input.nextLine());
			}
			
			System.out.println(dataset.size());
			
			for(int i=0; i<25; i++) {
				
				int q = 0;
				int r = 0;
				
				String lable1 = "";
				String lable2 = "";
				
				q = i/5;
				r = i%5;
				
				iRate = rateList.elementAt(q);
				lostF = totalF - list.elementAt(q);
				
				if(q==0) {
					lable1 = "I20";
				}
				else if(q==1) {
					lable1 = "I40";
				}
				else if(q==2) {
					lable1 = "I60";
				}
				else if(q==3) {
					lable1 = "I80";
				}
				else {
					lable1 = "I100";
				}
				
				if(r==0) {
					lable2 = "F20";
					fRate = (double)20 / 14688;
				}
				else if(r==1) {
					lable2 = "F40";
					fRate = (double)40 / 14688;
				}
				else if(r==2) {
					lable2 = "F60";
					fRate = (double)60 / 14688;
				}
				else if(r==3) {
					lable2 = "F80";
					fRate = (double)80 / 14688;
				}
				else {
					lable2 = "F100";
					fRate = (double)14688 / 14688;
				}
			
				Scanner sc = new Scanner(dataset.elementAt(i)).useDelimiter(" ");
				int TP = 0;
				int FP = 0;
				int FN = 0;
				int count = 0;
				while(sc.hasNext()) {
					count++;
					if(count==1) {
						TP = Integer.parseInt(sc.next()); 
					}
					else if(count==2) {
						FP = Integer.parseInt(sc.next()); 
					}
					else {
						FN = Integer.parseInt(sc.next()); 
					}
				}
				
				TP = TP - 3;
				FP = FP + 3;
				
				String lable = lable1 + "_" + lable2 + " : ";
				
				System.out.println(lable+df.format(iRate)+" "+df.format(fRate)+" "+df.format(iRate*fRate)+" "+df.format((double)TP*2/(TP*2+FP+FN))+" "+df.format((double)(TP-lostF)*2/((TP-lostF)*2+FP+FN)));

			}
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
	}
	
}