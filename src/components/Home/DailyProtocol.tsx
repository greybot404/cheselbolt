import React, { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import { CheckCircle, Circle, Trophy, Target, Calendar, BarChart3 } from 'lucide-react';
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

  return (
    <div className="space-y-8 py-8">
      {/* Progress Overview */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.6 }}
      >
        <Card className="p-8">
          <div className="text-center mb-8">
            <h2 className="text-2xl font-light text-black mb-2">Today's Protocol</h2>
            <p className="text-gray-600 font-light">Your personalized wellness routine</p>
          </div>

          <div className="text-center mb-6">
            <div className="text-5xl font-light text-black mb-2">{completionPercentage}%</div>
            <div className="text-gray-500 text-sm font-light">Complete</div>
          </div>

          <div className="w-full bg-gray-100 h-1 mb-6">
            <motion.div
              className="bg-black h-1"
              initial={{ width: 0 }}
              animate={{ width: `${completionPercentage}%` }}
              transition={{ duration: 0.8, ease: "easeOut" }}
            />
          </div>

          <div className="flex items-center justify-between text-sm text-gray-500 font-light">
            <span>{completedCount} of {protocolItems.length} completed</span>
            <div className="flex items-center">
              <Trophy className="w-4 h-4 mr-1" />
              <span>Daily Goal</span>
            </div>
          </div>
        </Card>
      </motion.div>

      {/* Quick Stats */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.2, duration: 0.6 }}
        className="grid grid-cols-2 gap-4"
      >
        <Card className="p-6 text-center">
          <div className="text-2xl font-light text-black mb-1">12</div>
          <div className="text-gray-500 text-sm font-light">Day Streak</div>
        </Card>
        <Card className="p-6 text-center">
          <div className="text-2xl font-light text-black mb-1">85%</div>
          <div className="text-gray-500 text-sm font-light">Weekly Avg</div>
        </Card>
      </motion.div>

      {/* Protocol Items */}
      <div className="space-y-4">
        <h3 className="text-lg font-light text-black">Today's Tasks</h3>
        {protocolItems.map((item, index) => (
          <motion.div
            key={item.id}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.1 * index, duration: 0.6 }}
          >
            <Card
              className={`p-6 cursor-pointer transition-all duration-300 ${
                item.completed
                  ? 'bg-gray-50 border-gray-200'
                  : 'hover:shadow-md hover:border-gray-200'
              }`}
              onClick={() => toggleItem(item.id)}
            >
              <div className="flex items-start">
                <div className="mr-4 mt-1">
                  {item.completed ? (
                    <CheckCircle className="w-5 h-5 text-black" />
                  ) : (
                    <Circle className="w-5 h-5 text-gray-300" />
                  )}
                </div>
                <div className="flex-1">
                  <h4 className={`font-light mb-1 ${item.completed ? 'text-gray-500 line-through' : 'text-black'}`}>
                    {item.title}
                  </h4>
                  <p className={`text-sm font-light ${item.completed ? 'text-gray-400' : 'text-gray-600'}`}>
                    {item.description}
                  </p>
                </div>
              </div>
            </Card>
          </motion.div>
        ))}
      </div>

      {/* Insights */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.4, duration: 0.6 }}
      >
        <Card className="p-6">
          <div className="flex items-center mb-4">
            <BarChart3 className="w-5 h-5 text-gray-400 mr-3" />
            <h3 className="text-lg font-light text-black">Today's Insight</h3>
          </div>
          <p className="text-gray-600 font-light leading-relaxed">
            You're maintaining excellent consistency with your morning routine. 
            Consider adding 5 minutes of stretching after your workout to improve recovery.
          </p>
        </Card>
      </motion.div>
    </div>
  );
};

export default DailyProtocol;