class EntriesData {
  String desc;
  String acName;
  String catName;
  String subCatName;
  double amount;
  int msSinceEpoch;

  EntriesData(String desc, String acName, String catName, String subCatName, double amount, int msSinceEpoch) {
    this.desc = desc;
    this.acName = acName;
    this.catName = catName;
    this.subCatName = subCatName;
    this.amount = amount;
    this.msSinceEpoch = msSinceEpoch;
  }

  EntriesData.noSubCat(String desc, String acName, String catName, double amount, int msSinceEpoch) {
    this.desc = desc;
    this.acName = acName;
    this.catName = catName;
    this.subCatName = "";
    this.amount = amount;
    this.msSinceEpoch = msSinceEpoch;
  }

}
