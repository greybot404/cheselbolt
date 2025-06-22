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
      <div className="min-h-screen bg-white">
        <GenderSelection onComplete={handleOnboardingComplete} />
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="flex flex-col h-screen">
        {/* Header */}
        <motion.header 
          className="bg-white border-b border-gray-100 px-6 py-8"
          initial={{ opacity: 0, y: -20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6 }}
        >
          <div className="text-center">
            <h1 className="text-3xl font-light text-black tracking-[0.2em]" style={{ fontFamily: 'serif' }}>
              CHESEL
            </h1>
            <div className="w-12 h-px bg-black mx-auto mt-2"></div>
          </div>
        </motion.header>

        {/* Main Content */}
        <main className="flex-1 px-6 pb-24 overflow-y-auto">
          <div className="max-w-md mx-auto">
            <AnimatePresence mode="wait">
              <motion.div
                key={currentScreen}
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                exit={{ opacity: 0, y: -20 }}
                transition={{ duration: 0.4, ease: "easeInOut" }}
              >
                {renderCurrentScreen()}
              </motion.div>
            </AnimatePresence>
          </div>
        </main>

        {/* Bottom Navigation */}
        <BottomNav currentScreen={currentScreen} onScreenChange={setCurrentScreen} />
      </div>
    </div>
  );
}

export default App;