//Full Name:Shameem Ahamed
//Student no: 10233420
//Full Time
//Tutorial Group T04
//Declaration: This is my own work and I have not passed my program to my friends
//and will be willing to accept any penalty given

import java.util.Arrays;
import java.util.ArrayList;

class Country
{
	private String name;
	private String player;
	private int age;
	
	//Other constructor
	public Country (String name, String player, int age)
	{
		this.name = name;
		this.player = player;
		this.age = age;
	}
	
	//Accessor Method
	public String getName()
	{
		return name;
	}
	
	public String getPlayer()
	{
		return player;
	}
	
	public int getAge()
	{
		return age;
	}
	
	//Mutator method
	public void setInfo (String name, String player, int age)
	{
		this.name = name;
		this.player = player;
		this.age = age;
	}
}
	
class Diving
{
	public static int SIZE = 10;
	private Country name;
	private double[] score;
	private double difficulty;

	//Other constructor
	public Diving (Country name, double difficulty)
	{
		this.name = name;
		this.difficulty = difficulty;
		
		score = new double [SIZE];
		getScore();
	}
	
	//Accessor Method
	public Country getCountry()
	{
		return name;
	}
	
	public double getDifficulty()
	{
		return difficulty;
	}
	
	public void setDifficulty(double difficulty)
	{
		this.difficulty = difficulty;
	}
	
	//Randomising the Score
	private void getScore()
	{
		for (int i = 0; i <score.length; i++)
			score[i] = Math.random()*10;
	}
	
	//Displaying the result table
	public void printInfo()
	{
		System.out.printf("%-15s", name.getName());
		for (double y: score)
			System.out.printf ("%-5.1f", y);
		System.out.printf("%15.1f", getDifficulty());
		System.out.printf("%10.2f%n", finalScore());
		
		
	}
	
	//Getting highest value from the array of Scores
	private double highest()
	{
		Arrays.sort(score);
		return score[score.length - 1];
	}
	
	//Getting Second highest value from the array of Scores
	private double secondHighest()
	{
		Arrays.sort(score);
		return score[score.length - 2];
	}
	
	//Getting lowest value from the array of Scores
	private double lowest()
	{
		Arrays.sort(score);
		return score[0];
	}
	
	//Getting second lowest value from the array of Scores
	private double secondLowest()
	{
		Arrays.sort(score);
		return score[1];
	}
	
	//Generating the final score
	public double finalScore()
	{
		double finalScore = 0.0;
		for (double x:score)
			finalScore += x;
		
		if (SIZE >= 7)
			return ((finalScore - highest() - lowest() - secondHighest() - secondLowest())* getDifficulty());
		else if (SIZE >= 5)
			return ((finalScore - highest() - lowest())* getDifficulty());
		else 
			return (finalScore *getDifficulty());
		
	}
	
}


class Shameem_A3
{
	
	private static final String[] Countries = {"Singapore","China","Thailand","China","South Korea","Japan","USA","France","Germany","Australia"};
	
	
	public static Country getChampion (ArrayList <Diving> alist)
	{
		//Creating an array for final Score
		double[] finalScore = new double[alist.size()];
		
		//Placing the values of final Score into the array
		for (int i = 0; i<alist.size(); i++)
			finalScore[i] = alist.get(i).finalScore();
		
		//Sorting the array
		Arrays.sort(finalScore);
		
		//Returning the Champion
		int index = 0;
		for (int i = 0; i<alist.size();i++)
		{
			if (finalScore[alist.size() - 1] == alist.get(i).finalScore())
				index = i;
		}
		return alist.get(index).getCountry();
			
	}
	
	public static Country firstRunnerUp (ArrayList <Diving> alist)
	{
		//Creating an array for final Score
		double[] finalScore = new double[alist.size()];
		
		//Placing the values of final Score into the array
		for (int i = 0; i<alist.size(); i++)
			finalScore[i] = alist.get(i).finalScore();
		
		//Sorting the array
		Arrays.sort(finalScore);
		
		//Returning the first runner up
		int index = 0;
		for (int i = 0; i<alist.size();i++)
		{
			if (finalScore[alist.size() - 2] == alist.get(i).finalScore())
				index = i;
		}
		return alist.get(index).getCountry();
		
	}
	
	//Randomising the difficulty
	private static double getDifficulty()
	{
		return (Math.random()*3 + 2);
	}
	
	//Randomising the age
	private static int getAge()
	{
		return (int)(Math.random()*15 + 15);  
	}
	
	
	//Displaying the Game Info
	private static void displayGameInfo (ArrayList <Diving> alist)
	{
		System.out.println("Starting position\n");
		System.out.printf ("%-15s%-15s%-5s%15s%n", "Country", "Diver", "Age", "Difficulty");
		for (Diving d :alist)
		{
			System.out.printf ("%-15s%-15s%-5d%15.1f%n", d.getCountry().getName(), d.getCountry().getPlayer(), d.getCountry().getAge(), d.getDifficulty());
		}
		
	}
	
	//Displaying the result Info
	private static void displayResultInfo (ArrayList <Diving> alist)
	{
		System.out.printf ("%-15s","Countries");
		for (int i = 1; i<= Diving.SIZE;i++)
			System.out.printf("%-5s", "J"+i);
		
		System.out.printf ("%15s%10s%n","Difficulty","Final");
		
		for (Diving d: alist)
		{
			d.printInfo();
		}
		System.out.printf("%n%s%n", "The result is:");
		System.out.printf("%-15s%10s, %-10s%n", "The Champion:", getChampion(alist).getPlayer(), getChampion(alist).getName()); 
		System.out.printf("%-15s%7s, %-10s%n", "The 1st Runner Up:", firstRunnerUp(alist).getPlayer(), firstRunnerUp(alist).getName());
	}
	
	public static void main (String [] args)
	{	
		//Creating an Array List for Diving class
		ArrayList <Diving> alist = new ArrayList <Diving> ();
		
		int counter = 1;
		
		for (String name : Countries)
		{
		  Country c = new Country (name,"Name " + counter++, getAge());
		  Diving d = new Diving (c , getDifficulty());
		  alist.add(d);
		}	
		
		displayGameInfo(alist);
		System.out.println();
		displayResultInfo(alist);
		
	}
}		