package Sorting;
import java.util.Arrays;

public class Bubble {
    public static void main(String[] args) {
        int[] arr = {3,4,55,2,1,6};
        bubble(arr);
        System.out.println(Arrays.toString(arr));

    }

    static void bubble(int[] arr) {
        // the i-loop run for n-1 times
        boolean swapped = false;
        for (int i=0; i < arr.length; i++) {
            /* j-loop starts from 1 in each ith iteration and compares j-1 element and swaps
    at every ith loop end, we will get the max element at the end. Hence, j loop will run
    upto arr.length-i;
            */

            for (int j=1; j <arr.length-i; j++) {
                if (arr[j] < arr[j-1]) {
                    swap(arr,j,j-1);
                }
                swapped = true;
            }

            // if j-loop doesn't swap elements that means array is sorted, we can terminate the loop.

            if (!swapped) {
                break;
            }
        }
    }

    static void swap(int[] arr, int i, int j) {
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }
}
