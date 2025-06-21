export interface User {
  id: string;
  gender: 'male' | 'female';
  onboardingComplete: boolean;
}

export interface Mission {
  id: string;
  title: string;
  description: string;
  module: string;
  completed: boolean;
  date: string;
}

export interface AnalysisResult {
  score: number;
  critique: string;
  actionPlan: string[];
}

export interface FitnessData {
  physique?: string;
  goalType?: 'build-muscle' | 'lose-fat' | 'improve-definition';
  goalImage?: string;
  analysis?: AnalysisResult;
}

export interface FashionData {
  mode?: 'review' | 'finder' | 'stylist';
  outfit?: string;
  occasion?: string;
  analysis?: AnalysisResult;
}

export interface BodyData {
  activeTab: 'face' | 'skin' | 'hair' | 'beard';
  analysis?: Record<string, AnalysisResult>;
}

export interface PresenceData {
  messages: Array<{
    id: string;
    text: string;
    isUser: boolean;
    timestamp: Date;
  }>;
  analysis?: AnalysisResult;
}