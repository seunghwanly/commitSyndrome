import 'package:firebase_database/firebase_database.dart';

class FirebaseMethod {
  // firebase 에서 Database 에 접근할 Reference path
  // : child 까지 선언해주고 나머지 작업은 function 별로 기능을 나누어서 구현하는 게 편할 거에요
  // once() = 데이터베이스를 한번만 읽어오는 용도, 보통 setState()로 빌드 하기전에 한번 읽어오는 역할 주로 해요
  // onChildAdded, onChildChanged = 실시간으로 데이터베이스를 읽어올 때 사용해요. once() 랑은 사용법이 달라요.
  // 현재 플러터에서 제대로된 사용법을 제가 잘 몰라서 우선 onChildAdded 와 onChildChanged 가 listen 으로 해서 값을 감지하는데
  // 아직 잔 오류가 있는지 잘 안된다는 이슈가 많아서 StreamBuilder 를 사용합니다 !
  /*
    1. State<T> 클래스 안에 먼저 사용할 DatabaseReference와 데이터를 넣을 변수를 선언해줍니다.
    2. initState() 안에 once() 로 변수에 값을 저장해줍니다.
    3. rendering 할 component를 StreamBuilder()로 선언해주시고, stream: 여기에 선언한 DataRefernece.onValue 를 작성해주시면됩니다.
    [코드 예시]
    class _MenuListState extends State<MenuList> {
      DatabaseReference menuReference = FirebaseDatabase.instance.reference().child(PATH);
      var _menuList;
      @override
      void initState() {
        super.initState();
        
        //init state
        menuReference.once().then((DataSnapshot snapshot) {
          if(snapshot.value != null) {
            setState(() => _menuList = snapshot.value);
          }
          else {
            // init when fetched data is null
          }
        });
      }
      @override
      void dispose() {
        super.dispose();
        // database off
        menuReference.onDisconnect();
      }
      @override
      Widget build(BuildContext context) {
        return sth(
          child : StreamBuilder(
            stream: menuReference.onValue,  // 데이터베이스가 변할 때 마다 확인할 경로 : 구독할 PATH -> onValue를 사용합니다
            builder: (context, AsyncSnapshot<Event> snapshot) {
              if(snapshot.hasData) {
                return snapshot.data.snapshot.value;
              }
            }
          )
        )
      }
    }
    => 이거는 제 추측인데 builder에서 사용한 괄호 안에있는 snapshot은 AsyncSnapshot으로 받아오는 Event 성 데이터라 snapshot의 data 까지 
    한번에 읽어오는 데이터로 판단되어서 snapshot.data 까지 접근을 해야 기존에 사용했던 once() 와 같은 접근법으로 사용할 수 있을 것 같습니다 !
    Firebase Realtime Database 구조 : 트리 구조
    - key 
      ㄴ key 
          ㄴ key : value
    작성자 : 이승환, 2020/11/19
  */

  // DataReference
  //menu
  DatabaseReference menuReference =
      FirebaseDatabase.instance.reference().child('manager/menu/category');
  //stock
  DatabaseReference stockReference =
      FirebaseDatabase.instance.reference().child('manager/stock/currentStock');

  // order
  DatabaseReference salesReference =
      FirebaseDatabase.instance.reference().child('order');
  // expense
  DatabaseReference expenseReference =
      FirebaseDatabase.instance.reference().child('manager/sales/expense');
  // profit
  DatabaseReference profitReference =
      FirebaseDatabase.instance.reference().child('manager/sales/profit');

  // menu
  getMenuData() async {
    var fetchedData;

    await menuReference.once().then((DataSnapshot snapshot) {
      fetchedData = new Map<String, dynamic>.from(snapshot.value);
    });
    return fetchedData;
  }

  // stock
  getCurrentStockData() async {
    var fetchedData;
    await stockReference.once().then((DataSnapshot snapshot) {
      fetchedData = new Map<String, dynamic>.from(snapshot.value);
    });
    return fetchedData;
  }

  // sales
  getTotalSalesData() async {
    var fetchedData;
    await salesReference.once().then((DataSnapshot snapshot) {
      // print(snapshot.value.runtimeType);
      // print(snapshot.value.toString());
      fetchedData = new Map<String, dynamic>.from(snapshot.value);
    });
    return fetchedData;
  }

  // expense
  getTotalExpenseData() async {
    var fetchedData;
    await expenseReference.once().then((DataSnapshot snapshot) {
      fetchedData = new Map<String, dynamic>.from(snapshot.value);
    });
    return fetchedData;
  }

  // profit
  getTotalProfitData() async {
    var fetchedData;
    await profitReference.once().then((DataSnapshot snapshot) {
      fetchedData = new Map<String, dynamic>.from(snapshot.value);
    });
    return fetchedData;
  }
}
