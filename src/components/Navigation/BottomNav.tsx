import React from 'react';
import { motion } from 'framer-motion';
import { Home, User, Dumbbell, Shirt, Sparkles } from 'lucide-react';

type Screen = 'home' | 'body' | 'fitness' | 'fashion' | 'presence';

interface BottomNavProps {
  currentScreen: Screen;
  onScreenChange: (screen: Screen) => void;
}

const BottomNav: React.FC<BottomNavProps> = ({ currentScreen, onScreenChange }) => {
  const navItems = [
    { id: 'home' as Screen, icon: Home, label: 'Home' },
    { id: 'body' as Screen, icon: User, label: 'Body' },
    { id: 'fitness' as Screen, icon: Dumbbell, label: 'Fitness' },
    { id: 'fashion' as Screen, icon: Shirt, label: 'Fashion' },
    { id: 'presence' as Screen, icon: Sparkles, label: 'Presence' },
  ];

  return (
    <motion.nav
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.6 }}
      className="fixed bottom-0 left-0 right-0 z-50 bg-white border-t border-gray-100"
    >
      <div className="max-w-md mx-auto px-6">
        <div className="flex items-center justify-between py-4">
          {navItems.map((item) => {
            const Icon = item.icon;
            const isActive = currentScreen === item.id;
            
            return (
              <motion.button
                key={item.id}
                onClick={() => onScreenChange(item.id)}
                className={`flex flex-col items-center p-2 transition-all duration-300 ${
                  isActive 
                    ? 'text-black' 
                    : 'text-gray-400 hover:text-gray-600'
                }`}
                whileHover={{ scale: 1.05 }}
                whileTap={{ scale: 0.95 }}
              >
                <Icon className={`w-5 h-5 mb-1 ${isActive ? 'text-black' : 'text-gray-400'}`} />
                <span className={`text-xs font-light ${isActive ? 'text-black' : 'text-gray-400'}`}>
                  {item.label}
                </span>
                {isActive && (
                  <motion.div
                    layoutId="activeIndicator"
                    className="absolute -bottom-0 w-8 h-px bg-black"
                    transition={{ type: "spring", stiffness: 300, damping: 30 }}
                  />
                )}
              </motion.button>
            );
          })}
        </div>
      </div>
    </motion.nav>
  );
};

export default BottomNav;