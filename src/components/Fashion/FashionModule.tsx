import React, { useState } from 'react';
import { motion } from 'framer-motion';
import { Shirt, Star, Calendar, Palette } from 'lucide-react';
import { Card } from '../ui/Card';

const FashionModule: React.FC = () => {
  const [selectedCategory, setSelectedCategory] = useState('all');

  const outfits = [
    {
      id: 1,
      name: 'Business Casual',
      category: 'work',
      rating: 4.5,
      lastWorn: '3 days ago',
      items: ['Navy Blazer', 'White Shirt', 'Dark Jeans', 'Brown Loafers'],
      color: 'from-blue-500/20 to-indigo-500/20'
    },
    {
      id: 2,
      name: 'Weekend Comfort',
      category: 'casual',
      rating: 4.8,
      lastWorn: '1 week ago',
      items: ['Grey Hoodie', 'Black Joggers', 'White Sneakers'],
      color: 'from-gray-500/20 to-slate-500/20'
    },
    {
      id: 3,
      name: 'Date Night',
      category: 'formal',
      rating: 5.0,
      lastWorn: '2 weeks ago',
      items: ['Black Dress Shirt', 'Charcoal Trousers', 'Black Oxfords'],
      color: 'from-purple-500/20 to-pink-500/20'
    },
  ];

  const categories = [
    { id: 'all', name: 'All', count: outfits.length },
    { id: 'work', name: 'Work', count: outfits.filter(o => o.category === 'work').length },
    { id: 'casual', name: 'Casual', count: outfits.filter(o => o.category === 'casual').length },
    { id: 'formal', name: 'Formal', count: outfits.filter(o => o.category === 'formal').length },
  ];

  const styleStats = [
    { label: 'Outfits', value: '24', icon: Shirt },
    { label: 'Avg Rating', value: '4.6', icon: Star },
    { label: 'This Month', value: '12', icon: Calendar },
    { label: 'Colors', value: '8', icon: Palette },
  ];

  const filteredOutfits = selectedCategory === 'all' 
    ? outfits 
    : outfits.filter(outfit => outfit.category === selectedCategory);

  return (
    <div className="space-y-6">
      {/* Fashion Stats */}
      <Card className="p-6">
        <div className="flex items-center justify-between mb-6">
          <div>
            <h2 className="text-2xl font-bold text-white mb-1">Style Tracker</h2>
            <p className="text-white/70">Your fashion journey</p>
          </div>
          <Shirt className="w-8 h-8 text-indigo-400" />
        </div>

        <div className="grid grid-cols-2 gap-4">
          {styleStats.map((stat, index) => {
            const Icon = stat.icon;
            return (
              <motion.div
                key={stat.label}
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: index * 0.1, duration: 0.6 }}
                className="bg-white/5 rounded-xl p-4 border border-white/10"
              >
                <Icon className="w-5 h-5 text-indigo-400 mb-2" />
                <div className="text-2xl font-bold text-white">{stat.value}</div>
                <div className="text-white/70 text-sm">{stat.label}</div>
              </motion.div>
            );
          })}
        </div>
      </Card>

      {/* Category Filter */}
      <Card className="p-6">
        <h3 className="text-lg font-semibold text-white mb-4">Categories</h3>
        <div className="flex space-x-2 overflow-x-auto">
          {categories.map((category) => (
            <motion.button
              key={category.id}
              onClick={() => setSelectedCategory(category.id)}
              className={`px-4 py-2 rounded-xl border transition-all duration-300 whitespace-nowrap ${
                selectedCategory === category.id
                  ? 'bg-indigo-500/20 border-indigo-400/30 text-white'
                  : 'bg-white/5 border-white/10 text-white/70 hover:bg-white/10'
              }`}
              whileHover={{ scale: 1.05 }}
              whileTap={{ scale: 0.95 }}
            >
              {category.name} ({category.count})
            </motion.button>
          ))}
        </div>
      </Card>

      {/* Outfits */}
      <div className="space-y-4">
        {filteredOutfits.map((outfit, index) => (
          <motion.div
            key={outfit.id}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: index * 0.1, duration: 0.6 }}
          >
            <Card className="p-6">
              <div className={`bg-gradient-to-r ${outfit.color} rounded-xl p-4 mb-4`}>
                <div className="flex items-center justify-between mb-2">
                  <h3 className="text-lg font-semibold text-white">{outfit.name}</h3>
                  <div className="flex items-center">
                    <Star className="w-4 h-4 text-yellow-400 mr-1" />
                    <span className="text-white font-medium">{outfit.rating}</span>
                  </div>
                </div>
                <p className="text-white/70 text-sm">Last worn: {outfit.lastWorn}</p>
              </div>

              <div>
                <h4 className="text-white font-medium mb-2">Items:</h4>
                <div className="flex flex-wrap gap-2">
                  {outfit.items.map((item, itemIndex) => (
                    <span
                      key={itemIndex}
                      className="px-3 py-1 bg-white/10 rounded-full text-white/80 text-sm border border-white/20"
                    >
                      {item}
                    </span>
                  ))}
                </div>
              </div>
            </Card>
          </motion.div>
        ))}
      </div>
    </div>
  );
};

export default FashionModule;