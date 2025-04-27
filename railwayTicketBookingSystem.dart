import 'dart:io';
void main(){
  List<Map<String,dynamic>>trains=[
    {
      'name':'InterCity Express',
      'route':'Dhaka -> Sylhet',
      "time":'08:30 AM',
      'seats':{for(int i=1;i<=10;i++) i:null }
    },
    {
      'name':'Padma Express',
      'route':'Sylhet -> Borishal',
      'time':'09:30 AM',
      'seats':{for(int i=1;i>=10;i++)i:null}
    }
  ];
  while(true){
    print(".....Railway Ticket Boooking System.....");
    print("1.View Trains");
    print('2.View Availavle Seats');
    print('3.Book Seats');
    print('4.Cancle Booking ');
    print('5.View All Bookings');
    print('6.Search by Passenger Name');
    print('7.Show Booking Summary');
    print('8.Dashboard');
    print('9.Admin Panel');
    print('10.Exit');

    print('Chose an option (1-10):');
    int Chose=int.parse(stdin.readLineSync()!);
    if(Chose==1);
    else if(Chose==2);
    else if(Chose==3);
    else if(Chose==4);
    else if(Chose==5);
    else if(Chose==6);
    else if(Chose==7);
    else if(Chose==8);
    else if(Chose==9);
    else if(Chose==10)
    {
      print('Exiting... Thank you!');
      break;
    }
    else{
      print("Invalid choice! Try again!");
    }
  }
}