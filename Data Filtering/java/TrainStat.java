import java.io.FileWriter;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.Vector;

public class TrainStat {
	
	public static void main(String args[]) {
		
		double[][] data = LoadData.getText("C:\\Users\\li\\Desktop\\experiment\\60\\data.txt");
		int row = data.length;
		int col = data[0].length;

		try {
			
			FileWriter out = new FileWriter("C:\\Users\\li\\Desktop\\experiment\\60\\TrainST.txt");
			PrintWriter pw = new PrintWriter(out);
			
			int[] buff = new int[]{5,10,15,20,25,30,35,40,45,50};
			double[] T = new double[]{0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8};;
			int[] fCounted = new int[]{50,60,70,80,90,100,110,120,130,140};
			
			for(int k1=0; k1<10; k1++) {
				
				int buffsize = buff[k1];

				for(int k2=0; k2<8; k2++) {
						
					double threshold = T[k2];
						
					for(int k3=0; k3<10; k3++) {
							
						int numFeature = fCounted[k3];
							
						Vector<Integer> selectedIdx = Statistic.select(data,buffsize,threshold,numFeature);
						
						double failureNum = 0;
						double failureSelected = 0;
						double instanceNum = row;
						double instanceSelected = selectedIdx.size();
							
						for(int i=0; i<row; i++) {
							if(data[i][col-1]==1.0) {
								failureNum ++;
							}
						}
							
						for(int i=0; i<instanceSelected; i++) {
							if(data[selectedIdx.elementAt(i)][col-1]==1.0) {
								failureSelected ++;
							}
						}
							
						DecimalFormat df = new DecimalFormat("#.####");
							
						System.out.println(buffsize + " " + threshold + " " + numFeature);
						System.out.println(instanceSelected + " " + instanceNum + " ISR=" + df.format(instanceSelected/instanceNum) 
								+ " " + failureSelected + " " + failureNum + " TIP=" + df.format(failureSelected/failureNum));
							
						pw.println(buffsize + " " + threshold + " " + numFeature);
						pw.println(instanceSelected + " " + instanceNum + " ISR=" + df.format(instanceSelected/instanceNum) 
								+ " " + failureSelected + " " + failureNum + " TIP=" + df.format(failureSelected/failureNum));
							
						pw.println();
							
						for(int i=0; i<instanceSelected; i++) {
							if(i==instanceSelected-1) {
								pw.print(selectedIdx.elementAt(i));
								break;
							}
							pw.print(selectedIdx.elementAt(i) + " ");
						}
							
						pw.println("\n");
							
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

 


