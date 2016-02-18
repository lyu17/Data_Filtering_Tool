import weka.classifiers.*;
import weka.classifiers.functions.*;
import weka.core.*;
import java.util.*;

public class Classifier {
	
	public static Evaluation corssValidate(Instances data) throws Exception {
		
		SMO classifier = new SMO();
		classifier.setOptions(Utils.splitOptions("-C 1.0 -L 0.0010 -P 1.0E-12 -N 0 -V -1 -W 1 -K \"weka.classifiers.functions.supportVector.PolyKernel -C 250007 -E 1.0\""));
		Evaluation eval = new Evaluation(data);
		eval.crossValidateModel(classifier, data, 3, new Random(1));
		return eval;
	}
	
	public static void main(String[] args) {
		
		try {
		
			Instances data = LoadData.getArff("C:\\Users\\li\\Desktop\\experiment\\10\\data.arff");
			Evaluation eval = corssValidate(data);
//			System.out.println(eval.toSummaryString("\nResults\n======\n", false));
			System.out.println(eval.fMeasure(0));
			System.out.println(eval.confusionMatrix()[0][0]);
		
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
	}
	
}
