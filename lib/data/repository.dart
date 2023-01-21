import 'package:chatty/data/responses/conversation_response.dart';
import 'package:chatty/data/responses/inbox_response.dart';
import 'package:chatty/data/utils/api_interceptor.dart';
import 'package:chatty/data/utils/types.dart';
import 'package:chatty/domain/message.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  final conversation = 'conversation';

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

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(conversation, response.body);

    return ConversationResponse(response.body);
  }

  Future<List<Message>> getCurrentMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final String localConversation = prefs.getString(conversation) ?? '';
    final conversationResponse = ConversationResponse(localConversation);
    return conversationResponse.getMessages();
  }
}
