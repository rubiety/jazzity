VoicingFamily.create!(:name => "Traids", :voicing_tones_count => 3, :rootless => false).tap do |family|
  v = {}

  c = Chord.find_by_name("Major Triad").tap do |c|
    v[:maj]  = c.voicings.create!(:voicing_family => family, :name => "Root Inversion", :specify_tones => "u 3 5")
    v[:maj1] = c.voicings.create!(:voicing_family => family, :name => "1st Inversion", :specify_tones => "3 5 u")
    v[:maj2] = c.voicings.create!(:voicing_family => family, :name => "2nd Inversion", :specify_tones => "5 u 3")
    v[:majd] = c.voicings.create!(:voicing_family => family, :name => "Doubled Root", :specify_tones => "u 3 5 u")
  end

  Chord.find_by_name("Minor Triad").tap do |c|
    v[:min]  = c.voicings.create!(:voicing_family => family, :name => "Root Inversion", :specify_tones => "u m3 5")
    v[:min1] = c.voicings.create!(:voicing_family => family, :name => "1st Inversion", :specify_tones => "m3 5 u")
    v[:min2] = c.voicings.create!(:voicing_family => family, :name => "2nd Inversion", :specify_tones => "5 u m3")
    v[:mind] = c.voicings.create!(:voicing_family => family, :name => "Doubled Root", :specify_tones => "u m3 5 u")
  end

  Chord.find_by_name("Diminished Triad").tap do |c|
    v[:dim]  = c.voicings.create!(:voicing_family => family, :name => "Root Inversion", :specify_tones => "u m3 b5")
    v[:dim1] = c.voicings.create!(:voicing_family => family, :name => "1st Inversion", :specify_tones => "m3 b5 u")
    v[:dim2] = c.voicings.create!(:voicing_family => family, :name => "2nd Inversion", :specify_tones => "b5 u m3")
    v[:dimd] = c.voicings.create!(:voicing_family => family, :name => "Doubled Root", :specify_tones => "u m3 b5 u")
  end

  [v[:maj], v[:min], v[:dim]].combination(2).to_a.each do |pair|
    VoiceLeading.define 0, pair[0], pair[1]
  end

  [v[:maj1], v[:min1], v[:dim1]].combination(2).to_a.each do |pair|
    VoiceLeading.define 0, pair[0], pair[1]
  end

  [v[:maj2], v[:min2], v[:dim2]].combination(2).to_a.each do |pair|
    VoiceLeading.define 0, pair[0], pair[1]
  end

  [v[:majd], v[:mind], v[:dimd]].combination(2).to_a.each do |pair|
    VoiceLeading.define 0, pair[0], pair[1]
  end

end


VoicingFamily.create!(:name => "4-Note Rooted", :voicing_tones_count => 4, :rootless => false).tap do |family|
  v = {}

  Chord.find_by_name("Major 7").tap do |c|
    v[:maj71] = c.voicings.create!(:voicing_family => family, :name => "Rooted I", :specify_tones => "u 3 5 7")
    v[:maj72] = c.voicings.create!(:voicing_family => family, :name => "Rooted II", :specify_tones => "5 7 u 3")
  end

  Chord.find_by_name("Major 6").tap do |c|
    v[:maj61] = c.voicings.create!(:voicing_family => family, :name => "Rooted I", :specify_tones => "u 3 5 6")
    v[:maj62] = c.voicings.create!(:voicing_family => family, :name => "Rooted II", :specify_tones => "5 6 u 3")
  end

  Chord.find_by_name("Minor 7").tap do |c|
    v[:min71] = c.voicings.create!(:voicing_family => family, :name => "Rooted I", :specify_tones => "u m3 5 m7")
    v[:min72] = c.voicings.create!(:voicing_family => family, :name => "Rooted II", :specify_tones => "5 m7 u m3")
  end

  Chord.find_by_name("Minor 6").tap do |c|
    v[:min61] = c.voicings.create!(:voicing_family => family, :name => "Rooted I", :specify_tones => "u m3 5 6")
    v[:min62] = c.voicings.create!(:voicing_family => family, :name => "Rooted II", :specify_tones => "5 6 u m3")
  end

  Chord.find_by_name("Minor b6").tap do |c|
    v[:minb61] = c.voicings.create!(:voicing_family => family, :name => "Rooted I", :specify_tones => "u m3 5 b6")
    v[:minb62] = c.voicings.create!(:voicing_family => family, :name => "Rooted II", :specify_tones => "5 b6 u m3")
  end

  Chord.find_by_name("Major-Minor").tap do |c|
    v[:majmin1] = c.voicings.create!(:voicing_family => family, :name => "Rooted I", :specify_tones => "u m3 5 7")
    v[:majmin2] = c.voicings.create!(:voicing_family => family, :name => "Rooted II", :specify_tones => "5 7 u m3")
  end

  Chord.find_by_name("Dominant 7").tap do |c|
    v[:dom71] = c.voicings.create!(:voicing_family => family, :name => "Rooted I", :specify_tones => "u 3 5 m7")
    v[:dom72] = c.voicings.create!(:voicing_family => family, :name => "Rooted II", :specify_tones => "5 m7 u 3")
  end

  Chord.find_by_name("Dominant b5").tap do |c|
    v[:domb51] = c.voicings.create!(:voicing_family => family, :name => "Rooted I", :specify_tones => "u 3 b5 m7")
    v[:domb52] = c.voicings.create!(:voicing_family => family, :name => "Rooted II", :specify_tones => "b5 m7 u 3")
  end

  Chord.find_by_name("Half Diminished").tap do |c|
    v[:halfdim1] = c.voicings.create!(:voicing_family => family, :name => "Rooted I", :specify_tones => "u 3 b5 m7")
    v[:halfdim2] = c.voicings.create!(:voicing_family => family, :name => "Rooted II", :specify_tones => "b5 m7 u 3")
  end

  Chord.find_by_name("Full Diminished").tap do |c|
    v[:dim1] = c.voicings.create!(:voicing_family => family, :name => "Rooted I", :specify_tones => "u 3 b5 6")
    v[:dim2] = c.voicings.create!(:voicing_family => family, :name => "Rooted II", :specify_tones => "3 b5 6 u")
    v[:dim3] = c.voicings.create!(:voicing_family => family, :name => "Rooted III", :specify_tones => "b5 6 u 3")
    v[:dim4] = c.voicings.create!(:voicing_family => family, :name => "Rooted IV", :specify_tones => "6 u 3 b5")
  end

  [v[:maj71], v[:maj61], v[:min61], v[:minb61], v[:majmin1], v[:dom71], v[:domb51], v[:halfdim1]].combination(2).to_a.each do |pair|
    VoiceLeading.define 0, pair[0], pair[1]
  end

  [v[:maj72], v[:maj62], v[:min62], v[:minb62], v[:majmin2], v[:dom72], v[:domb52], v[:halfdim2]].combination(2).to_a.each do |pair|
    VoiceLeading.define 0, pair[0], pair[1]
  end

  # This is fairly crude but basically takes all chords and voice-leadings "1" => "2" and "2" => "1" for up a fourth / down a 5th intervals:
  [:maj7, :maj6, :min6, :minb6, :majmin, :dom7, :domb5, :halfdim].combination(2).to_a.each do |pair|
    VoiceLeading.define 5, v["#{pair[0]}1".to_sym], v["#{pair[1]}2".to_sym]
    VoiceLeading.define 5, v["#{pair[0]}2".to_sym], v["#{pair[1]}1".to_sym]
  end
end


VoicingFamily.create!(:name => "Guide Tones", :voicing_tones_count => 2, :rootless => true).tap do |family|
  Chord.find_by_name("Major 7").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Guide Tones I", :specify_tones => "3 7")
    c.voicings.create!(:voicing_family => family, :name => "Guide Tones II", :specify_tones => "7 3")
  end

  Chord.find_by_name("Major 6").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Guide Tones I", :specify_tones => "3 6")
    c.voicings.create!(:voicing_family => family, :name => "Guide Tones I", :specify_tones => "6 3")
  end

  Chord.find_by_name("Minor 7").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Guide Tones I", :specify_tones => "m3 m7")
    c.voicings.create!(:voicing_family => family, :name => "Guide Tones II", :specify_tones => "m7 m3")
  end

  Chord.find_by_name("Minor 6").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Guide Tones I", :specify_tones => "m3 6")
    c.voicings.create!(:voicing_family => family, :name => "Guide Tones II", :specify_tones => "6 m3")
  end

  Chord.find_by_name("Minor b6").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Guide Tones I", :specify_tones => "m3 b6")
    c.voicings.create!(:voicing_family => family, :name => "Guide Tones II", :specify_tones => "b6 m3")
  end

  Chord.find_by_name("Major-Minor").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Guide Tones I", :specify_tones => "m3 7")
    c.voicings.create!(:voicing_family => family, :name => "Guide Tones II", :specify_tones => "7 m3")
  end

  Chord.find_by_name("Dominant 7").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Guide Tones I", :specify_tones => "3 m7")
    c.voicings.create!(:voicing_family => family, :name => "Guide Tones II", :specify_tones => "m7 3")
  end
end


VoicingFamily.create!(:name => "Rooted Guide Tones", :voicing_tones_count => 3, :rootless => true).tap do |family|
  Chord.find_by_name("Major 7").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Rooted Guide Tones I", :specify_tones => "u 3 7")
    c.voicings.create!(:voicing_family => family, :name => "Rooted Guide Tones II", :specify_tones => "u 7 3")
  end

  Chord.find_by_name("Major 6").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Rooted Guide Tones I", :specify_tones => "u 3 6")
    c.voicings.create!(:voicing_family => family, :name => "Rooted Guide Tones II", :specify_tones => "u 6 3")
  end

  Chord.find_by_name("Minor 7").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Rooted Guide Tones I", :specify_tones => "u m3 m7")
    c.voicings.create!(:voicing_family => family, :name => "Rooted Guide Tones II", :specify_tones => "u m7 m3")
  end

  Chord.find_by_name("Minor 6").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Rooted Guide Tones I", :specify_tones => "u m3 6")
    c.voicings.create!(:voicing_family => family, :name => "Rooted Guide Tones II", :specify_tones => "u 6 m3")
  end

  Chord.find_by_name("Minor b6").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Rooted Guide Tones I", :specify_tones => "u m3 b6")
    c.voicings.create!(:voicing_family => family, :name => "Rooted Guide Tones II", :specify_tones => "u b6 m3")
  end

  Chord.find_by_name("Major-Minor").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Rooted Guide Tones I", :specify_tones => "u m3 7")
    c.voicings.create!(:voicing_family => family, :name => "Rooted Guide Tones II", :specify_tones => "u 7 m3")
  end

  Chord.find_by_name("Dominant 7").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Rooted Guide Tones I", :specify_tones => "u 3 m7")
    c.voicings.create!(:voicing_family => family, :name => "Rooted Guide Tones II", :specify_tones => "u m7 3")
  end
end


VoicingFamily.create!(:name => "Rootless 3-Note Shells", :voicing_tones_count => 3, :rootless => true).tap do |family|
  Chord.find_by_name("Major 7").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Shell I", :specify_tones => "3 7 9")
    c.voicings.create!(:voicing_family => family, :name => "Shell II", :specify_tones => "7 3 5")
  end

  Chord.find_by_name("Major 6").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Shell I", :specify_tones => "3 6 9")
    c.voicings.create!(:voicing_family => family, :name => "Shell II", :specify_tones => "6 9 5")
  end

  Chord.find_by_name("Minor 7").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Shell I", :specify_tones => "m3 m7 9")
    c.voicings.create!(:voicing_family => family, :name => "Shell II", :specify_tones => "m7 m3 5")
  end

  Chord.find_by_name("Minor 6").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Shell I", :specify_tones => "m3 6 9")
    c.voicings.create!(:voicing_family => family, :name => "Shell II", :specify_tones => "6 m3 5")
  end

  Chord.find_by_name("Minor b6").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Shell I", :specify_tones => "m3 b6 9")
    c.voicings.create!(:voicing_family => family, :name => "Shell II", :specify_tones => "b6 m3 5")
  end

  Chord.find_by_name("Major-Minor").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Shell I", :specify_tones => "m3 7 9")
    c.voicings.create!(:voicing_family => family, :name => "Shell II", :specify_tones => "7 m3 5")
  end

  Chord.find_by_name("Dominant 7").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Shell I", :specify_tones => "3 b7 9")
    c.voicings.create!(:voicing_family => family, :name => "Shell II", :specify_tones => "b7 3 5")
  end
  Chord.find_by_name("Dominant 9").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Shell I", :specify_tones => "3 b7 9")
  end
  Chord.find_by_name("Dominant 6/9").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Shell II", :specify_tones => "b7 3 6")
  end
  Chord.find_by_name("Dominant b9").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Shell I", :specify_tones => "3 b7 b9")
  end
  Chord.find_by_name("Dominant #9").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Shell I", :specify_tones => "3 b7 #9")
  end
  Chord.find_by_name("Altered").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Shell I", :specify_tones => "3 b7 #9")
    c.voicings.create!(:voicing_family => family, :name => "Shell II", :specify_tones => "b7 3 #5")
  end

  Chord.find_by_name("Dominant b5").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Shell II", :specify_tones => "b7 3 b5")
  end

  Chord.find_by_name("Half Diminished").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Shell II", :specify_tones => "b7 3 b5")
  end

  Chord.find_by_name("Full Diminished").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Shell I", :specify_tones => "3 b5 6")
    c.voicings.create!(:voicing_family => family, :name => "Shell II", :specify_tones => "3 b5 6")
    c.voicings.create!(:voicing_family => family, :name => "Shell III", :specify_tones => "b5 6 3")
    c.voicings.create!(:voicing_family => family, :name => "Shell IV", :specify_tones => "6 3 b5")
  end
end


VoicingFamily.create!(:name => "4-Note Rootless (Type I/II)", :voicing_tones_count => 4, :rootless => true).tap do |family|
  Chord.find_by_name("Major 7").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Type I", :specify_tones => "3 5 7 9")
    c.voicings.create!(:voicing_family => family, :name => "Type II", :specify_tones => "7 9 3 5")
  end

  Chord.find_by_name("Major 6").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Type I", :specify_tones => "3 5 6 9")
    c.voicings.create!(:voicing_family => family, :name => "Type II", :specify_tones => "6 9 3 5")
  end

  Chord.find_by_name("Minor 7").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Type I", :specify_tones => "m3 5 m7 9")
    c.voicings.create!(:voicing_family => family, :name => "Type II", :specify_tones => "m7 9 m3 5")
  end

  Chord.find_by_name("Minor 6").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Type I", :specify_tones => "m3 5 6 9")
    c.voicings.create!(:voicing_family => family, :name => "Type II", :specify_tones => "6 9 m3 5")
  end

  Chord.find_by_name("Minor b6").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Type I", :specify_tones => "m3 5 b6 9")
    c.voicings.create!(:voicing_family => family, :name => "Type II", :specify_tones => "b6 9 m3 5")
  end

  Chord.find_by_name("Major-Minor").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Type I", :specify_tones => "m3 5 7 9")
    c.voicings.create!(:voicing_family => family, :name => "Type II", :specify_tones => "7 9 m3 5")
  end

  Chord.find_by_name("Dominant 7").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Type I", :specify_tones => "3 5 b7 9")
    c.voicings.create!(:voicing_family => family, :name => "Type II", :specify_tones => "b7 9 3 5")
  end
  Chord.find_by_name("Dominant 9").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Type I", :specify_tones => "3 5 b7 9")
    c.voicings.create!(:voicing_family => family, :name => "Type II", :specify_tones => "b7 9 3 5")
  end
  Chord.find_by_name("Dominant 6/9").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Type I", :specify_tones => "3 6 b7 9")
    c.voicings.create!(:voicing_family => family, :name => "Type II", :specify_tones => "b7 9 3 6")
  end
  Chord.find_by_name("Dominant b9").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Type I", :specify_tones => "3 5 b7 b9")
    c.voicings.create!(:voicing_family => family, :name => "Type II", :specify_tones => "b7 b9 3 5")
  end
  Chord.find_by_name("Dominant #9").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Type I", :specify_tones => "3 5 b7 #9")
    c.voicings.create!(:voicing_family => family, :name => "Type II", :specify_tones => "b7 #9 3 5")
  end
  Chord.find_by_name("Altered").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Type I", :specify_tones => "3 #5 b7 #9")
    c.voicings.create!(:voicing_family => family, :name => "Type II", :specify_tones => "b7 #9 3 #5")
  end

  Chord.find_by_name("Dominant b5").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Type I", :specify_tones => "3 b5 m7 9")
    c.voicings.create!(:voicing_family => family, :name => "Type II", :specify_tones => "m7 9 3 b5")
  end

  Chord.find_by_name("Half Diminished").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Type I", :specify_tones => "3 b5 m7 9")
    c.voicings.create!(:voicing_family => family, :name => "Type II", :specify_tones => "m7 9 3 b5")
  end

  Chord.find_by_name("Full Diminished").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Type I", :specify_tones => "3 b5 6 9")
    c.voicings.create!(:voicing_family => family, :name => "Type II", :specify_tones => "b5 6 9 3")
    c.voicings.create!(:voicing_family => family, :name => "Type III", :specify_tones => "6 9 3 b5")
  end
end


VoicingFamily.create!(:name => "4-Note Shell Extensions", :voicing_tones_count => 4, :rootless => true).tap do |family|
  # TODO: Need Voicing Books
end


VoicingFamily.create!(:name => "5-Note Shell Extensions", :voicing_tones_count => 5, :rootless => true).tap do |family|
  # TODO: Need Voicing Books
end


VoicingFamily.create!(:name => "5-Note Quartal", :voicing_tones_count => 5, :rootless => true).tap do |family|
  # TODO: Need Voicing Books
end


VoicingFamily.create!(:name => "6-Note Quartal", :voicing_tones_count => 6, :rootless => true).tap do |family|
  # TODO: Need Voicing Books
end


VoicingFamily.create!(:name => "Upper Structures", :voicing_tones_count => 5, :rootless => true).tap do |family|
  # TODO: Need Voicing Books

  Chord.find_by_name("Altered").tap do |c|
    c.voicings.create!(:voicing_family => family, :name => "Dominant #5 Upper Structure I", :specify_tones => "3 b7 b6 u b3")
    c.voicings.create!(:voicing_family => family, :name => "Dominant #5 Upper Structure I 1st Inversion", :specify_tones => "3 b7 b3 b6 u")
    c.voicings.create!(:voicing_family => family, :name => "Dominant #5 Upper Structure II", :specify_tones => "b7 3 u b3 b6")
    c.voicings.create!(:voicing_family => family, :name => "Dominant #5 Upper Structure II 1st Inversion", :specify_tones => "b7 3 b3 b6 u")
  end
end

