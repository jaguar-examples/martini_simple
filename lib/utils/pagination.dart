class PaginationInfo {
  final int number;

  final int itemsPerPage;

  final itemsInThisPage;

  PaginationInfo(this.itemsPerPage, this.number, this.itemsInThisPage);

  int get start => (number - 1) * itemsPerPage;

  int get end => start + itemsInThisPage;
}