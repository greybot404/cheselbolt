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
    <div className="space-y-6">
      {/* Weight Overview */}
      <Card className="p-6">
        <div className="flex items-center justify-between mb-6">
          <div>
            <h2 className="text-2xl font-bold text-white mb-1">Body Composition</h2>
            <p className="text-white/70">Track your physical progress</p>
          </div>
          <Scale className="w-8 h-8 text-indigo-400" />
        </div>

        <div className="grid grid-cols-2 gap-4 mb-6">
          <div className="text-center">
            <div className="text-3xl font-bold text-white mb-1">{currentWeight}kg</div>
            <div className="text-white/70 text-sm">Current Weight</div>
          </div>
          <div className="text-center">
            <div className="text-3xl font-bold text-indigo-400 mb-1">{targetWeight}kg</div>
            <div className="text-white/70 text-sm">Target Weight</div>
          </div>
        </div>

        <div className="h-48 mb-4">
          <ResponsiveContainer width="100%" height="100%">
            <LineChart data={weightData}>
              <XAxis 
                dataKey="date" 
                axisLine={false}
                tickLine={false}
                tick={{ fill: 'rgba(255,255,255,0.7)', fontSize: 12 }}
              />
              <YAxis 
                domain={['dataMin - 1', 'dataMax + 1']}
                axisLine={false}
                tickLine={false}
                tick={{ fill: 'rgba(255,255,255,0.7)', fontSize: 12 }}
              />
              <Line 
                type="monotone" 
                dataKey="weight" 
                stroke="#6366f1" 
                strokeWidth={3}
                dot={{ fill: '#6366f1', strokeWidth: 2, r: 4 }}
                activeDot={{ r: 6, fill: '#8b5cf6' }}
              />
            </LineChart>
          </ResponsiveContainer>
        </div>
      </Card>

      {/* Body Metrics */}
      <Card className="p-6">
        <div className="flex items-center mb-4">
          <TrendingUp className="w-6 h-6 text-indigo-400 mr-3" />
          <h3 className="text-lg font-semibold text-white">Body Metrics</h3>
        </div>

        <div className="grid grid-cols-2 gap-4">
          {bodyMetrics.map((metric, index) => (
            <motion.div
              key={metric.label}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: index * 0.1, duration: 0.6 }}
              className="bg-white/5 rounded-xl p-4 border border-white/10"
            >
              <div className="text-white/70 text-sm mb-1">{metric.label}</div>
              <div className="text-xl font-bold text-white mb-1">{metric.value}</div>
              <div className={`text-sm flex items-center ${
                metric.positive ? 'text-green-400' : 'text-red-400'
              }`}>
                <TrendingUp className={`w-3 h-3 mr-1 ${metric.positive ? '' : 'rotate-180'}`} />
                {metric.change}
              </div>
            </motion.div>
          ))}
        </div>
      </Card>

      {/* Goals */}
      <Card className="p-6">
        <div className="flex items-center mb-4">
          <Target className="w-6 h-6 text-indigo-400 mr-3" />
          <h3 className="text-lg font-semibold text-white">Current Goals</h3>
        </div>

        <div className="space-y-4">
          <div className="flex items-center justify-between p-4 bg-white/5 rounded-xl border border-white/10">
            <div>
              <div className="text-white font-medium">Lose 5kg</div>
              <div className="text-white/70 text-sm">Target: End of June</div>
            </div>
            <div className="text-indigo-400 font-bold">70%</div>
          </div>

          <div className="flex items-center justify-between p-4 bg-white/5 rounded-xl border border-white/10">
            <div>
              <div className="text-white font-medium">Build Muscle</div>
              <div className="text-white/70 text-sm">+2kg lean mass</div>
            </div>
            <div className="text-indigo-400 font-bold">45%</div>
          </div>
        </div>
      </Card>
    </div>
  );
};

export default BodyModule;