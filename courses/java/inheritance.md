## Heading*
* Bullet 1
* Bullet 2
* ...


## Sample picture
<img src=media/AbstractFactory.png width=650 height=400 /></br>
<!-- * //TODO image from c++ book pg.241 -->


## Sample code
```java
import java.util.Scanner;
import java.lang.*;

public class Tin2{
public static void main (String[] args){

    int [] tin = new int[9];  //array tin 9 digits
    int i, j;
    int sum = 0;

        Scanner a= new Scanner(System.in);
        System.out.println("Enter Tax Identification Number: "); // user input

             for (i = tin.length-1; i >= 0; i--){
            tin[i] = a.nextInt();      // input reverse into array tin

            }
            System.out.println(sum);
            for (j = 1; j <= tin.length-1; j++) {

            sum += tin[j]*Math.pow(2,j);
             System.out.println("Meriko sum="+sum);

            }
            System.out.println(sum);

                sum %= 11;
                System.out.println(sum);
                sum %= 10;
                System.out.println(sum);

            if(sum==tin[0])
                System.out.println("Tax Identification Number valid.");
            else
                System.out.println("Tax Identification Number not valid.");
    }
}
}
```
