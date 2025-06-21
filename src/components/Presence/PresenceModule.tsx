import React from 'react';
import { Card } from '../ui/Card';
import { Button } from '../ui/Button';
import { Send, BarChart3 } from 'lucide-react';
import { PresenceData } from '../../types';

interface PresenceModuleProps {
  data: PresenceData;
  onDataUpdate: (data: Partial<PresenceData>) => void;
}

export function PresenceModule({ data, onDataUpdate }: PresenceModuleProps) {
  const [inputMessage, setInputMessage] = React.useState('');
  const [showAnalysis, setShowAnalysis] = React.useState(false);

  const handleSendMessage = () => {
    if (inputMessage.trim()) {
      const newMessage = {
        id: Date.now().toString(),
        text: inputMessage,
        isUser: true,
        timestamp: new Date()
      };

      const botResponse = {
        id: (Date.now() + 1).toString(),
        text: "I understand. Let me help you develop stronger presence through targeted communication strategies. What specific situation would you like to improve?",
        isUser: false,
        timestamp: new Date()
      };

      onDataUpdate({
        messages: [...data.messages, newMessage, botResponse]
      });
      setInputMessage('');
    }
  };

  const handleAnalyze = () => {
    const mockAnalysis = {
      score: 72,
      critique: "Your communication shows confidence but could benefit from more strategic pausing and vocal projection.",
      actionPlan: []
    };
    
    onDataUpdate({ analysis: mockAnalysis });
    setShowAnalysis(true);
  };

  return (
    <div className="min-h-screen bg-gray-50 flex flex-col">
      <div className="flex-1 pt-8 pb-4 px-6">
        <div className="max-w-2xl mx-auto">
          <div className="text-center space-y-2 mb-8">
            <h1 className="text-2xl font-light text-black">Presence Coach</h1>
            <p className="text-gray-600">Develop commanding presence and communication skills</p>
          </div>

          {/* Messages */}
          <div className="space-y-4 mb-4">
            {data.messages.length === 0 ? (
              <Card className="p-8 text-center">
                <BarChart3 className="w-12 h-12 text-gray-300 mx-auto mb-4" />
                <h3 className="text-lg font-medium text-black mb-2">Start Your Presence Journey</h3>
                <p className="text-gray-600">
                  Ask me anything about developing stronger presence, confidence, or communication skills.
                </p>
              </Card>
            ) : (
              data.messages.map((message) => (
                <div
                  key={message.id}
                  className={`flex ${message.isUser ? 'justify-end' : 'justify-start'}`}
                >
                  <div
                    className={`max-w-xs lg:max-w-md px-4 py-2 rounded-lg ${
                      message.isUser
                        ? 'bg-black text-white'
                        : 'bg-white border border-gray-200 text-gray-900'
                    }`}
                  >
                    <p className="text-sm">{message.text}</p>
                  </div>
                </div>
              ))
            )}
          </div>

          {/* Analyze Button */}
          {data.messages.filter(m => m.isUser).length >= 2 && (
            <div className="mb-4">
              <Button
                onClick={handleAnalyze}
                variant="outline"
                className="w-full"
              >
                <BarChart3 className="w-4 h-4 mr-2" />
                Analyze My Presence
              </Button>
            </div>
          )}
        </div>
      </div>

      {/* Input Area */}
      <div className="bg-white border-t border-gray-200 p-4 pb-24">
        <div className="max-w-2xl mx-auto">
          <div className="flex space-x-2">
            <input
              type="text"
              value={inputMessage}
              onChange={(e) => setInputMessage(e.target.value)}
              onKeyPress={(e) => e.key === 'Enter' && handleSendMessage()}
              placeholder="Ask your question..."
              className="flex-1 px-4 py-2 border border-gray-300 rounded-full focus:outline-none focus:ring-2 focus:ring-black focus:border-transparent"
            />
            <Button
              onClick={handleSendMessage}
              disabled={!inputMessage.trim()}
              className="rounded-full px-4"
            >
              <Send className="w-4 h-4" />
            </Button>
          </div>
        </div>
      </div>

      {/* Analysis Modal */}
      {showAnalysis && data.analysis && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4 z-50">
          <Card className="w-full max-w-md p-6 space-y-4">
            <h2 className="text-xl font-medium text-black">Presence Analysis</h2>
            
            <div className="text-center space-y-2">
              <div className="text-3xl font-light text-black">
                Presence Score: {data.analysis.score}
              </div>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div 
                  className="bg-black h-2 rounded-full" 
                  style={{ width: `${data.analysis.score}%` }}
                ></div>
              </div>
            </div>

            <div>
              <h3 className="font-medium text-black mb-2">Summary</h3>
              <p className="text-gray-700 text-sm leading-relaxed">
                {data.analysis.critique}
              </p>
            </div>

            <Button
              onClick={() => setShowAnalysis(false)}
              className="w-full"
              variant="primary"
            >
              Close
            </Button>
          </Card>
        </div>
      )}
    </div>
  );
}