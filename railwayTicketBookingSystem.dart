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
    print("\n.....Railway Ticket Boooking System.....");
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
    if(Chose==1)viewTrains(trains);
    else if(Chose==2)viewSeats(trains);
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



void viewTrains(List<Map<String,dynamic>>trains){
  print('..............Available Trains..............');
  for(int i=0;i<trains.length;i++){
    var t=trains[i];
    print('${(i+1).toString().padRight(2)} Trains Name: ${t['name'].toString().padRight(15)} \tRoute is:${t['route'].toString().padRight(15)} \tDeparture time:${t['time'].toString().padRight(15)}');
  }
}



int? choiceTrains(List<Map<String,dynamic>>trains){
  viewTrains(trains);
  print("Enter your choice train");
  int index=int.parse(stdin.readLineSync()?? '');
  if(index!=null&&index<trains.length){
    return index-1;
  }
  else{
    print('Invalid choice. Try again!');
    return null;
  }
}



void viewSeats(List<Map<String,dynamic>>trains){
  int? tIndex=choiceTrains(trains);
  if(tIndex==null){
    print('Invalid!');
    return;
  }
  var seats=trains[tIndex]['seats'] as Map <int,String?>;
  print("Seat Availability for ${trains[tIndex]['name']}");
  for(int i=1;i<=seats.length;i++){
    String status=seats[i]==null? "Available":"Booked by ${seats[i]}";
    print("Seat is ${status}");
  }
}