import React, { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import { CheckCircle, Circle, Trophy, Target, Calendar } from 'lucide-react';
import { Card } from '../ui/Card';

interface DailyProtocolProps {
  userGender: 'male' | 'female' | null;
}

interface ProtocolItem {
  id: string;
  title: string;
  description: string;
  completed: boolean;
  category: 'morning' | 'afternoon' | 'evening';
}

const DailyProtocol: React.FC<DailyProtocolProps> = ({ userGender }) => {
  const [protocolItems, setProtocolItems] = useState<ProtocolItem[]>([
    {
      id: '1',
      title: 'Morning Hydration',
      description: 'Drink 500ml of water upon waking',
      completed: false,
      category: 'morning'
    },
    {
      id: '2',
      title: 'Skincare Routine',
      description: 'Complete morning skincare regimen',
      completed: false,
      category: 'morning'
    },
    {
      id: '3',
      title: 'Workout Session',
      description: '30-45 minutes of physical activity',
      completed: false,
      category: 'afternoon'
    },
    {
      id: '4',
      title: 'Nutrition Tracking',
      description: 'Log meals and monitor macros',
      completed: false,
      category: 'afternoon'
    },
    {
      id: '5',
      title: 'Evening Reflection',
      description: '10 minutes of journaling or meditation',
      completed: false,
      category: 'evening'
    },
    {
      id: '6',
      title: 'Sleep Preparation',
      description: 'Wind down routine and screen time limit',
      completed: false,
      category: 'evening'
    }
  ]);

  const toggleItem = (id: string) => {
    setProtocolItems(items =>
      items.map(item =>
        item.id === id ? { ...item, completed: !item.completed } : item
      )
    );
  };

  const completedCount = protocolItems.filter(item => item.completed).length;
  const completionPercentage = Math.round((completedCount / protocolItems.length) * 100);

  const groupedItems = {
    morning: protocolItems.filter(item => item.category === 'morning'),
    afternoon: protocolItems.filter(item => item.category === 'afternoon'),
    evening: protocolItems.filter(item => item.category === 'evening')
  };

  return (
    <div className="space-y-6">
      {/* Progress Overview */}
      <Card className="p-6">
        <div className="flex items-center justify-between mb-4">
          <div>
            <h2 className="text-2xl font-bold text-white mb-1">Daily Protocol</h2>
            <p className="text-white/70">Your personalized wellness routine</p>
          </div>
          <div className="text-right">
            <div className="text-3xl font-bold text-white">{completionPercentage}%</div>
            <div className="text-white/70 text-sm">Complete</div>
          </div>
        </div>

        <div className="w-full bg-white/10 rounded-full h-3 mb-4">
          <motion.div
            className="bg-gradient-to-r from-indigo-500 to-purple-500 h-3 rounded-full"
            initial={{ width: 0 }}
            animate={{ width: `${completionPercentage}%` }}
            transition={{ duration: 0.8, ease: "easeOut" }}
          />
        </div>

        <div className="flex items-center justify-between text-sm text-white/70">
          <span>{completedCount} of {protocolItems.length} completed</span>
          <div className="flex items-center">
            <Trophy className="w-4 h-4 mr-1" />
            <span>Daily Goal</span>
          </div>
        </div>
      </Card>

      {/* Protocol Categories */}
      {Object.entries(groupedItems).map(([category, items]) => (
        <motion.div
          key={category}
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6 }}
        >
          <Card className="p-6">
            <div className="flex items-center mb-4">
              <div className="w-3 h-3 rounded-full bg-gradient-to-r from-indigo-500 to-purple-500 mr-3" />
              <h3 className="text-lg font-semibold text-white capitalize">{category}</h3>
            </div>

            <div className="space-y-3">
              {items.map((item) => (
                <motion.div
                  key={item.id}
                  className={`flex items-center p-4 rounded-xl border transition-all duration-300 cursor-pointer ${
                    item.completed
                      ? 'bg-green-500/10 border-green-400/30'
                      : 'bg-white/5 border-white/10 hover:bg-white/10'
                  }`}
                  onClick={() => toggleItem(item.id)}
                  whileHover={{ scale: 1.02 }}
                  whileTap={{ scale: 0.98 }}
                >
                  <div className="mr-4">
                    {item.completed ? (
                      <CheckCircle className="w-6 h-6 text-green-400" />
                    ) : (
                      <Circle className="w-6 h-6 text-white/40" />
                    )}
                  </div>
                  <div className="flex-1">
                    <h4 className={`font-medium ${item.completed ? 'text-green-400' : 'text-white'}`}>
                      {item.title}
                    </h4>
                    <p className={`text-sm ${item.completed ? 'text-green-400/70' : 'text-white/70'}`}>
                      {item.description}
                    </p>
                  </div>
                </motion.div>
              ))}
            </div>
          </Card>
        </motion.div>
      ))}
    </div>
  );
};

export default DailyProtocol;