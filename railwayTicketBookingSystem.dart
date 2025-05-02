import 'dart:io';
void main(){
  List<Map<String,dynamic>>trains=[
    {
      'name':'InterCity Express',
      'route':'Dhaka -> Sylhet',
      "time":'08:30 AM',
      'seats':<int,String?>{for(int i=1;i<=10;i++) i:null }
      /*
       i: null → in each iteration, creates a key-value pair:
        i is the seat number (1 to 10).
        null means the seat is unbooked.
       */      
    },
    {
      'name':'Padma Express',
      'route':'Sylhet -> Borishal',
      'time':'09:30 AM',
      'seats':<int,String?>{for(int i=1;i<=10;i++)i:null}
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
    else if(Chose==3)bookSeats(trains);
    else if(Chose==4)cancelSeat(trains);
    else if(Chose==5)viewAllBookedSeat(trains);
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
  if(index!=null&&index<=trains.length){
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
  print("Seat Availability for ${trains[tIndex]['name']}:");
  for(int i=1;i<=seats.length;i++){
    String status=seats[i]==null? "Available":"Booked by ${seats[i]}";
    print("Seat -> $i ${status}");
  }
}


void bookSeats(List<Map<String,dynamic>>trains){
  int? tIndex=choiceTrains(trains);
  if(tIndex==null){
    print('Empty Trains!');
    return;
  }
  print('Enter your name:');
  String? name=stdin.readLineSync();
  print('Enter your seat number to booking like (2,4)');
  List<String>inputs=(stdin.readLineSync()?? '').split(',');
 
  var seats=trains[tIndex]['seats'] as Map<int,String?>;
  List<int>booked=[];
  for(String seatStr in inputs){
    int seatNum=int.parse(seatStr.trim());
    if(seatNum!=null&& seats.containsKey(seatNum)){

          if(seats[seatNum]==null){
            seats[seatNum]=name;
            booked.add(seatNum);
          }
          else{
            print('Seat number $seatNum is already booked by ${seats[seatNum]}');
          }
      
    }
    else{
      print('Invalid seat number:$seatNum');
    }
  }
  
  if(booked.isNotEmpty){
    print("Booked seats ${booked.join(',')} for $name on ${trains[tIndex]['name']}");
  }
  else{
    print('No seats were booked!');
  }
}

 
void cancelSeat(List<Map<String,dynamic>>trains){
  int? tIndex=choiceTrains(trains);
  if(tIndex==null){
    print("Invalid and Empty!");
    return;
  }
  print("Enter the seat number which want to cancel:");
  int seatNum=int.parse(stdin.readLineSync()??'');
  var seats=trains[tIndex]['seats'] as Map<int,String?>;
  //print(seats);

  if(seatNum==null||!seats.containsKey(seatNum)){
    print('Invalid Input!');
    return;
  }  
      if(seats[seatNum]==null){
        print("Seat $seatNum is already available!");
        return;
      }
      
        print("Seats ${seats[seatNum]} was booked.Now seat $seatNum cancel successfully!");
        seats[seatNum]=null;
}

void viewAllBookedSeat(List<Map<String,dynamic>>trains){
  int? tIndex=choiceTrains(trains);
  if(tIndex==null){
    print("Invalid!");
    return;
  }

  for(var train in trains){
    var seats=train['seats'] as Map<int,String?>;
    print("Train ${train['name'].toString().padRight(10)} Route : ${train['route'].toString().padRight(10)}");
    seats.forEach((seat, name) {
      if(name!=null){
        print("Seat number $seat booked by $name");
      }
     });
  }
  
  }