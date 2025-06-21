import React, { useState } from 'react';
import { motion } from 'framer-motion';
import { Sparkles, Heart, Brain, Users } from 'lucide-react';
import Card from '../ui/Card';

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
    <div className="space-y-6">
      {/* Presence Overview */}
      <Card className="p-6">
        <div className="flex items-center justify-between mb-6">
          <div>
            <h2 className="text-2xl font-bold text-white mb-1">Presence & Charisma</h2>
            <p className="text-white/70">Develop your magnetic personality</p>
          </div>
          <Sparkles className="w-8 h-8 text-indigo-400" />
        </div>

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
                className={`p-4 rounded-xl border transition-all duration-300 text-left ${
                  selectedAspect === aspect.id
                    ? 'bg-indigo-500/20 border-indigo-400/30'
                    : 'bg-white/5 border-white/10 hover:bg-white/10'
                }`}
                whileHover={{ scale: 1.02 }}
                whileTap={{ scale: 0.98 }}
              >
                <Icon className="w-6 h-6 text-indigo-400 mb-2" />
                <div className="text-white font-medium mb-1">{aspect.name}</div>
                <div className="text-2xl font-bold text-white mb-1">{aspect.score}%</div>
                <div className="w-full bg-white/10 rounded-full h-2">
                  <div
                    className="bg-gradient-to-r from-indigo-500 to-purple-500 h-2 rounded-full"
                    style={{ width: `${aspect.score}%` }}
                  />
                </div>
              </motion.button>
            );
          })}
        </div>
      </Card>

      {/* Selected Aspect Details */}
      {selectedAspectData && (
        <Card className="p-6">
          <div className="flex items-center mb-4">
            <selectedAspectData.icon className="w-6 h-6 text-indigo-400 mr-3" />
            <h3 className="text-lg font-semibold text-white">{selectedAspectData.name}</h3>
          </div>

          <p className="text-white/70 mb-6">{selectedAspectData.description}</p>

          <div className="mb-6">
            <div className="flex items-center justify-between mb-2">
              <span className="text-white/70">Current Level</span>
              <span className="text-white font-semibold">{selectedAspectData.score}%</span>
            </div>
            <div className="w-full bg-white/10 rounded-full h-3">
              <motion.div
                className="bg-gradient-to-r from-indigo-500 to-purple-500 h-3 rounded-full"
                initial={{ width: 0 }}
                animate={{ width: `${selectedAspectData.score}%` }}
                transition={{ duration: 0.8, ease: "easeOut" }}
              />
            </div>
          </div>

          <div>
            <h4 className="text-white font-medium mb-3">Improvement Tips:</h4>
            <div className="space-y-2">
              {selectedAspectData.tips.map((tip, index) => (
                <motion.div
                  key={index}
                  initial={{ opacity: 0, x: -20 }}
                  animate={{ opacity: 1, x: 0 }}
                  transition={{ delay: index * 0.1, duration: 0.6 }}
                  className="flex items-center p-3 bg-white/5 rounded-xl border border-white/10"
                >
                  <div className="w-2 h-2 bg-indigo-400 rounded-full mr-3" />
                  <span className="text-white/80">{tip}</span>
                </motion.div>
              ))}
            </div>
          </div>
        </Card>
      )}

      {/* Daily Practices */}
      <Card className="p-6">
        <h3 className="text-lg font-semibold text-white mb-4">Daily Practices</h3>
        <div className="space-y-3">
          {dailyPractices.map((practice, index) => (
            <motion.div
              key={practice.name}
              initial={{ opacity: 0, x: -20 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ delay: index * 0.1, duration: 0.6 }}
              className={`flex items-center justify-between p-4 rounded-xl border transition-all duration-300 ${
                practice.completed
                  ? 'bg-green-500/10 border-green-400/30'
                  : 'bg-white/5 border-white/10'
              }`}
            >
              <div className="flex items-center">
                <div className={`w-3 h-3 rounded-full mr-3 ${
                  practice.completed ? 'bg-green-400' : 'bg-white/30'
                }`} />
                <div>
                  <div className={`font-medium ${practice.completed ? 'text-green-400' : 'text-white'}`}>
                    {practice.name}
                  </div>
                  <div className={`text-sm ${practice.completed ? 'text-green-400/70' : 'text-white/70'}`}>
                    {practice.streak} day streak
                  </div>
                </div>
              </div>
            </motion.div>
          ))}
        </div>
      </Card>
    </div>
  );
};

export default PresenceModule;