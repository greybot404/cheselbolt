import React from 'react';
import { Card } from '../ui/Card';
import { User, UserCheck } from 'lucide-react';

interface GenderSelectionProps {
  onGenderSelect: (gender: 'male' | 'female') => void;
}

export function GenderSelection({ onGenderSelect }: GenderSelectionProps) {
  const [selectedGender, setSelectedGender] = React.useState<'male' | 'female' | null>(null);

  const handleSelection = (gender: 'male' | 'female') => {
    setSelectedGender(gender);
    // Small delay for visual feedback
    setTimeout(() => {
      onGenderSelect(gender);
    }, 200);
  };

  return (
    <div className="min-h-screen bg-white flex flex-col items-center justify-center p-8">
      <div className="max-w-md w-full space-y-12">
        <div className="text-center space-y-4">
          <h1 className="text-3xl font-light text-black">Select Profile</h1>
          <p className="text-gray-600">Choose your profile to personalize your experience</p>
        </div>

        <div className="grid grid-cols-1 gap-6">
          <Card
            className="p-8 text-center"
            onClick={() => handleSelection('male')}
            selected={selectedGender === 'male'}
          >
            <div className="space-y-4">
              <div className="flex justify-center">
                {selectedGender === 'male' ? (
                  <UserCheck className="w-12 h-12 text-black" />
                ) : (
                  <User className="w-12 h-12 text-gray-400" />
                )}
              </div>
              <h2 className="text-xl font-medium text-black">Male</h2>
            </div>
          </Card>

          <Card
            className="p-8 text-center"
            onClick={() => handleSelection('female')}
            selected={selectedGender === 'female'}
          >
            <div className="space-y-4">
              <div className="flex justify-center">
                {selectedGender === 'female' ? (
                  <UserCheck className="w-12 h-12 text-black" />
                ) : (
                  <User className="w-12 h-12 text-gray-400" />
                )}
              </div>
              <h2 className="text-xl font-medium text-black">Female</h2>
            </div>
          </Card>
        </div>
      </div>
    </div>
  );
}