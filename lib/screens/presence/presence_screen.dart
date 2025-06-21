import 'package:flutter/material.dart';
import '../../models/user_model.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_button.dart';

class PresenceScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  final Function(Map<String, dynamic>) onDataUpdate;

  const PresenceScreen({
    super.key,
    required this.data,
    required this.onDataUpdate,
  });

  @override
  State<PresenceScreen> createState() => _PresenceScreenState();
}

class _PresenceScreenState extends State<PresenceScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _showAnalysis = false;

  List<PresenceMessage> get messages {
    final messagesList = widget.data['messages'] as List<dynamic>? ?? [];
    return messagesList
        .map((json) => PresenceMessage.fromJson(json))
        .toList();
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    final userMessage = PresenceMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: _messageController.text,
      isUser: true,
      timestamp: DateTime.now(),
    );

    final botResponse = PresenceMessage(
      id: (DateTime.now().millisecondsSinceEpoch + 1).toString(),
      text: "I understand. Let me help you develop stronger presence through targeted communication strategies. What specific situation would you like to improve?",
      isUser: false,
      timestamp: DateTime.now(),
    );

    final updatedMessages = [...messages, userMessage, botResponse];
    
    widget.onDataUpdate({
      'messages': updatedMessages.map((m) => m.toJson()).toList(),
    });

    _messageController.clear();
    
    // Scroll to bottom
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void _analyzePresence() {
    final mockAnalysis = {
      'score': 72,
      'critique': 'Your communication shows confidence but could benefit from more strategic pausing and vocal projection.',
    };
    
    widget.onDataUpdate({'analysis': mockAnalysis});
    setState(() {
      _showAnalysis = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userMessages = messages.where((m) => m.isUser).toList();
    
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: Column(
        children: [
          // Header
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Text(
                    'Presence Coach',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: 'LibreBaskerville',
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Develop commanding presence and communication skills',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontFamily: 'LibreBaskerville',
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          
          // Messages
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: messages.isEmpty
                  ? CustomCard(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.bar_chart_outlined,
                            size: 48,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Start Your Presence Journey',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontFamily: 'LibreBaskerville',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Ask me anything about developing stronger presence, confidence, or communication skills.',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontFamily: 'LibreBaskerville',
                              color: Colors.grey[600],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      itemCount: messages.length + (userMessages.length >= 2 ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (userMessages.length >= 2 && index == messages.length) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: CustomButton(
                              text: 'Analyze My Presence',
                              onPressed: _analyzePresence,
                              variant: ButtonVariant.outline,
                              fullWidth: true,
                              icon: const Icon(Icons.bar_chart_outlined, size: 16),
                            ),
                          );
                        }
                        
                        final message = messages[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            mainAxisAlignment: message.isUser
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                                ),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: message.isUser ? Colors.black : Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  border: message.isUser
                                      ? null
                                      : Border.all(color: Colors.grey[200]!),
                                ),
                                child: Text(
                                  message.text,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'LibreBaskerville',
                                    color: message.isUser ? Colors.white : Colors.grey[900],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ),
          
          // Input Area
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.grey[200]!),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: 'Ask your question...',
                          hintStyle: TextStyle(
                            fontFamily: 'LibreBaskerville',
                            color: Colors.grey[400],
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: const BorderSide(color: Colors.black, width: 2),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'LibreBaskerville',
                        ),
                        onSubmitted: (_) => _sendMessage(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: _messageController.text.trim().isNotEmpty
                            ? _sendMessage
                            : null,
                        icon: const Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      
      // Analysis Modal
      body: _showAnalysis && widget.data['analysis'] != null
          ? Stack(
              children: [
                // Main content (already built above)
                Column(
                  children: [
                    // ... (same content as above)
                  ],
                ),
                
                // Modal overlay
                Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: CustomCard(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Presence Analysis',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontFamily: 'LibreBaskerville',
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Presence Score: ${widget.data['analysis']['score']}',
                              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                fontFamily: 'LibreBaskerville',
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              width: double.infinity,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor: widget.data['analysis']['score'] / 100,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Summary',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontFamily: 'LibreBaskerville',
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.data['analysis']['critique'],
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontFamily: 'LibreBaskerville',
                                color: Colors.grey[700],
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 16),
                            CustomButton(
                              text: 'Close',
                              onPressed: () => setState(() => _showAnalysis = false),
                              fullWidth: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : null,
    );
  }
}