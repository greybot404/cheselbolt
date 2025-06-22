import React, { useState } from 'react';
import { motion } from 'framer-motion';
import { Sparkles, Heart, Brain, Users } from 'lucide-react';
import { Card } from '../ui/Card';

const PresenceModule: React.FC = () => {
  const [selectedAspect, setSelectedAspect] = useState('confidence');

  const presenceAspects = [
    {
      id: 'confidence',
      name: 'Confidence',
      icon: Sparkles,
      score: 85,
      description: 'Your self-assurance and inner strength',
      tips: [
        'Practice power poses for 2 minutes daily',
        'Maintain eye contact during conversations',
        'Speak with clear, measured pace'
      ]
    },
    {
      id: 'charisma',
      name: 'Charisma',
      icon: Heart,
      score: 78,
      description: 'Your ability to attract and influence others',
      tips: [
        'Show genuine interest in others',
        'Use open body language',
        'Share authentic stories'
      ]
    },
    {
      id: 'mindfulness',
      name: 'Mindfulness',
      icon: Brain,
      score: 92,
      description: 'Your awareness and presence in the moment',
      tips: [
        'Practice daily meditation',
        'Focus on breath awareness',
        'Observe without judgment'
      ]
    },
    {
      id: 'social',
      name: 'Social Skills',
      icon: Users,
      score: 73,
      description: 'Your ability to connect and communicate',
      tips: [
        'Practice active listening',
        'Ask thoughtful questions',
        'Remember personal details'
      ]
    }
  ];

  const dailyPractices = [
    { name: 'Morning Affirmations', completed: true, streak: 12 },
    { name: 'Posture Check', completed: true, streak: 8 },
    { name: 'Gratitude Journal', completed: false, streak: 5 },
    { name: 'Social Interaction', completed: true, streak: 15 },
  ];

  const selectedAspectData = presenceAspects.find(aspect => aspect.id === selectedAspect);

  return (
    <div className="space-y-8 py-8">
      {/* Header */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.6 }}
        className="text-center"
      >
        <h2 className="text-2xl font-light text-black mb-2">Presence & Charisma</h2>
        <p className="text-gray-600 font-light">Develop your magnetic personality</p>
      </motion.div>

      {/* Presence Overview */}
      <div className="grid grid-cols-2 gap-4">
        {presenceAspects.map((aspect, index) => {
          const Icon = aspect.icon;
          return (
            <motion.button
              key={aspect.id}
              onClick={() => setSelectedAspect(aspect.id)}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: index * 0.1, duration: 0.6 }}
              className={`p-6 border transition-all duration-300 text-left ${
                selectedAspect === aspect.id
                  ? 'bg-black text-white border-black'
                  : 'bg-white text-black border-gray-200 hover:border-gray-400'
              }`}
              whileHover={{ scale: 1.02 }}
              whileTap={{ scale: 0.98 }}
            >
              <Icon className={`w-5 h-5 mb-3 ${selectedAspect === aspect.id ? 'text-white' : 'text-gray-400'}`} />
              <div className={`font-light mb-2 ${selectedAspect === aspect.id ? 'text-white' : 'text-black'}`}>
                {aspect.name}
              </div>
              <div className={`text-2xl font-light mb-3 ${selectedAspect === aspect.id ? 'text-white' : 'text-black'}`}>
                {aspect.score}%
              </div>
              <div className={`w-full h-1 ${selectedAspect === aspect.id ? 'bg-white/20' : 'bg-gray-100'}`}>
                <div
                  className={`h-1 ${selectedAspect === aspect.id ? 'bg-white' : 'bg-black'}`}
                  style={{ width: `${aspect.score}%` }}
                />
              </div>
            </motion.button>
          );
        })}
      </div>

      {/* Selected Aspect Details */}
      {selectedAspectData && (
        <Card className="p-8">
          <div className="flex items-center mb-4">
            <selectedAspectData.icon className="w-5 h-5 text-gray-400 mr-3" />
            <h3 className="text-lg font-light text-black">{selectedAspectData.name}</h3>
          </div>

          <p className="text-gray-600 font-light mb-6 leading-relaxed">{selectedAspectData.description}</p>

          <div className="mb-6">
            <div className="flex items-center justify-between mb-2">
              <span className="text-gray-500 font-light">Current Level</span>
              <span className="text-black font-light">{selectedAspectData.score}%</span>
            </div>
            <div className="w-full bg-gray-100 h-1">
              <motion.div
                className="bg-black h-1"
                initial={{ width: 0 }}
                animate={{ width: `${selectedAspectData.score}%` }}
                transition={{ duration: 0.8, ease: "easeOut" }}
              />
            </div>
          </div>

          <div>
            <h4 className="text-black font-light mb-3">Improvement Tips:</h4>
            <div className="space-y-3">
              {selectedAspectData.tips.map((tip, index) => (
                <motion.div
                  key={index}
                  initial={{ opacity: 0, x: -20 }}
                  animate={{ opacity: 1, x: 0 }}
                  transition={{ delay: index * 0.1, duration: 0.6 }}
                  className="flex items-start p-4 bg-gray-50 border border-gray-100"
                >
                  <div className="w-1 h-1 bg-black rounded-full mr-3 mt-2" />
                  <span className="text-gray-700 font-light">{tip}</span>
                </motion.div>
              ))}
            </div>
          </div>
        </Card>
      )}

      {/* Daily Practices */}
      <div className="space-y-4">
        <h3 className="text-lg font-light text-black">Daily Practices</h3>
        <div className="space-y-3">
          {dailyPractices.map((practice, index) => (
            <motion.div
              key={practice.name}
              initial={{ opacity: 0, x: -20 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ delay: index * 0.1, duration: 0.6 }}
            >
              <Card className={`p-6 transition-all duration-300 ${
                practice.completed
                  ? 'bg-gray-50 border-gray-200'
                  : 'border-gray-100'
              }`}>
                <div className="flex items-center justify-between">
                  <div className="flex items-center">
                    <div className={`w-2 h-2 rounded-full mr-3 ${
                      practice.completed ? 'bg-black' : 'bg-gray-300'
                    }`} />
                    <div>
                      <div className={`font-light ${practice.completed ? 'text-gray-500' : 'text-black'}`}>
                        {practice.name}
                      </div>
                      <div className={`text-sm font-light ${practice.completed ? 'text-gray-400' : 'text-gray-600'}`}>
                        {practice.streak} day streak
                      </div>
                    </div>
                  </div>
                </div>
              </Card>
            </motion.div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default PresenceModule;