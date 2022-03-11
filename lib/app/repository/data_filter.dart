
import 'dart:developer';

class DataFilter {
  
  static List<Map<String, dynamic>> catalogDataFilter(
    List<Map<String, dynamic>> data, {
    String? car,
    String? year,
    String? ccMotor,
    bool? acd,
    bool? dh,
    bool? gnv,
    bool? abs,
    bool? ta,
  }) {
    List<Map<String, dynamic>> dataFilter = data;

    // Filtro de carro
    if (car != null && car != '') {
      dataFilter.removeWhere((element) =>
          !element['carro'].toString().contains(car.toLowerCase()));
    }
    // Filtro de ano
    if (year != null && year != 'Todos') {
      dataFilter.removeWhere((element) {
        if (element['ano'] == null) return false;

        final yearElement = element['ano'].toString().split('/');
        int convertYear = int.parse(year);

        if (yearElement[0] != '...') {
          int initYear = int.parse(yearElement[0]);
          if (initYear > convertYear) return true;
        }
        if (yearElement[1] != '...') {
          int endYear = int.parse(yearElement[1]);
          if (endYear < convertYear) return true;
        }
        return false;
      });
    }
    // Filtro do Motor
    if(ccMotor != null && ccMotor != ''){
      dataFilter.removeWhere((element){
        if(element['motor'] == null){
          return false;
        }else if(element['motor'] != ccMotor){
          return true;
        }
        return false;        
      });      

    }
    return dataFilter;
  }

}