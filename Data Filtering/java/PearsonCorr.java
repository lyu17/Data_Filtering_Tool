public class PearsonCorr {
	
	public static double GetPearson(double[] x, double[] y) {
		
		int n = x.length;
		
		double yt,xt;
		
		double syy=0.0,sxy=0.0,sxx=0.0,ay=0.0,ax=0.0;
		
		for(int i=0; i<n; i++) {
			
			ax += x[i];
			ay += y[i];
		
		}
		
		ax /= n;
		ay /= n;
		
		for(int i=0; i<n; i++) {
			
			xt = x[i] - ax;
			yt = y[i] - ay;
			sxx += xt * xt;
			syy += yt * yt;
			sxy += xt * yt;
		
		}
		
		if(sxx==0||syy==0) {
			return -1;
		}
		
		return Math.pow(sxy,2) / ( sxx * syy );
	
	}
	
}