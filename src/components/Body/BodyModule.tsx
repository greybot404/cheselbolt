import React, { useState } from 'react';
import { motion } from 'framer-motion';
import { Scale, TrendingUp, Target, Calendar } from 'lucide-react';
import { Card } from '../ui/Card';
import { LineChart, Line, XAxis, YAxis, ResponsiveContainer } from 'recharts';

const BodyModule: React.FC = () => {
  const [currentWeight, setCurrentWeight] = useState(70);
  const [targetWeight, setTargetWeight] = useState(65);

  const weightData = [
    { date: 'Jan', weight: 72 },
    { date: 'Feb', weight: 71.5 },
    { date: 'Mar', weight: 71 },
    { date: 'Apr', weight: 70.5 },
    { date: 'May', weight: 70 },
  ];

  const bodyMetrics = [
    { label: 'Body Fat', value: '18%', change: '-2%', positive: true },
    { label: 'Muscle Mass', value: '45kg', change: '+1kg', positive: true },
    { label: 'BMI', value: '22.5', change: '-0.5', positive: true },
    { label: 'Water %', value: '62%', change: '+1%', positive: true },
  ];

  return (
    <div className="space-y-8 py-8">
      {/* Header */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.6 }}
        className="text-center"
      >
        <h2 className="text-2xl font-light text-black mb-2">Body Composition</h2>
        <p className="text-gray-600 font-light">Track your physical progress</p>
      </motion.div>

      {/* Weight Overview */}
      <Card className="p-8">
        <div className="grid grid-cols-2 gap-8 mb-8">
          <div className="text-center">
            <div className="text-3xl font-light text-black mb-2">{currentWeight}kg</div>
            <div className="text-gray-500 text-sm font-light">Current Weight</div>
          </div>
          <div className="text-center">
            <div className="text-3xl font-light text-gray-400 mb-2">{targetWeight}kg</div>
            <div className="text-gray-500 text-sm font-light">Target Weight</div>
          </div>
        </div>

        <div className="h-48 mb-4">
          <ResponsiveContainer width="100%" height="100%">
            <LineChart data={weightData}>
              <XAxis 
                dataKey="date" 
                axisLine={false}
                tickLine={false}
                tick={{ fill: '#9CA3AF', fontSize: 12 }}
              />
              <YAxis 
                domain={['dataMin - 1', 'dataMax + 1']}
                axisLine={false}
                tickLine={false}
                tick={{ fill: '#9CA3AF', fontSize: 12 }}
              />
              <Line 
                type="monotone" 
                dataKey="weight" 
                stroke="#000000" 
                strokeWidth={2}
                dot={{ fill: '#000000', strokeWidth: 0, r: 3 }}
                activeDot={{ r: 4, fill: '#000000' }}
              />
            </LineChart>
          </ResponsiveContainer>
        </div>
      </Card>

      {/* Body Metrics */}
      <div className="space-y-4">
        <h3 className="text-lg font-light text-black">Body Metrics</h3>
        <div className="grid grid-cols-2 gap-4">
          {bodyMetrics.map((metric, index) => (
            <motion.div
              key={metric.label}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: index * 0.1, duration: 0.6 }}
            >
              <Card className="p-6">
                <div className="text-gray-500 text-sm font-light mb-1">{metric.label}</div>
                <div className="text-xl font-light text-black mb-2">{metric.value}</div>
                <div className={`text-sm font-light flex items-center ${
                  metric.positive ? 'text-green-600' : 'text-red-600'
                }`}>
                  <TrendingUp className={`w-3 h-3 mr-1 ${metric.positive ? '' : 'rotate-180'}`} />
                  {metric.change}
                </div>
              </Card>
            </motion.div>
          ))}
        </div>
      </div>

      {/* Goals */}
      <div className="space-y-4">
        <h3 className="text-lg font-light text-black">Current Goals</h3>
        <div className="space-y-3">
          <Card className="p-6">
            <div className="flex items-center justify-between">
              <div>
                <div className="text-black font-light">Lose 5kg</div>
                <div className="text-gray-500 text-sm font-light">Target: End of June</div>
              </div>
              <div className="text-black font-light">70%</div>
            </div>
            <div className="w-full bg-gray-100 h-1 mt-4">
              <div className="bg-black h-1 w-[70%]"></div>
            </div>
          </Card>

          <Card className="p-6">
            <div className="flex items-center justify-between">
              <div>
                <div className="text-black font-light">Build Muscle</div>
                <div className="text-gray-500 text-sm font-light">+2kg lean mass</div>
              </div>
              <div className="text-black font-light">45%</div>
            </div>
            <div className="w-full bg-gray-100 h-1 mt-4">
              <div className="bg-black h-1 w-[45%]"></div>
            </div>
          </Card>
        </div>
      </div>
    </div>
  );
};

export default BodyModule;