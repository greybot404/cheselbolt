import React from 'react';
import { cn } from '../../utils/cn';

interface CardProps {
  children: React.ReactNode;
  className?: string;
  onClick?: () => void;
  selected?: boolean;
}

export function Card({ children, className, onClick, selected }: CardProps) {
  return (
    <div
      className={cn(
        'bg-white border border-gray-100 shadow-sm transition-all duration-300',
        onClick ? 'cursor-pointer hover:shadow-md hover:border-gray-200' : '',
        selected ? 'border-black shadow-md' : '',
        className
      )}
      onClick={onClick}
    >
      {children}
    </div>
  );
}