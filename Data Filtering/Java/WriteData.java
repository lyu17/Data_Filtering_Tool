import java.io.*;

public class WriteData {
	
	public static void wirteToText(double[][] data, String fileName) {
		
		int row = data.length;
		int col = data[0].length;
		
		try {
			
			FileWriter out = new FileWriter(fileName);
			PrintWriter pw = new PrintWriter(out);
			
			for(int i=0; i<row; i++) {
				for(int j=0; j<col; j++) {
					if(j!=col-1) {
						pw.print(data[i][j] + " ");
					}
					else {
						pw.print(data[i][j]);
					}
				}
				if(i!=row-1) {
					pw.println();
				}
			}
			
			pw.close();
			out.close();
			
		} catch(Exception e) {
			e.printStackTrace();
			System.exit(0);
		}

	}
	
	public static void wirteToArff(double[][] data, String fileName) {
		
		int row = data.length;
		int col = data[0].length;
		
		try {
			
			FileWriter out = new FileWriter(fileName);
			PrintWriter pw = new PrintWriter(out);
			
			pw.println("@RELATION bgplog");
			
			for(int t=0; t<col-1; t++) {
				pw.println("@ATTRIBUTE " + (t+1) + " NUMERIC");
			}
			pw.println("@ATTRIBUTE class {Y,N}");
			
			pw.println("@DATA");
			
			for(int i=0; i<row; i++) {
				for(int j=0; j<col-1; j++) {
					pw.print(data[i][j] + ",");
				}
				if(data[i][col-1]==1.0) {
					pw.println("Y");
				}
				else {
					pw.println("N");
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

