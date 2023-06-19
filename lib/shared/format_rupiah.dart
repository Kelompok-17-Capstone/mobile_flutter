  String formatRupiah(int price){
    String priceToString = price.toString();
    String priceInText = "";
    int counter = 0;
    for(int i = (priceToString.length - 1);  i >= 0; i--){
      counter++;
      String str = priceToString[i];
      if((counter % 3) != 0 && i !=0){
        priceInText = "$str$priceInText";
      }else if(i == 0 ){
        priceInText = "$str$priceInText";
      
      }else{
        priceInText = ".$str$priceInText";
      }
    }

    return 'Rp ${priceInText.trim()}';
  }