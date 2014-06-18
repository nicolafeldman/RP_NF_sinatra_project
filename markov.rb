#require 'sinatra'
#require 'pry'

def count_words(arr, word)
	num = 0
	arr.each do |item|
		if item == word
			num += 1
		end
	end
	num
end


def make_hash
	prefixes={}

	f=File.open('proverbs.txt', 'r')
	f.each_line do |line|
		line=line.downcase
		a=line.split(' ')

		a.each_with_index do |prefix, i|
			suffix = a[i + 1]
			if prefixes.has_key?(prefix)
				prefixes[prefix].push(suffix)
			else prefixes[prefix] = [suffix]
			end	
		end
	end	 
	f.close

	prefixes.each do |prefix, arr|	
		prefix_prob = Hash[arr.map { |suffix| [suffix,0]}]
		prefixes[prefix] = prefix_prob
			
		total_words = arr.length
		arr.each do |suffix|
			occurrences = count_words(arr, suffix) + 0.0
			prob = occurrences/total_words
			prefixes[prefix][suffix] = prob
		end			
	end
	prefixes
end


def make_proverb
	prefixes = make_hash
	word = prefixes.keys.sample
	string = word

	while (word != nil && string.split(' ').length < 25) do
		rand_float = rand()
		suffixes = prefixes[word]
		
		top = 0.0
		suffixes.each do |suffix, prob|
			if suffix == nil
				word = nil
				break
			end
			top += prob
			if rand_float < top
				string = string + ' ' + suffix
				word = suffix
				break
			end
		end
	end
	string
end

def generate
	proverb = ''
	too_short = true
	while (too_short == true) do
		proverb = make_proverb
		if (proverb.split(' ').length > 5)
			too_short = false
		end
	end
	proverb
end
