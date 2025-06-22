import React, { useState } from 'react';
import { motion } from 'framer-motion';
import { Activity, Clock, Flame, Trophy } from 'lucide-react';
import { Card } from '../ui/Card';

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
    <div className="space-y-8 py-8">
      {/* Header */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.6 }}
        className="text-center"
      >
        <h2 className="text-2xl font-light text-black mb-2">Fitness Tracker</h2>
        <p className="text-gray-600 font-light">Your weekly fitness journey</p>
      </motion.div>

      {/* Weekly Progress */}
      <Card className="p-8">
        <div className="text-center mb-6">
          <div className="text-3xl font-light text-black mb-2">
            {completedWorkouts}/{weeklyGoal}
          </div>
          <div className="text-gray-500 text-sm font-light">Weekly Goal Progress</div>
        </div>

        <div className="w-full bg-gray-100 h-2 mb-8">
          <motion.div
            className="bg-black h-2"
            initial={{ width: 0 }}
            animate={{ width: `${(completedWorkouts / weeklyGoal) * 100}%` }}
            transition={{ duration: 0.8, ease: "easeOut" }}
          />
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
                className="text-center p-4 bg-gray-50 border border-gray-100"
              >
                <Icon className="w-5 h-5 text-gray-400 mx-auto mb-2" />
                <div className="text-xl font-light text-black">{stat.value}</div>
                <div className="text-gray-500 text-xs font-light">{stat.unit}</div>
                <div className="text-gray-400 text-xs font-light mt-1">{stat.label}</div>
              </motion.div>
            );
          })}
        </div>
      </Card>

      {/* Recent Workouts */}
      <div className="space-y-4">
        <h3 className="text-lg font-light text-black">Recent Workouts</h3>
        <div className="space-y-3">
          {recentWorkouts.map((workout, index) => (
            <motion.div
              key={index}
              initial={{ opacity: 0, x: -20 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ delay: index * 0.1, duration: 0.6 }}
            >
              <Card className="p-6">
                <div className="flex items-center justify-between">
                  <div>
                    <div className="text-black font-light">{workout.name}</div>
                    <div className="text-gray-500 text-sm font-light">{workout.date}</div>
                  </div>
                  <div className="text-right">
                    <div className="text-black font-light">{workout.duration}</div>
                    <div className="text-gray-500 text-sm font-light">{workout.calories} cal</div>
                  </div>
                </div>
              </Card>
            </motion.div>
          ))}
        </div>
      </div>

      {/* Weekly Plan */}
      <div className="space-y-4">
        <h3 className="text-lg font-light text-black">Weekly Plan</h3>
        <div className="space-y-2">
          {workoutPlan.map((day, index) => (
            <motion.div
              key={day.day}
              initial={{ opacity: 0, x: -20 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ delay: index * 0.05, duration: 0.6 }}
            >
              <Card className={`p-4 transition-all duration-300 ${
                day.completed
                  ? 'bg-gray-50 border-gray-200'
                  : 'border-gray-100'
              }`}>
                <div className="flex items-center justify-between">
                  <div className="flex items-center">
                    <div className={`w-2 h-2 rounded-full mr-3 ${
                      day.completed ? 'bg-black' : 'bg-gray-300'
                    }`} />
                    <div>
                      <div className={`font-light ${day.completed ? 'text-gray-500' : 'text-black'}`}>
                        {day.day}
                      </div>
                    </div>
                  </div>
                  <div className={`text-sm font-light ${day.completed ? 'text-gray-400' : 'text-gray-600'}`}>
                    {day.workout}
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

export default FitnessModule;