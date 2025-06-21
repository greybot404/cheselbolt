import React from 'react';
import { Card } from '../ui/Card';
import { User } from '../../types';
import { BodyData } from '../../types';

interface BodyModuleProps {
  user: User;
  data: BodyData;
  onDataUpdate: (data: Partial<BodyData>) => void;
}

export function BodyModule({ user, data, onDataUpdate }: BodyModuleProps) {
  const tabs = [
    { id: 'face', label: 'Face' },
    { id: 'skin', label: 'Skin' },
    { id: 'hair', label: 'Hair' },
    ...(user.gender === 'male' ? [{ id: 'beard', label: 'Beard' }] : [])
  ];

  const mockAnalysis = {
    face: { score: 78, critique: 'Strong jawline with good symmetry. Consider subtle grooming adjustments.', actionPlan: [] },
    skin: { score: 72, critique: 'Generally healthy complexion. Some areas could benefit from targeted care.', actionPlan: [] },
    hair: { score: 85, critique: 'Excellent texture and style. Maintain current routine with minor adjustments.', actionPlan: [] },
    beard: { score: 80, critique: 'Well-maintained beard with good coverage. Consider trimming for sharper lines.', actionPlan: [] }
  };

  return (
    <div className="min-h-screen bg-gray-50 pt-8 pb-24 px-6">
      <div className="max-w-2xl mx-auto space-y-8">
        <div className="text-center space-y-2">
          <h1 className="text-2xl font-light text-black">Body Analysis</h1>
          <p className="text-gray-600">Comprehensive assessment and optimization</p>
        </div>

        {/* Tab Navigation */}
        <div className="flex space-x-1 bg-gray-100 p-1 rounded">
          {tabs.map((tab) => (
            <button
              key={tab.id}
              onClick={() => onDataUpdate({ activeTab: tab.id as any })}
              className={`flex-1 py-2 px-4 text-sm font-medium rounded transition-colors ${
                data.activeTab === tab.id
                  ? 'bg-white text-black shadow-sm'
                  : 'text-gray-600 hover:text-gray-900'
              }`}
            >
              {tab.label}
            </button>
          ))}
        </div>

        {/* Analysis Dashboard */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {/* Score Card */}
          <Card className="p-8 text-center">
            <div className="space-y-4">
              <h2 className="text-lg font-medium text-black capitalize">
                {data.activeTab} Score
              </h2>
              <div className="text-4xl font-light text-black">
                {mockAnalysis[data.activeTab]?.score || 0}
              </div>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div 
                  className="bg-black h-2 rounded-full" 
                  style={{ width: `${mockAnalysis[data.activeTab]?.score || 0}%` }}
                ></div>
              </div>
            </div>
          </Card>

          {/* Analysis Card */}
          <Card className="p-6">
            <h3 className="font-medium text-black mb-3 capitalize">
              {data.activeTab} Analysis
            </h3>
            <p className="text-gray-700 text-sm leading-relaxed">
              {mockAnalysis[data.activeTab]?.critique}
            </p>
          </Card>
        </div>

        {/* Additional Analysis Cards */}
        <div className="grid gap-4">
          <Card className="p-6">
            <h3 className="font-medium text-black mb-3">Optimization Protocol</h3>
            <div className="space-y-2">
              {data.activeTab === 'face' && (
                <>
                  <p className="text-gray-700 text-sm">• Maintain consistent skincare routine</p>
                  <p className="text-gray-700 text-sm">• Consider professional eyebrow shaping</p>
                  <p className="text-gray-700 text-sm">• Use SPF 30+ daily for protection</p>
                </>
              )}
              {data.activeTab === 'skin' && (
                <>
                  <p className="text-gray-700 text-sm">• Increase hydration with hyaluronic acid</p>
                  <p className="text-gray-700 text-sm">• Add vitamin C serum to morning routine</p>
                  <p className="text-gray-700 text-sm">• Exfoliate 2-3 times per week</p>
                </>
              )}
              {data.activeTab === 'hair' && (
                <>
                  <p className="text-gray-700 text-sm">• Schedule trim every 6-8 weeks</p>
                  <p className="text-gray-700 text-sm">• Use quality styling products sparingly</p>
                  <p className="text-gray-700 text-sm">• Consider scalp massage for health</p>
                </>
              )}
              {data.activeTab === 'beard' && user.gender === 'male' && (
                <>
                  <p className="text-gray-700 text-sm">• Trim edges for sharp definition</p>
                  <p className="text-gray-700 text-sm">• Use beard oil for conditioning</p>
                  <p className="text-gray-700 text-sm">• Shape neckline professionally</p>
                </>
              )}
            </div>
          </Card>
        </div>
      </div>
    </div>
  );
}