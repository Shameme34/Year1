import java.util.*;

//Using Quick Sort for the female array
class Quick
{
	int partition(int[]a, int start, int end)
	{
		//Setting pivot
		int pivot = a[end];
		int i =(start -1);
		
		for (int j=start; j<=end-1;j++)
		{
			//if the current element is smaller than the pivot
			if (a[j]<pivot)
			{
				//Swapping arr[i] and arr[j]
				i++;
				int t = a[i];
				a[i] = a[j];
				a[j] = t;
			}
		}
		int t = a[i+1];
		a[i+1] = a[end];
		a[end] = t;
		return (i+1);
	}
	
	//Repeat the loop of partition until it sorts the array
	void quick(int a[], int start, int end)
	{
		if (start < end)
		{
			int p = partition(a, start, end);
			quick(a,start,p-1);
			quick(a,p+1,end);
		}
	}
	
	//Printing the array
	void printArr (int a[],int n)
	{
		int i;
		for (i=0;i<n;i++)
		{
			System.out.print(a[i] + " ");
		}
	}
}

class BinarySearch
{
	//Returns the index of x if it is present in arr, else return -1
	public static int binarySearch (int arr[],int first,int last,int key)
	{
		if (last>=first)
		{
			int mid = first + (last-first)/2;
			//If the element is present at the middle
			if (arr[mid] == key)
			{
				return mid;
			}
			//if the element is smaller than mid it is only present in the left subarray
			//else if it is bigger, it will be present in the right subarray
			if (arr[mid]>key)
				return binarySearch(arr,first,mid-1,key);
			else
				return binarySearch(arr,mid+1,last,key);
		}
		return -1;
	}
}

class Shameem_A1
{
	public static void main(String[] args)
	{
		//creating the array
		int a[] = {20,18,23,21,19,22,17};
		int n = a.length;
		System.out.println("\nBefore sorting Female array elements are -");
		//Quicksorting the female array
		Quick q1 = new Quick();
		q1.printArr(a, n);
		q1.quick(a, 0, n-1);
		System.out.println();
		System.out.println("\nAfter sorting Female array elements are -");
		q1.printArr(a, n);
		System.out.println();
		
		//Male array
		System.out.println("\nBefore sorting Male array elements are -");
		int b[] = {18,18,23,20};
		System.out.print(Arrays.toString(b));
		System.out.println();
		int m = b.length;
		int key;
		int last = a.length-1;
		ArrayList<Integer>alist = new ArrayList<Integer>();
		//Using binary Search to find if the female array contains the element
		for (int i =0;i<m;i++)
		{
			key = b[i];
			int result = BinarySearch.binarySearch(a,0,last,key);
			if (result != -1 && !alist.contains(key))
			{
				alist.add(key);
			}
		}
		System.out.println();
		System.out.println("After using binary search, the elements are-");
		System.out.print(alist);
	}
}