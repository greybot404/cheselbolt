import React from 'react';
import { Card } from '../ui/Card';
import { Button } from '../ui/Button';
import { Camera, Search, Sparkles, Upload } from 'lucide-react';
import { FashionData } from '../../types';

interface FashionModuleProps {
  data: FashionData;
  onDataUpdate: (data: Partial<FashionData>) => void;
}

export function FashionModule({ data, onDataUpdate }: FashionModuleProps) {
  const [occasion, setOccasion] = React.useState('');

  if (!data.mode) {
    return (
      <div className="min-h-screen bg-gray-50 pt-8 pb-24 px-6">
        <div className="max-w-md mx-auto space-y-8">
          <div className="text-center space-y-2">
            <h1 className="text-2xl font-light text-black">Fashion Intelligence</h1>
            <p className="text-gray-600">Elevate your style with AI-powered insights</p>
          </div>

          <div className="space-y-4">
            <Card
              className="p-6 text-center space-y-4 cursor-pointer hover:border-gray-400"
              onClick={() => onDataUpdate({ mode: 'review' })}
            >
              <Camera className="w-8 h-8 text-gray-400 mx-auto" />
              <div>
                <h3 className="font-medium text-black">Outfit Review</h3>
                <p className="text-gray-600 text-sm">Get a critical score on your current outfit.</p>
              </div>
            </Card>

            <Card
              className="p-6 text-center space-y-4 cursor-pointer hover:border-gray-400"
              onClick={() => onDataUpdate({ mode: 'finder' })}
            >
              <Search className="w-8 h-8 text-gray-400 mx-auto" />
              <div>
                <h3 className="font-medium text-black">Outfit Finder</h3>
                <p className="text-gray-600 text-sm">Identify items in a photo.</p>
              </div>
            </Card>

            <Card
              className="p-6 text-center space-y-4 cursor-pointer hover:border-gray-400"
              onClick={() => onDataUpdate({ mode: 'stylist' })}
            >
              <Sparkles className="w-8 h-8 text-gray-400 mx-auto" />
              <div>
                <h3 className="font-medium text-black">Personal Stylist</h3>
                <p className="text-gray-600 text-sm">Get an outfit suggestion for an occasion.</p>
              </div>
            </Card>
          </div>
        </div>
      </div>
    );
  }

  if (data.mode === 'review' && !data.outfit) {
    return (
      <div className="min-h-screen bg-gray-50 pt-8 pb-24 px-6">
        <div className="max-w-md mx-auto space-y-8">
          <div className="text-center space-y-2">
            <h1 className="text-2xl font-light text-black">Upload Your Outfit</h1>
            <p className="text-gray-600">Take a clear photo of your complete outfit</p>
          </div>

          <Card className="p-8 text-center space-y-6">
            <Upload className="w-16 h-16 text-gray-400 mx-auto" />
            <Button
              onClick={() => onDataUpdate({ outfit: 'uploaded' })}
              className="w-full"
              variant="primary"
            >
              Upload Outfit Photo
            </Button>
          </Card>
        </div>
      </div>
    );
  }

  if (data.mode === 'review' && data.outfit && !data.occasion) {
    return (
      <div className="min-h-screen bg-gray-50 pt-8 pb-24 px-6">
        <div className="max-w-md mx-auto space-y-8">
          <div className="text-center space-y-2">
            <h1 className="text-2xl font-light text-black">Specify Occasion</h1>
            <p className="text-gray-600">Help us provide the most relevant feedback</p>
          </div>

          <Card className="p-6 space-y-4">
            <label className="block">
              <span className="text-sm font-medium text-gray-700 mb-2 block">Occasion</span>
              <input
                type="text"
                value={occasion}
                onChange={(e) => setOccasion(e.target.value)}
                placeholder="e.g., Board Meeting, Casual Weekend, etc."
                className="w-full px-3 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-black focus:border-transparent"
              />
            </label>
            <Button
              onClick={() => onDataUpdate({ occasion })}
              disabled={occasion.length < 5}
              className="w-full"
              variant="primary"
            >
              Analyze Outfit
            </Button>
          </Card>
        </div>
      </div>
    );
  }

  // Results
  return (
    <div className="min-h-screen bg-gray-50 pt-8 pb-24 px-6">
      <div className="max-w-2xl mx-auto space-y-8">
        <div className="text-center space-y-2">
          <h1 className="text-2xl font-light text-black">Fashion Analysis</h1>
          <p className="text-gray-600">Your style assessment and recommendations</p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {/* Image Panel */}
          <Card className="p-6">
            <div className="aspect-[3/4] bg-gray-100 rounded flex items-center justify-center">
              <Camera className="w-12 h-12 text-gray-400" />
            </div>
          </Card>

          {/* Analysis Panel */}
          <div className="space-y-4">
            <Card className="p-6 text-center">
              <h3 className="font-medium text-black mb-2">Review Score</h3>
              <div className="text-3xl font-light text-black">82</div>
            </Card>

            <Card className="p-6">
              <h3 className="font-medium text-black mb-3">Stylist's Critique</h3>
              <p className="text-gray-700 text-sm leading-relaxed">
                Excellent color coordination and fit. The navy blazer complements your complexion well. 
                Consider adding a pocket square for elevated sophistication.
              </p>
            </Card>

            <Card className="p-6">
              <h3 className="font-medium text-black mb-3">Enhancement Protocol</h3>
              <div className="space-y-2">
                <div className="flex items-start space-x-2">
                  <span className="text-xs text-gray-500 mt-1">•</span>
                  <p className="text-gray-700 text-sm">
                    <strong>Suggestion:</strong> Swap the leather belt for a woven one to add texture.
                  </p>
                </div>
                <div className="flex items-start space-x-2">
                  <span className="text-xs text-gray-500 mt-1">•</span>
                  <p className="text-gray-700 text-sm">
                    <strong>Upgrade:</strong> Consider Italian leather loafers for a premium finish.
                  </p>
                </div>
              </div>
            </Card>
          </div>
        </div>
      </div>
    </div>
  );
}