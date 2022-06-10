abstract class AppStates {}

class Initstate extends AppStates{}

class LoadingData extends AppStates{}
class getDataSucces extends AppStates{
  final String message , code;

  getDataSucces(this.message, this.code);
}
class DataError extends AppStates{}

// class CreatDataBase extends AppStates{}
// class GetFormDataBase extends AppStates{}
// class InsertInDataBase extends AppStates{}
// class GetFormDataBaseLooding extends AppStates{}
//
// class UpdateStateInDataBase extends AppStates{}
//
// class DeletInDataBase extends AppStates{}

