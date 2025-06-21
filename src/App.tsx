import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import GenderSelection from './components/Onboarding/GenderSelection';
import BottomNav from './components/Navigation/BottomNav';
import DailyProtocol from './components/Home/DailyProtocol';
import BodyModule from './components/Body/BodyModule';
import FitnessModule from './components/Fitness/FitnessModule';
import FashionModule from './components/Fashion/FashionModule';
import PresenceModule from './components/Presence/PresenceModule';
import { useLocalStorage } from './hooks/useLocalStorage';

type Screen = 'home' | 'body' | 'fitness' | 'fashion' | 'presence';

function App() {
  const [hasCompletedOnboarding, setHasCompletedOnboarding] = useLocalStorage('hasCompletedOnboarding', false);
  const [currentScreen, setCurrentScreen] = useState<Screen>('home');
  const [userGender, setUserGender] = useLocalStorage<'male' | 'female' | null>('userGender', null);

  const handleOnboardingComplete = (gender: 'male' | 'female') => {
    setUserGender(gender);
    setHasCompletedOnboarding(true);
  };

  const renderCurrentScreen = () => {
    switch (currentScreen) {
      case 'home':
        return <DailyProtocol userGender={userGender} />;
      case 'body':
        return <BodyModule />;
      case 'fitness':
        return <FitnessModule />;
      case 'fashion':
        return <FashionModule />;
      case 'presence':
        return <PresenceModule />;
      default:
        return <DailyProtocol userGender={userGender} />;
    }
  };

  if (!hasCompletedOnboarding) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-indigo-900 via-purple-900 to-pink-900">
        <GenderSelection onComplete={handleOnboardingComplete} />
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-indigo-900 via-purple-900 to-pink-900 relative overflow-hidden">
      {/* Background Effects */}
      <div className="absolute inset-0 bg-black/20" />
      <div className="absolute top-0 left-0 w-96 h-96 bg-indigo-500/20 rounded-full blur-3xl -translate-x-1/2 -translate-y-1/2" />
      <div className="absolute bottom-0 right-0 w-96 h-96 bg-pink-500/20 rounded-full blur-3xl translate-x-1/2 translate-y-1/2" />
      
      <div className="relative z-10 flex flex-col h-screen">
        {/* Header */}
        <motion.header 
          className="p-6 text-center"
          initial={{ opacity: 0, y: -20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6 }}
        >
          <h1 className="text-4xl font-bold text-white tracking-wider" style={{ fontFamily: 'serif' }}>
            CHESEL
          </h1>
          <p className="text-white/70 text-sm mt-1">Master Component & Microcopy Blueprint</p>
        </motion.header>

        {/* Main Content */}
        <main className="flex-1 px-4 pb-20 overflow-y-auto">
          <AnimatePresence mode="wait">
            <motion.div
              key={currentScreen}
              initial={{ opacity: 0, x: 20 }}
              animate={{ opacity: 1, x: 0 }}
              exit={{ opacity: 0, x: -20 }}
              transition={{ duration: 0.3 }}
            >
              {renderCurrentScreen()}
            </motion.div>
          </AnimatePresence>
        </main>

        {/* Bottom Navigation */}
        <BottomNav currentScreen={currentScreen} onScreenChange={setCurrentScreen} />
      </div>
    </div>
  );
}

export default App;