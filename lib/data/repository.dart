import 'package:chatty/core/api_interceptor.dart';
import 'package:chatty/core/types.dart';
import 'package:chatty/data/response/conversation_response.dart';
import 'package:chatty/data/response/inbox_response.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<ApiResponse<InboxResponse>> fetchInboxItems() async {
    return apiInterceptor(() => _getInboxItems());
  }

  Future<InboxResponse> _getInboxItems() async {
    final response = await http.get(Uri.parse(
        'https://jefe-stg-media-bucket.s3.amazonaws.com/programming-test/api/inbox.json'));
    return InboxResponse(response.body);
  }

  Future<ApiResponse<ConversationResponse>> fetchConversation(String id) async {
    return apiInterceptor(() => _getConversation(id));
  }

  Future<ConversationResponse> _getConversation(String id) async {
    final response = await http.get(Uri.parse(
        'https://jefe-stg-media-bucket.s3.amazonaws.com/programming-test/api/$id.json'));
    return ConversationResponse(response.body);
  }
}
