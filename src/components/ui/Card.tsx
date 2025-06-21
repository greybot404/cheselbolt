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
        'bg-white border-2 transition-all duration-200',
        onClick ? 'cursor-pointer hover:border-gray-400' : 'border-gray-200',
        selected ? 'border-black' : 'border-gray-200',
        className
      )}
      onClick={onClick}
    >
      {children}
    </div>
  );
}