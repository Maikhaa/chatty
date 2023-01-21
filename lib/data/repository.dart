import 'package:chatty/core/api_interceptor.dart';
import 'package:chatty/core/types.dart';
import 'package:chatty/data/response/inbox_response.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<ApiResponse<InboxResponse>> fetchInboxItems() async {
    return apiInterceptor(() => getInboxItems());
  }

  Future<InboxResponse> getInboxItems() async {
    final response = await http.get(Uri.parse(
        'https://jefe-stg-media-bucket.s3.amazonaws.com/programming-test/api/inbox.json'));

    return InboxResponse(response.body);
  }
}
