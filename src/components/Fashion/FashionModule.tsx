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
    },
    {
      id: 2,
      name: 'Weekend Comfort',
      category: 'casual',
      rating: 4.8,
      lastWorn: '1 week ago',
      items: ['Grey Hoodie', 'Black Joggers', 'White Sneakers'],
    },
    {
      id: 3,
      name: 'Date Night',
      category: 'formal',
      rating: 5.0,
      lastWorn: '2 weeks ago',
      items: ['Black Dress Shirt', 'Charcoal Trousers', 'Black Oxfords'],
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
    <div className="space-y-8 py-8">
      {/* Header */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.6 }}
        className="text-center"
      >
        <h2 className="text-2xl font-light text-black mb-2">Style Tracker</h2>
        <p className="text-gray-600 font-light">Your fashion journey</p>
      </motion.div>

      {/* Fashion Stats */}
      <div className="grid grid-cols-2 gap-4">
        {styleStats.map((stat, index) => {
          const Icon = stat.icon;
          return (
            <motion.div
              key={stat.label}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: index * 0.1, duration: 0.6 }}
            >
              <Card className="p-6 text-center">
                <Icon className="w-5 h-5 text-gray-400 mx-auto mb-3" />
                <div className="text-2xl font-light text-black mb-1">{stat.value}</div>
                <div className="text-gray-500 text-sm font-light">{stat.label}</div>
              </Card>
            </motion.div>
          );
        })}
      </div>

      {/* Category Filter */}
      <div className="space-y-4">
        <h3 className="text-lg font-light text-black">Categories</h3>
        <div className="flex space-x-2 overflow-x-auto">
          {categories.map((category) => (
            <motion.button
              key={category.id}
              onClick={() => setSelectedCategory(category.id)}
              className={`px-4 py-2 border transition-all duration-300 whitespace-nowrap font-light ${
                selectedCategory === category.id
                  ? 'bg-black text-white border-black'
                  : 'bg-white text-gray-600 border-gray-200 hover:border-gray-400'
              }`}
              whileHover={{ scale: 1.02 }}
              whileTap={{ scale: 0.98 }}
            >
              {category.name} ({category.count})
            </motion.button>
          ))}
        </div>
      </div>

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
              <div className="flex items-center justify-between mb-4">
                <h3 className="text-lg font-light text-black">{outfit.name}</h3>
                <div className="flex items-center">
                  <Star className="w-4 h-4 text-gray-400 mr-1" />
                  <span className="text-black font-light">{outfit.rating}</span>
                </div>
              </div>
              
              <p className="text-gray-500 text-sm font-light mb-4">Last worn: {outfit.lastWorn}</p>

              <div>
                <h4 className="text-black font-light mb-2">Items:</h4>
                <div className="flex flex-wrap gap-2">
                  {outfit.items.map((item, itemIndex) => (
                    <span
                      key={itemIndex}
                      className="px-3 py-1 bg-gray-100 text-gray-700 text-sm font-light border border-gray-200"
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