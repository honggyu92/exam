package exercise;

import java.util.function.IntSupplier;

public class LamdaExample {
	public static int method(int x , int y) {
		IntSupplier supplier = () -> {
			int result = x + y;
			return result;
		};
		int result = supplier.getAsInt();
		return result;
	}
	
	public static void main(String[] args) {
		System.out.println(method(3, 5));
	}

}
