class PaginatedResponse<T> {
  final T data;
  final int totalItems;

  PaginatedResponse(this.data, this.totalItems);
}
