
wards = [
  { :id => 1, :name => "足立区"   , :roman_name => "adachi"     },
  { :id => 2, :name => "荒川区"   , :roman_name => "arakawa"    },
  { :id => 3, :name => "板橋区"   , :roman_name => "itabashi"   },
  { :id => 4, :name => "江戸川区" , :roman_name => "edogawa"    },
  { :id => 5, :name => "大田区"   , :roman_name => "oota"       },
  { :id => 6, :name => "葛飾区"   , :roman_name => "katsushika" },
  { :id => 7, :name => "北区"     , :roman_name => "kita"       },
  { :id => 8, :name => "江東区"   , :roman_name => "koutou"     },
  { :id => 9, :name => "品川区"   , :roman_name => "shinagawa"  },
  { :id => 10, :name => "渋谷区"  , :roman_name => "shibuya"    },
  { :id => 11, :name => "新宿区"  , :roman_name => "shinju"     },
  { :id => 12, :name => "杉並区"  , :roman_name => "suginami"   },
  { :id => 13, :name => "墨田区"  , :roman_name => "sumida"     },
  { :id => 14, :name => "世田谷区", :roman_name => "setagaya"   },
  { :id => 15, :name => "台東区"  , :roman_name => "taitou"     },
  { :id => 16, :name => "中央区"  , :roman_name => "chuuou"     },
  { :id => 17, :name => "千代田区", :roman_name => "chiyoda"    },
  { :id => 18, :name => "豊島区"  , :roman_name => "toshima"    },
  { :id => 19, :name => "中野区"  , :roman_name => "nakano"     },
  { :id => 20, :name => "練馬区"  , :roman_name => "nerima"     },
  { :id => 21, :name => "文京区"  , :roman_name => "bunkyou"    },
  { :id => 22, :name => "港区"    , :roman_name => "minato"     },
  { :id => 23, :name => "目黒区"  , :roman_name => "meguro"     }
]
wards.each do |ward|
  Ward.seed(:id) do |s|
    s.id   = ward[:id]
    s.name = ward[:name]
    s.roman_name = ward[:roman_name]
  end
end
