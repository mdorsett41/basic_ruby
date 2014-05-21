reading = File.read 'words.txt'

word_split = reading.split

def prob_one(word_split)
  word_split.each do |x|
    print (x + " ")
  end
end

def prob_two(word_split)
	# i will admit that i'm not sure if these array usage is cheating...
	listing = []
	  word_split.each do |x|
	    listing << x
	  end
	
	File.open "reverse_words.txt","w" do |x|
		x.puts(listing.reverse)
	  end
end



prob_one(word_split)

prob_two(word_split)

