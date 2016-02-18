import weka.core.*;

public class ArrayToInstance {
	
	public static Instances convert(double[][] array) {
		
		int row = array.length;
		int col = array[0].length;
		
	     FastVector      atts;
	     FastVector      attVals;
	     Instances       data;
	     double[]        vals;
	     
	     atts = new FastVector();
	     attVals = new FastVector();
	     attVals.addElement("Y");
	     attVals.addElement("N");
	     
	     for(int i=0; i<col-1; i++) {
	    	 atts.addElement(new Attribute(""+i));
	     }
	     atts.addElement(new Attribute(""+(col-1), attVals));
	     
	     data = new Instances("array", atts, 0);
	     vals = new double[data.numAttributes()];
	     
	     for(int i=0; i<row; i++) {
	    	 
	    	 vals = new double[data.numAttributes()];
	    	 
	    	 for(int j=0; j<col-1; j++) {
		    	 vals[j] = array[i][j];
	    	 }
	    	 if(array[i][col-1]==1.0) {
	    		 vals[col-1] = attVals.indexOf("Y");
	    	 }
	    	 else {
	    		 vals[col-1] = attVals.indexOf("N");
	    	 }
	    	 
	    	 data.add(new Instance(1.0, vals));
	    	 
	     }
	     
	     return data;
	     
	}
	
}
