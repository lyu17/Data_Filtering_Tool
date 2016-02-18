import java.util.Vector;

public class GenerateArff {
	
	public static void generate(double[][] data, int[] selected, String savePath) {
	
		int row = data.length;
		int col = selected.length;
		
		double[][] selectedData = new double[row][col+1];
		
		for(int i=0; i<row; i++) {
			
			selectedData[i] = new double[col+1];
			
			for(int j=0; j<col; j++) {
				
				selectedData[i][j] = data[i][selected[j]];
				
			}
			
			selectedData[i][col] = data[i][data[0].length-1];
			
		}
	
		WriteData.wirteToArff(selectedData,savePath);
		
	}
	
	public static void main(String[] args) {
		
		try {
			
			Vector<String> iMethodList = new Vector<String>();
			iMethodList.addElement("KD");
			iMethodList.addElement("ST");
			
			Vector<String> ISR = new Vector<String>();
			ISR.addElement("2");
			ISR.addElement("4");
			ISR.addElement("6");
			ISR.addElement("8");
			
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
			FSR.addElement("0");
			
/*			String loadPath = "C:\\Users\\li\\Desktop\\experiment\\60\\data.txt";
			double[][] dataAll = LoadData.getText(loadPath);
			
			for(int k1=0; k1<3; k1++) {
				
				String idxPath = "C:\\Users\\li\\Desktop\\experiment\\60\\rank_all_" 
					+ fMethodList.elementAt(k1) + ".txt";
				double[][] rank = LoadData.getText(idxPath);
				
				for(int k2=20; k2<21; k2++) {
					
					int fsNum = Integer.parseInt(FSR.elementAt(k2));
					
					if(fsNum==0) {
						fsNum = (dataAll[0].length-1)/51;
					}
					
					int[] selected = new int[51*fsNum];
					for(int i=0; i<fsNum; i++) {	
						for(int j=0; j<51; j++) {
							selected[i*51+j] = (int)rank[i][j];
						}
					}
					
					String savePath = "C:\\Users\\li\\Desktop\\experiment\\60\\arff\\rank_all_" 
						+ fMethodList.elementAt(k1) + "_" + fsNum + ".arff";
					
					generate(dataAll,selected,savePath);
					
				}
				
			} */
			
			for(int k1=0; k1<2; k1++) {
				
				String iMethod = iMethodList.elementAt(k1);
				
				for(int k2=0; k2<4; k2++) {
					
					String isr = ISR.elementAt(k2);
					
					String loadPath = "C:\\Users\\li\\Desktop\\experiment\\60\\data_" + iMethod + isr + ".txt";
					double[][] data = LoadData.getText(loadPath);
					
					for(int k3=0; k3<3; k3++) {
						
						String idxPath = "C:\\Users\\li\\Desktop\\experiment\\60\\rank_" + iMethod + isr 
						                 + "_" + fMethodList.elementAt(k3) + ".txt";

						double[][] rank = LoadData.getText(idxPath);
						
						for(int k4=20; k4<21; k4++) {
							
							int fsNum = Integer.parseInt(FSR.elementAt(k4));
							
							if(fsNum==0) {
								fsNum = (data[0].length-1)/51;
							}
							
							int[] selected = new int[51*fsNum];
							for(int i=0; i<fsNum; i++) {	
								for(int j=0; j<51; j++) {
									selected[i*51+j] = (int)rank[i][j];
								}
							}
							
							String savePath = "C:\\Users\\li\\Desktop\\experiment\\60\\arff\\rank_" 
								+ iMethod + isr + "_" + fMethodList.elementAt(k3) + "_" + fsNum + ".arff";
							
							generate(data,selected,savePath);
							
						}
					}
				}
			} 

		
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
	}
	
}


/*		    double[][] pRank = LoadData.getText("C:\\Users\\li\\Desktop\\experiment\\10\\PearsonRank.txt");
			
			int[] selected = new int[51];
			for(int i=0; i<51; i++) {
				selected[i] = (int)pRank[0][i];
			}
			
			int row = data.length;
			int col = selected.length;
			
			double[][] selectedData = new double[row][col+1];
			
			for(int i=0; i<row; i++) {
				
				selectedData[i] = new double[col+1];
				
				for(int j=0; j<col; j++) {
					
					selectedData[i][j] = data[i][selected[j]];
					
				}
				
				selectedData[i][col] = data[i][data[0].length-1];
				
			}
		
			WriteData.wirteToArff(selectedData, "C:\\Users\\li\\Desktop\\experiment\\10\\data_p1.arff"); 
			
			double[][] iRank = LoadData.getText("C:\\Users\\li\\Desktop\\experiment\\10\\InfoRank.txt");
			
			int[] selected = new int[51];
			for(int i=0; i<51; i++) {
				selected[i] = (int)iRank[0][i];
			}
			
			int row = data.length;
			int col = selected.length;
			
			double[][] selectedData = new double[row][col+1];
			
			for(int i=0; i<row; i++) {
				
				selectedData[i] = new double[col+1];
				
				for(int j=0; j<col; j++) {
					
					selectedData[i][j] = data[i][selected[j]];
					
				}
				
				selectedData[i][col] = data[i][data[0].length-1];
				
			}
		
			WriteData.wirteToArff(selectedData, "C:\\Users\\li\\Desktop\\experiment\\10\\data_i1.arff"); */