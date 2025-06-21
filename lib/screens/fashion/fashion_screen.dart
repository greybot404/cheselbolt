import 'package:flutter/material.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_button.dart';

class FashionScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  final Function(Map<String, dynamic>) onDataUpdate;

  const FashionScreen({
    super.key,
    required this.data,
    required this.onDataUpdate,
  });

  @override
  State<FashionScreen> createState() => _FashionScreenState();
}

class _FashionScreenState extends State<FashionScreen> {
  final TextEditingController _occasionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.data['mode'] == null) {
      return _buildModeSelection(context);
    }

    if (widget.data['mode'] == 'review' && widget.data['outfit'] == null) {
      return _buildUploadOutfit(context);
    }

    if (widget.data['mode'] == 'review' && 
        widget.data['outfit'] != null && 
        widget.data['occasion'] == null) {
      return _buildSpecifyOccasion(context);
    }

    return _buildResults(context);
  }

  Widget _buildModeSelection(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 32),
              
              // Header
              Column(
                children: [
                  Text(
                    'Fashion Intelligence',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: 'LibreBaskerville',
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Elevate your style with AI-powered insights',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontFamily: 'LibreBaskerville',
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 32),
              
              Expanded(
                child: Column(
                  children: [
                    CustomCard(
                      onTap: () => widget.onDataUpdate({'mode': 'review'}),
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 32,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Outfit Review',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontFamily: 'LibreBaskerville',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Get a critical score on your current outfit.',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontFamily: 'LibreBaskerville',
                              color: Colors.grey[600],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    CustomCard(
                      onTap: () => widget.onDataUpdate({'mode': 'finder'}),
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Icon(
                            Icons.search_outlined,
                            size: 32,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Outfit Finder',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontFamily: 'LibreBaskerville',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Identify items in a photo.',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontFamily: 'LibreBaskerville',
                              color: Colors.grey[600],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    CustomCard(
                      onTap: () => widget.onDataUpdate({'mode': 'stylist'}),
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Icon(
                            Icons.auto_awesome_outlined,
                            size: 32,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Personal Stylist',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontFamily: 'LibreBaskerville',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Get an outfit suggestion for an occasion.',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontFamily: 'LibreBaskerville',
                              color: Colors.grey[600],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUploadOutfit(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 32),
              
              // Header
              Column(
                children: [
                  Text(
                    'Upload Your Outfit',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: 'LibreBaskerville',
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Take a clear photo of your complete outfit',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontFamily: 'LibreBaskerville',
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              
              const Spacer(),
              
              CustomCard(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    Icon(
                      Icons.upload_outlined,
                      size: 64,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 24),
                    CustomButton(
                      text: 'Upload Outfit Photo',
                      onPressed: () => widget.onDataUpdate({'outfit': 'uploaded'}),
                      fullWidth: true,
                    ),
                  ],
                ),
              ),
              
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSpecifyOccasion(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 32),
              
              // Header
              Column(
                children: [
                  Text(
                    'Specify Occasion',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: 'LibreBaskerville',
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Help us provide the most relevant feedback',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontFamily: 'LibreBaskerville',
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              
              const Spacer(),
              
              CustomCard(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Occasion',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontFamily: 'LibreBaskerville',
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _occasionController,
                      decoration: InputDecoration(
                        hintText: 'e.g., Board Meeting, Casual Weekend, etc.',
                        hintStyle: TextStyle(
                          fontFamily: 'LibreBaskerville',
                          color: Colors.grey[400],
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.black, width: 2),
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: 'LibreBaskerville',
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      text: 'Analyze Outfit',
                      onPressed: _occasionController.text.length >= 5
                          ? () => widget.onDataUpdate({'occasion': _occasionController.text})
                          : null,
                      fullWidth: true,
                    ),
                  ],
                ),
              ),
              
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResults(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 32),
              
              // Header
              Column(
                children: [
                  Text(
                    'Fashion Analysis',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: 'LibreBaskerville',
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Your style assessment and recommendations',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontFamily: 'LibreBaskerville',
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 32),
              
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Image Panel
                      CustomCard(
                        padding: const EdgeInsets.all(24),
                        child: AspectRatio(
                          aspectRatio: 3 / 4,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 48,
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Score Card
                      CustomCard(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            Text(
                              'Review Score',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontFamily: 'LibreBaskerville',
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '82',
                              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontFamily: 'LibreBaskerville',
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Critique Card
                      CustomCard(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Stylist\'s Critique',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontFamily: 'LibreBaskerville',
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Excellent color coordination and fit. The navy blazer complements your complexion well. Consider adding a pocket square for elevated sophistication.',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontFamily: 'LibreBaskerville',
                                color: Colors.grey[700],
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Enhancement Protocol Card
                      CustomCard(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Enhancement Protocol',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontFamily: 'LibreBaskerville',
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontFamily: 'LibreBaskerville',
                                      color: Colors.grey[700],
                                    ),
                                    children: const [
                                      TextSpan(text: '• '),
                                      TextSpan(
                                        text: 'Suggestion: ',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: 'Swap the leather belt for a woven one to add texture.',
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                RichText(
                                  text: TextSpan(
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontFamily: 'LibreBaskerville',
                                      color: Colors.grey[700],
                                    ),
                                    children: const [
                                      TextSpan(text: '• '),
                                      TextSpan(
                                        text: 'Upgrade: ',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: 'Consider Italian leather loafers for a premium finish.',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}