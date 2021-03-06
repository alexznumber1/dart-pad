// Copyright (c) 2015, Atrox. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The Haikunator library.
///
/// Generate Heroku-like random names to use in your dart applications.
library haikunator;

import 'dart:math' show Random;

class Haikunator {
  static final Random rndm = new Random();
  static final adjectives = [
    "autumn", "hidden", "bitter", "misty", "silent", "empty", "dry", "dark",
    "summer", "icy", "delicate", "quiet", "white", "cool", "spring", "winter",
    "patient", "twilight", "dawn", "crimson", "wispy", "weathered", "blue",
    "billowing", "broken", "cold", "damp", "falling", "frosty", "green",
    "long", "late", "lingering", "bold", "little", "morning", "muddy", "old",
    "red", "rough", "still", "small", "sparkling", "throbbing", "shy",
    "wandering", "withered", "wild", "black", "young", "holy", "solitary",
    "fragrant", "aged", "snowy", "proud", "floral", "restless", "divine",
    "polished", "ancient", "purple", "lively", "nameless", "lucky", "odd", "tiny",
    "free", "dry", "yellow", "orange", "gentle", "tight", "super", "royal", "broad",
    "steep", "flat", "square", "round", "mute", "noisy", "hushy", "raspy", "soft",
    "shrill", "rapid", "sweet", "curly", "calm", "jolly", "fancy", "plain", "shinny"
  ];
  static final nouns = [
    "waterfall", "river", "breeze", "moon", "rain", "wind", "sea", "morning",
    "snow", "lake", "sunset", "pine", "shadow", "leaf", "dawn", "glitter",
    "forest", "hill", "cloud", "meadow", "sun", "glade", "bird", "brook",
    "butterfly", "bush", "dew", "dust", "field", "fire", "flower", "firefly",
    "feather", "grass", "haze", "mountain", "night", "pond", "darkness",
    "snowflake", "silence", "sound", "sky", "shape", "surf", "thunder",
    "violet", "water", "wildflower", "wave", "water", "resonance", "sun",
    "wood", "dream", "cherry", "tree", "fog", "frost", "voice", "paper",
    "frog", "smoke", "star", "atom", "band", "bar", "base", "block", "boat",
    "term", "credit", "art", "fashion", "truth", "disk", "math", "unit", "cell",
    "scene", "heart", "recipe", "union", "limit", "bread", "toast", "bonus",
    "lab", "mud", "mode", "poetry", "tooth", "hall", "king", "queen", "lion", "tiger",
    "penguin", "kiwi", "cake", "mouse", "rice", "coke", "hola", "salad", "hat"
  ];
  
  static String haikunate({String delimiter: "-", int tokenLength: 4, bool tokenHex: false, String tokenChars: "0123456789"}) {
    String adjective, noun, token = "";
    
    if (tokenHex) tokenChars = "0123456789abcdef";
    
    adjective = adjectives[rndm.nextInt(adjectives.length)];
    noun = nouns[rndm.nextInt(nouns.length)];
    
    for(var i = 0; i < tokenLength; i++) {
      token += tokenChars[rndm.nextInt(tokenChars.length)];
    }
    
    var sections = [adjective, noun, token];
    sections.removeWhere((item) => item.isEmpty);
    
    return sections.join(delimiter);
  }
}