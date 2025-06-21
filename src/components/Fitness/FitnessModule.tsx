import React, { useState } from 'react';
import { motion } from 'framer-motion';
import { Activity, Clock, Flame, Trophy } from 'lucide-react';
import Card from '../ui/Card';

const FitnessModule: React.FC = () => {
  const [weeklyGoal] = useState(5);
  const [completedWorkouts] = useState(3);

  const workoutStats = [
    { label: 'This Week', value: '3', unit: 'workouts', icon: Activity },
    { label: 'Total Time', value: '4.5', unit: 'hours', icon: Clock },
    { label: 'Calories', value: '1,250', unit: 'burned', icon: Flame },
    { label: 'Streak', value: '12', unit: 'days', icon: Trophy },
  ];

  const recentWorkouts = [
    { name: 'Upper Body Strength', duration: '45 min', calories: 320, date: 'Today' },
    { name: 'HIIT Cardio', duration: '30 min', calories: 280, date: 'Yesterday' },
    { name: 'Lower Body Power', duration: '50 min', calories: 380, date: '2 days ago' },
  ];

  const workoutPlan = [
    { day: 'Monday', workout: 'Upper Body', completed: true },
    { day: 'Tuesday', workout: 'Cardio', completed: true },
    { day: 'Wednesday', workout: 'Lower Body', completed: true },
    { day: 'Thursday', workout: 'Rest Day', completed: false },
    { day: 'Friday', workout: 'Full Body', completed: false },
    { day: 'Saturday', workout: 'Cardio', completed: false },
    { day: 'Sunday', workout: 'Rest Day', completed: false },
  ];

  return (
    <div className="space-y-6">
      {/* Weekly Progress */}
      <Card className="p-6">
        <div className="flex items-center justify-between mb-6">
          <div>
            <h2 className="text-2xl font-bold text-white mb-1">Fitness Tracker</h2>
            <p className="text-white/70">Your weekly fitness journey</p>
          </div>
          <Activity className="w-8 h-8 text-indigo-400" />
        </div>

        <div className="mb-6">
          <div className="flex items-center justify-between mb-2">
            <span className="text-white/70">Weekly Goal Progress</span>
            <span className="text-white font-semibold">{completedWorkouts}/{weeklyGoal} workouts</span>
          </div>
          <div className="w-full bg-white/10 rounded-full h-3">
            <motion.div
              className="bg-gradient-to-r from-indigo-500 to-purple-500 h-3 rounded-full"
              initial={{ width: 0 }}
              animate={{ width: `${(completedWorkouts / weeklyGoal) * 100}%` }}
              transition={{ duration: 0.8, ease: "easeOut" }}
            />
          </div>
        </div>

        <div className="grid grid-cols-2 gap-4">
          {workoutStats.map((stat, index) => {
            const Icon = stat.icon;
            return (
              <motion.div
                key={stat.label}
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: index * 0.1, duration: 0.6 }}
                className="bg-white/5 rounded-xl p-4 border border-white/10"
              >
                <Icon className="w-5 h-5 text-indigo-400 mb-2" />
                <div className="text-2xl font-bold text-white">{stat.value}</div>
                <div className="text-white/70 text-sm">{stat.unit}</div>
                <div className="text-white/50 text-xs mt-1">{stat.label}</div>
              </motion.div>
            );
          })}
        </div>
      </Card>

      {/* Recent Workouts */}
      <Card className="p-6">
        <h3 className="text-lg font-semibold text-white mb-4">Recent Workouts</h3>
        <div className="space-y-3">
          {recentWorkouts.map((workout, index) => (
            <motion.div
              key={index}
              initial={{ opacity: 0, x: -20 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ delay: index * 0.1, duration: 0.6 }}
              className="flex items-center justify-between p-4 bg-white/5 rounded-xl border border-white/10"
            >
              <div>
                <div className="text-white font-medium">{workout.name}</div>
                <div className="text-white/70 text-sm">{workout.date}</div>
              </div>
              <div className="text-right">
                <div className="text-white font-medium">{workout.duration}</div>
                <div className="text-indigo-400 text-sm">{workout.calories} cal</div>
              </div>
            </motion.div>
          ))}
        </div>
      </Card>

      {/* Weekly Plan */}
      <Card className="p-6">
        <h3 className="text-lg font-semibold text-white mb-4">Weekly Plan</h3>
        <div className="space-y-2">
          {workoutPlan.map((day, index) => (
            <motion.div
              key={day.day}
              initial={{ opacity: 0, x: -20 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ delay: index * 0.05, duration: 0.6 }}
              className={`flex items-center justify-between p-3 rounded-xl border transition-all duration-300 ${
                day.completed
                  ? 'bg-green-500/10 border-green-400/30'
                  : 'bg-white/5 border-white/10'
              }`}
            >
              <div className="flex items-center">
                <div className={`w-3 h-3 rounded-full mr-3 ${
                  day.completed ? 'bg-green-400' : 'bg-white/30'
                }`} />
                <div>
                  <div className={`font-medium ${day.completed ? 'text-green-400' : 'text-white'}`}>
                    {day.day}
                  </div>
                </div>
              </div>
              <div className={`text-sm ${day.completed ? 'text-green-400/70' : 'text-white/70'}`}>
                {day.workout}
              </div>
            </motion.div>
          ))}
        </div>
      </Card>
    </div>
  );
};

export default FitnessModule;