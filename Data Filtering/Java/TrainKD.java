import java.io.FileWriter;
import java.io.PrintWriter;
import java.text.DecimalFormat;

public class TrainKD {
	
	public static void main(String args[]) {
		
		double[][] data = LoadData.getText("C:\\Users\\li\\Desktop\\experiment\\60\\data.txt");
		int row = data.length;
		int col = data[0].length;

		try {
			
			FileWriter out = new FileWriter("C:\\Users\\li\\Desktop\\experiment\\60\\TrainKD.txt");
			PrintWriter pw = new PrintWriter(out);
			
			int[] buff = new int[]{10,15,20,25,30,35,40,45};
			int[] bin = new int[]{10,15,20,25,30,35,40,45};
			double[] T1 = new double[]{0.1,0.2,0.3,0.4,0.5};
			int[] T2 = new int[]{70,80,90,100,110,120};
			int[] order = PearsonRank.getRank(data);
			
			for(int k1=0; k1<8; k1++) {
				
				int buffsize = buff[k1];
				
				for(int k2=0; k2<8; k2++) {
					
					int binsize = bin[k2];
					int samplerate = bin[k2];
					
					if(binsize>buffsize) {
						break;
					}
					
					for(int k3=0; k3<5; k3++) {
						
						double t1 = T1[k3];
						
						for(int k4=0; k4<6; k4++) {
							
							int t2 = T2[k4];
							
							Integer[] selectedIdx = KD.select(data,order,buffsize,binsize,samplerate,t1,t2);
							
							double failureNum = 0;
							double failureSelected = 0;
							double instanceNum = row;
							double instanceSelected = selectedIdx.length;
							
							for(int i=0; i<row; i++) {
								if(data[i][col-1]==1.0) {
									failureNum ++;
								}
							}
							
							for(int i=0; i<instanceSelected; i++) {
								if(data[selectedIdx[i]][col-1]==1.0) {
									failureSelected ++;
								}
							}
							
							DecimalFormat df = new DecimalFormat("#.####");
							
							System.out.println(buffsize + " " + binsize + " " + samplerate + " " + t1 + " " + t2);
							System.out.println(instanceSelected + " " + instanceNum + " ISR=" + df.format(instanceSelected/instanceNum) 
									+ " " + failureSelected + " " + failureNum + " TIP=" + df.format(failureSelected/failureNum));
							
							pw.println(buffsize + " " + binsize + " " + samplerate + " " + t1 + " " + t2);
							pw.println(instanceSelected + " " + instanceNum + " ISR=" + df.format(instanceSelected/instanceNum) 
									+ " " + failureSelected + " " + failureNum + " TIP=" + df.format(failureSelected/failureNum));
							
							pw.println();
							
							for(int i=0; i<instanceSelected; i++) {
								if(i==instanceSelected-1) {
									pw.print(selectedIdx[i]);
									break;
								}
								pw.print(selectedIdx[i] + " ");
							}
							
							pw.println("\n");
							
						}
					}
				}
			}
			
			pw.close();
			out.close();
			
		} catch(Exception e) {
			
			e.printStackTrace();
			System.exit(0);
		
		}
		
	}
	
}

 


