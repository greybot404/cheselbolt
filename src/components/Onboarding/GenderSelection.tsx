import React from 'react';
import { motion } from 'framer-motion';
import { User, UserCheck } from 'lucide-react';
import { Button } from '../ui/Button';

interface GenderSelectionProps {
  onComplete: (gender: 'male' | 'female') => void;
}

const GenderSelection: React.FC<GenderSelectionProps> = ({ onComplete }) => {
  return (
    <div className="min-h-screen flex items-center justify-center p-8 bg-white">
      <motion.div
        initial={{ opacity: 0, scale: 0.95 }}
        animate={{ opacity: 1, scale: 1 }}
        transition={{ duration: 0.6 }}
        className="w-full max-w-sm"
      >
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.2, duration: 0.6 }}
          className="text-center mb-12"
        >
          <h2 className="text-2xl font-light text-black mb-3 tracking-wide">Welcome to</h2>
          <h1 className="text-3xl font-light text-black tracking-[0.2em] mb-4" style={{ fontFamily: 'serif' }}>
            CHESEL
          </h1>
          <div className="w-16 h-px bg-black mx-auto mb-6"></div>
          <p className="text-gray-600 font-light">Choose your profile to begin</p>
        </motion.div>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.4, duration: 0.6 }}
          className="space-y-4"
        >
          <button
            onClick={() => onComplete('male')}
            className="w-full h-16 bg-white border border-gray-200 hover:border-black text-black font-light text-lg transition-all duration-300 hover:shadow-sm group"
          >
            <div className="flex items-center justify-center">
              <User className="w-5 h-5 mr-3 text-gray-400 group-hover:text-black transition-colors duration-300" />
              Male
            </div>
          </button>

          <button
            onClick={() => onComplete('female')}
            className="w-full h-16 bg-white border border-gray-200 hover:border-black text-black font-light text-lg transition-all duration-300 hover:shadow-sm group"
          >
            <div className="flex items-center justify-center">
              <UserCheck className="w-5 h-5 mr-3 text-gray-400 group-hover:text-black transition-colors duration-300" />
              Female
            </div>
          </button>
        </motion.div>
      </motion.div>
    </div>
  );
};

export default GenderSelection;