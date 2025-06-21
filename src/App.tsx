import React from 'react';
import { useLocalStorage } from './hooks/useLocalStorage';
import { GenderSelection } from './components/Onboarding/GenderSelection';
import { BottomNav } from './components/Navigation/BottomNav';
import { DailyProtocol } from './components/Home/DailyProtocol';
import { FitnessModule } from './components/Fitness/FitnessModule';
import { FashionModule } from './components/Fashion/FashionModule';
import { BodyModule } from './components/Body/BodyModule';
import { PresenceModule } from './components/Presence/PresenceModule';
import { User, Mission, FitnessData, FashionData, BodyData, PresenceData } from './types';

function App() {
  const [user, setUser] = useLocalStorage<User | null>('chesel-user', null);
  const [activeTab, setActiveTab] = useLocalStorage<string>('chesel-active-tab', 'home');
  const [missions, setMissions] = useLocalStorage<Mission[]>('chesel-missions', [
    {
      id: '1',
      title: 'Fitness & Presence',
      description: 'Your analysis indicates a slight pectoral imbalance. Add one additional set of incline dumbbell press to your next workout.',
      module: 'Fitness',
      completed: false,
      date: new Date().toDateString()
    },
    {
      id: '2',
      title: 'Vocal Authority',
      description: 'In your next phone call, consciously lower your vocal pitch by 10%. Project authority.',
      module: 'Presence',
      completed: false,
      date: new Date().toDateString()
    }
  ]);

  const [fitnessData, setFitnessData] = useLocalStorage<FitnessData>('chesel-fitness', {});
  const [fashionData, setFashionData] = useLocalStorage<FashionData>('chesel-fashion', {});
  const [bodyData, setBodyData] = useLocalStorage<BodyData>('chesel-body', { activeTab: 'face' });
  const [presenceData, setPresenceData] = useLocalStorage<PresenceData>('chesel-presence', { messages: [] });

  const handleGenderSelection = (gender: 'male' | 'female') => {
    setUser({
      id: Date.now().toString(),
      gender,
      onboardingComplete: true
    });
  };

  const handleMarkComplete = (missionId: string) => {
    setMissions(missions.map(mission =>
      mission.id === missionId ? { ...mission, completed: true } : mission
    ));
  };

  // Show onboarding if user hasn't completed it
  if (!user || !user.onboardingComplete) {
    return <GenderSelection onGenderSelect={handleGenderSelection} />;
  }

  const renderActiveModule = () => {
    switch (activeTab) {
      case 'home':
        return <DailyProtocol missions={missions} onMarkComplete={handleMarkComplete} />;
      case 'fitness':
        return <FitnessModule data={fitnessData} onDataUpdate={setFitnessData} />;
      case 'fashion':
        return <FashionModule data={fashionData} onDataUpdate={setFashionData} />;
      case 'body':
        return <BodyModule user={user} data={bodyData} onDataUpdate={setBodyData} />;
      case 'presence':
        return <PresenceModule data={presenceData} onDataUpdate={setPresenceData} />;
      default:
        return <DailyProtocol missions={missions} onMarkComplete={handleMarkComplete} />;
    }
  };

  return (
    <div className="min-h-screen bg-gray-50">
      {renderActiveModule()}
      <BottomNav activeTab={activeTab} onTabChange={setActiveTab} />
    </div>
  );
}

export default App;