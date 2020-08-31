//package onboard;
import java.*;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.Date;
public class Weekday {
	public static int actualhours(String fromdate)
	{
		Date todaysDate = new Date();
        
	       DateFormat df2 = new SimpleDateFormat("MM/dd/YYYY");
	       String currentdate="";
	       try
	       {
	         currentdate = df2.format(todaysDate);
	          //s System.out.println(currentdate);
	           
	        }
	       catch (Exception ex )
	       {
	          System.err.println("[ERROR]----Got An Exception!-----"+ex.getMessage()+"-----[ERROR]");
	       }
	       return(splittingoperation(fromdate,currentdate));
	}

	public static int splittingoperation(String fromdate,String todate)
	{
		String weekday1="sat";
		String weekday2="sun";
		String[] fromdatearr=fromdate.split("/");
		String[] todatearr=todate.split("/");
		int fromd=Integer.parseInt(fromdatearr[1]);
		int tod=Integer.parseInt(todatearr[1]);
		int ld=tod;
		int fromm=Integer.parseInt(fromdatearr[0]);
		int tom=Integer.parseInt(todatearr[0]);
		int cm=fromm;
		int lm=tom;
		int fromy=Integer.parseInt(fromdatearr[2]);
		int toy=Integer.parseInt(todatearr[2]);
		int cy=fromy;
		int ly=toy;
		return(displaydate(fromd,fromm,fromy,tod,tom,toy,ld,lm,ly,weekday1,weekday2));
	}
	public static int displaydate(int fromd,int fromm,int fromy,int tod,int tom,int toy,int ld,int lm,int ly,String weekday1,String weekday2)
	{
		ArrayList<String> al=new ArrayList<String>();
		int a[]={31,28,31,30,31,30,31,31,30,31,30,31};
		int count=0;
		int c=0;
		boolean incorrect=false;
		if(fromy>toy||fromm>tom&&fromy==toy||fromy==toy&&fromm==tom&&fromd>tod)
		{
			incorrect=true;
			System.err.println("[ERROR]-----Fromdate and Todate is incorrect-----[ERROR]");
			
		}
		else if(fromy==toy&&fromm==tom)
		{
			if(fromy%4==0)
			{
				a[1]=29;
			}
			else
			{
				a[1]=28;
			}
			for(int i=fromd;i<=tod;i++)
			{
				if(weekday1!=day(i,fromm,fromy)&&weekday2!=day(i,fromm,fromy))
				{
					//System.out.println(fromm+"/"+i+"/"+fromy);
					al.add(fromm+"/"+i+"/"+fromy);
					count++;
				}
				c++;
			}
		}
		else if(fromy==toy)
		{
			if(fromy%4==0)
			{
				a[1]=29;
			}
			else
			{
				a[1]=28;
			}
			for(int i=fromm;i<=tom;i++)
			{
				
				if(i==tom)
				{
					for(int k=1;k<=tod;k++)
					{
						if(weekday1!=day(k,i,fromy)&&weekday2!=day(k,i,fromy))
						{
							//System.out.println(i+"/"+k+"/"+fromy);
							al.add(i+"/"+k+"/"+fromy);
						count++;
						}
						c++;
					}
				}
				else if(fromm==i)
				{
					for(int n=fromd;n<=a[i-1];n++)
					{
						if(weekday1!=day(n,i,fromy)&&weekday2!=day(n,i,fromy))
						{
							//System.out.println(i+"/"+n+"/"+fromy);
							al.add(i+"/"+n+"/"+fromy);
						count++;
						}
						c++;
					}
				}
				else
				{
				for(int j=1;j<=a[i-1];j++)
				{
						if(weekday1!=day(j,i,fromy)&&weekday2!=day(j,i,fromy))
					{
							//System.out.println(i+"/"+j+"/"+fromy);
							al.add(i+"/"+j+"/"+fromy);
					count++;
					}
						c++;
				}
				}
			}
		}
		else if(fromm==lm&&fromy==ly&&fromd==ld)
		{
			
		}
		else
		{
			if(fromy%4==0)
			{
				a[1]=29;
			}
			else
			{
				a[1]=28;
			}
			for(int d=fromd;d<=a[fromm-1];d++)
			{
				if(weekday1!=day(d,fromm,fromy)&&weekday2!=day(d,fromm,fromy))
				{
					//System.out.println(fromm+"/"+d+"/"+fromy);
					al.add(fromm+"/"+d+"/"+fromy);
					count++;
				} 
				c++;
			}
			//System.out.println("total number of days:first month "+count);
			if(fromm==12)
			{
				fromm=1;
				fromy++;
			}
			else
			{
				fromm++;
			}
			
			for(int y=fromy;y<=toy;y++)
			{
				if(y%4==0)
				{
					a[1]=29;
				}
				else
				{
					a[1]=28;
				}
				for(int m=fromm;m<=12;m++)
				{
					if(y==toy&&m==tom)
					{
						break;
					}
				for(int d=1;d<=a[m-1];d++)
				{
					if(weekday1!=day(d,m,y)&&weekday2!=day(d,m,y))
					{
						//System.out.println(m+"/"+d+"/"+y);
					al.add(m+"/"+d+"/"+y);
						count++;
					}
					c++;
				}
				if(y==toy&&m==tom)
				{
					break;
				}
				fromm=1;
				}
			}
			//System.out.println("total number of days:inner "+count);
			for(int d=1;d<=tod;d++)
			{
				if(weekday1!=day(d,tom,toy)&&weekday2!=day(d,tom,toy))
				{
					//System.out.println(tom+"/"+d+"/"+toy);
					al.add(tom+"/"+d+"/"+toy);
					count++;
				}
				c++;
			}
			//System.out.println("total number of days: "+count);

		}
//System.out.println("Total days not including saturday and sunday:"+count+" total days:"+c);
return(count);
	}
	public static boolean Leap(int year)
	{
		boolean b;
		if(year%4==0)
		{
			return(b=true);
		}
		else
		{
		 return(b=false);	
		}
	}
public static String day(int d, int m, int year)
{
	String[] days={"sun","mon","tue","wed","thu","fri","sat"};
   int n = (d + 5 * ((year - 1) % 4) + 4 * ((year - 1) % 100) + 6 * ((year - 1) % 400)) % 7;

   switch (m) {
        case 12: n += 30;
        case 11: n += 31;
        case 10: n += 30;
        case 9:  n += 31;
        case 8:  n += 31;
        case 7:  n += 30;
        case 6:  n += 31;
        case 5:  n += 30;
        case 4:  n += 31;
        case 3:  n += 28;
                 if(Leap(year)) { n++; }
        case 2:  n += 31;
    }
   //System.out.println(days[n%7]);
    return(days[n % 7]);
}

	
	/*public static void main(String[] args)
	{
		actualhours("07/01/2018");
		Scanner scn=new Scanner(System.in);
		System.out.println("Enter the fromdate :");
		String fromdate=scn.next();
		System.out.println("Enter the to date:");
		String todate=scn.next();
		System.out.println(splittingoperation(fromdate,todate));
	}*/
}
