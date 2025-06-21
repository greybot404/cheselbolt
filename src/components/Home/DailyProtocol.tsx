import React from 'react';
import { Card } from '../ui/Card';
import { Button } from '../ui/Button';
import { CheckCircle, Circle } from 'lucide-react';

interface DailyProtocolProps {
  missions: Array<{
    id: string;
    title: string;
    description: string;
    module: string;
    completed: boolean;
  }>;
  onMarkComplete: (missionId: string) => void;
}

export function DailyProtocol({ missions, onMarkComplete }: DailyProtocolProps) {
  const today = new Date().toDateString();
  const todaysMissions = missions.filter(mission => !mission.completed);
  const completedMissions = missions.filter(mission => mission.completed);

  return (
    <div className="min-h-screen bg-gray-50 pt-8 pb-24 px-6">
      <div className="max-w-md mx-auto space-y-8">
        <div className="text-center space-y-2">
          <h1 className="text-2xl font-light text-black">Today's Protocol</h1>
          <p className="text-gray-600">
            {new Date().toLocaleDateString('en-US', { 
              weekday: 'long', 
              year: 'numeric', 
              month: 'long', 
              day: 'numeric' 
            })}
          </p>
        </div>

        {todaysMissions.length > 0 && (
          <div className="space-y-4">
            <h2 className="text-lg font-medium text-black">Active Missions</h2>
            {todaysMissions.map((mission) => (
              <Card key={mission.id} className="p-6 space-y-4">
                <div className="flex items-start justify-between">
                  <div className="flex-1 space-y-2">
                    <div className="flex items-center space-x-2">
                      <span className="text-xs font-medium text-gray-500 uppercase tracking-wide">
                        {mission.module}
                      </span>
                    </div>
                    <h3 className="font-medium text-black">{mission.title}</h3>
                    <p className="text-gray-700 text-sm leading-relaxed">
                      {mission.description}
                    </p>
                  </div>
                </div>
                <Button
                  onClick={() => onMarkComplete(mission.id)}
                  className="w-full"
                  variant="primary"
                >
                  Mark as Complete
                </Button>
              </Card>
            ))}
          </div>
        )}

        {completedMissions.length > 0 && (
          <div className="space-y-4">
            <h2 className="text-lg font-medium text-black">Completed Today</h2>
            {completedMissions.map((mission) => (
              <Card key={mission.id} className="p-6 opacity-75">
                <div className="flex items-start space-x-3">
                  <CheckCircle className="w-5 h-5 text-green-600 mt-0.5 flex-shrink-0" />
                  <div className="flex-1 space-y-1">
                    <div className="flex items-center space-x-2">
                      <span className="text-xs font-medium text-gray-500 uppercase tracking-wide">
                        {mission.module}
                      </span>
                    </div>
                    <h3 className="font-medium text-black">{mission.title}</h3>
                  </div>
                </div>
              </Card>
            ))}
          </div>
        )}

        {todaysMissions.length === 0 && completedMissions.length === 0 && (
          <Card className="p-8 text-center">
            <Circle className="w-12 h-12 text-gray-300 mx-auto mb-4" />
            <h3 className="text-lg font-medium text-black mb-2">All Clear</h3>
            <p className="text-gray-600">No missions for today. Check back tomorrow for new protocols.</p>
          </Card>
        )}
      </div>
    </div>
  );
}