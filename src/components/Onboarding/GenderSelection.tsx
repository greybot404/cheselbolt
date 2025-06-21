import React from 'react';
import { motion } from 'framer-motion';
import { User, UserCheck } from 'lucide-react';
import Button from '../ui/Button';

interface GenderSelectionProps {
  onComplete: (gender: 'male' | 'female') => void;
}

const GenderSelection: React.FC<GenderSelectionProps> = ({ onComplete }) => {
  return (
    <div className="min-h-screen flex items-center justify-center p-6">
      <motion.div
        initial={{ opacity: 0, scale: 0.9 }}
        animate={{ opacity: 1, scale: 1 }}
        transition={{ duration: 0.6 }}
        className="w-full max-w-md"
      >
        <div className="backdrop-blur-xl bg-white/10 rounded-3xl p-8 border border-white/20 shadow-2xl">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.2, duration: 0.6 }}
            className="text-center mb-8"
          >
            <h2 className="text-3xl font-bold text-white mb-2">Welcome to Chesel</h2>
            <p className="text-white/70">Let's personalize your experience</p>
          </motion.div>

          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.4, duration: 0.6 }}
            className="space-y-4"
          >
            <Button
              onClick={() => onComplete('male')}
              className="w-full h-16 bg-gradient-to-r from-blue-500/20 to-indigo-500/20 hover:from-blue-500/30 hover:to-indigo-500/30 border border-blue-400/30 text-white font-semibold text-lg transition-all duration-300 hover:scale-105"
            >
              <User className="w-6 h-6 mr-3" />
              Male
            </Button>

            <Button
              onClick={() => onComplete('female')}
              className="w-full h-16 bg-gradient-to-r from-pink-500/20 to-purple-500/20 hover:from-pink-500/30 hover:to-purple-500/30 border border-pink-400/30 text-white font-semibold text-lg transition-all duration-300 hover:scale-105"
            >
              <UserCheck className="w-6 h-6 mr-3" />
              Female
            </Button>
          </motion.div>
        </div>
      </motion.div>
    </div>
  );
};

export default GenderSelection;