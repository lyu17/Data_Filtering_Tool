import weka.attributeSelection.*;
import weka.core.*;

public class InfoGainRank {
	
	public static int[] getRank(Instances data) throws Exception {
		
		AttributeSelection attsel = new AttributeSelection();		
		InfoGainAttributeEval eval = new InfoGainAttributeEval();	
		Ranker search = new Ranker();		
		attsel.setEvaluator(eval);	
		attsel.setSearch(search);	
		attsel.SelectAttributes(data);	
		return attsel.selectedAttributes();
		
	}
	
}
