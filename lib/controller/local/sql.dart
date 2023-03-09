import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../model/job_model.dart';

class DatabaseHandler {
  DatabaseHandler();

  late Database database;
  List<JobModel> jobs = [];

  void createDatabase() async {
    String path = await getDatabasesPath();

    database = await openDatabase(join(path, 'job_finder.db'), version: 1,
        onCreate: (database, version) {
      print("database created");

      database
          .execute(
              'CREATE TABLE job (id INTEGER PRIMARY KEY, title TEXT, sup_title TEXT, img TEXT, status TEXT, property1 TEXT, property2 TEXT, property3 TEXT, salary TEXT, is_applied TEXT)')
          .then((value) {
        print("table created");
      }).catchError((error) {
        print("Error when create Table ${error.toString()}");
      });
    }, onOpen: (database) {
      print("database opened");
    });
  }

  Future insertIntoDatabase(JobModel job) async {
    return await database.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO job (title, sup_title, img, status, property1, property2, property3, salary, is_applied) VALUES ("${job.jobTitle}", "${job.jobTitle}", "${job.jobImage}", "${job.savedJob}", "${job.firstProperty}", "${job.secondProperty}", "${job.thirdProperty}", "${job.salary}","${job.isApplied}", )')
          .then((value) {
        print("$value inserted successfully");
      }).catchError((error) {
        print("Error while inserting record ${error.toString()}");
      });
      return null;
    });
  }

  Future getFromDatabase() async {
    return await database.rawQuery("SELECT * FROM job").then((value) {
      jobs = [];
      value.forEach((element) {
        jobs.add(JobModel(
          jobTitle: element['title'].toString(),
          jobSubTitle: element['sup_title'].toString(),
          jobImage: element['img'].toString(),
          savedJob: element['status'].toString(),
          firstProperty: element['property1'].toString(),
          secondProperty: element['property2'].toString(),
          thirdProperty: element['property3'].toString(),
          salary: element['salary'].toString(),
          isApplied: element['is_applied'].toString(),
          // description: element['description'].toString(),
          // company: element['company'].toString(),
          // people: element['people'].toString(),
        ));
      });
      print(jobs.length);
    }); //print(tasks[0].title);
  }
}
