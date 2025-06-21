import React from 'react';
import { Card } from '../ui/Card';
import { Button } from '../ui/Button';
import { Upload, Target, TrendingUp, Camera } from 'lucide-react';
import { FitnessData } from '../../types';

interface FitnessModuleProps {
  data: FitnessData;
  onDataUpdate: (data: Partial<FitnessData>) => void;
}

export function FitnessModule({ data, onDataUpdate }: FitnessModuleProps) {
  const [selectedGoal, setSelectedGoal] = React.useState<string | null>(null);
  const [occasion, setOccasion] = React.useState('');

  if (!data.physique) {
    return (
      <div className="min-h-screen bg-gray-50 pt-8 pb-24 px-6">
        <div className="max-w-md mx-auto space-y-8">
          <div className="text-center space-y-2">
            <h1 className="text-2xl font-light text-black">Fitness Analysis</h1>
            <p className="text-gray-600">Begin your transformation journey</p>
          </div>

          <Card className="p-8 text-center space-y-6">
            <div className="w-16 h-16 bg-gray-100 rounded-full flex items-center justify-center mx-auto">
              <Camera className="w-8 h-8 text-gray-400" />
            </div>
            <div className="space-y-2">
              <h2 className="text-lg font-medium text-black">Upload Physique</h2>
              <p className="text-gray-600 text-sm">
                To begin, upload a clear, full-body physique photograph. Ensure lighting is consistent.
              </p>
            </div>
            <Button
              onClick={() => onDataUpdate({ physique: 'uploaded' })}
              className="w-full"
              variant="primary"
            >
              Upload Physique
            </Button>
          </Card>
        </div>
      </div>
    );
  }

  if (!data.goalType && !data.goalImage) {
    return (
      <div className="min-h-screen bg-gray-50 pt-8 pb-24 px-6">
        <div className="max-w-md mx-auto space-y-8">
          <div className="text-center space-y-2">
            <h1 className="text-2xl font-light text-black">Define Goal Vector</h1>
            <p className="text-gray-600">Set your transformation target</p>
          </div>

          <div className="space-y-6">
            <Card className="p-6 space-y-4">
              <div className="text-center space-y-2">
                <Upload className="w-8 h-8 text-gray-400 mx-auto" />
                <h3 className="font-medium text-black">Upload Goal Image</h3>
                <p className="text-gray-600 text-sm">Upload a reference photo of your goal physique.</p>
              </div>
              <Button
                onClick={() => onDataUpdate({ goalImage: 'uploaded' })}
                className="w-full"
                variant="outline"
              >
                Upload Goal Image
              </Button>
            </Card>

            <div className="text-center">
              <span className="text-gray-400 font-medium">OR</span>
            </div>

            <Card className="p-6 space-y-4">
              <div className="text-center space-y-2">
                <Target className="w-8 h-8 text-gray-400 mx-auto" />
                <h3 className="font-medium text-black">Select Primary Objective</h3>
                <p className="text-gray-600 text-sm">Choose your main fitness goal.</p>
              </div>
              <div className="space-y-3">
                {[
                  { id: 'build-muscle', label: 'Build Muscle', icon: TrendingUp },
                  { id: 'lose-fat', label: 'Lose Fat', icon: TrendingUp },
                  { id: 'improve-definition', label: 'Improve Definition', icon: TrendingUp }
                ].map((goal) => (
                  <Button
                    key={goal.id}
                    onClick={() => onDataUpdate({ goalType: goal.id as any })}
                    className="w-full"
                    variant="outline"
                  >
                    {goal.label}
                  </Button>
                ))}
              </div>
            </Card>
          </div>
        </div>
      </div>
    );
  }

  // Results Dashboard
  return (
    <div className="min-h-screen bg-gray-50 pt-8 pb-24 px-6">
      <div className="max-w-2xl mx-auto space-y-8">
        <div className="text-center space-y-2">
          <h1 className="text-2xl font-light text-black">Fitness Analysis</h1>
          <p className="text-gray-600">Your comprehensive physique assessment</p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {/* Score Card */}
          <Card className="p-8 text-center">
            <div className="space-y-4">
              <h2 className="text-lg font-medium text-black">Physique Score</h2>
              <div className="text-4xl font-light text-black">74</div>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div className="bg-black h-2 rounded-full" style={{ width: '74%' }}></div>
              </div>
            </div>
          </Card>

          {/* Analysis Cards */}
          <div className="space-y-4">
            <Card className="p-6">
              <h3 className="font-medium text-black mb-3">Critique</h3>
              <p className="text-gray-700 text-sm leading-relaxed">
                Your upper body shows strong development, but a slight asymmetry is noted in the lats. 
                Leanness is adequate but could be improved by 2-3% to reveal greater abdominal definition.
              </p>
            </Card>

            <Card className="p-6">
              <h3 className="font-medium text-black mb-3">Action Plan: Workout Protocol</h3>
              <ul className="text-gray-700 text-sm space-y-2">
                <li>• Add unilateral lat pulldowns to your routine</li>
                <li>• Increase weekly cardio by 20 minutes</li>
                <li>• Focus on mind-muscle connection</li>
              </ul>
            </Card>

            <Card className="p-6">
              <h3 className="font-medium text-black mb-3">Action Plan: Supplement Stack</h3>
              <ul className="text-gray-700 text-sm space-y-2">
                <li>• Creatine monohydrate: 5g daily</li>
                <li>• Whey protein: 25g post-workout</li>
                <li>• L-Carnitine: 2g pre-cardio</li>
              </ul>
            </Card>
          </div>
        </div>
      </div>
    </div>
  );
}