#require 'sinatra'
require 'pry'

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

# suffixlist = []

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
		#suffixlist ||= []
		
		# suffixlist.push(suffix)
		# prefixes[prefix] = suffixlist
	end
	end
 
f.close

	#prefix_prob = {}
	#prefix_prob = Hash[arr.map { |suffix| [suffix,prob]}]
	prefixes.each do |prefix, arr|
		
		prefix_prob = Hash[arr.map { |suffix| [suffix,0]}]
		prefixes[prefix] = prefix_prob
		
		total_words = arr.length
		arr.each do |suffix|
			occurrences = count_words(arr, suffix) + 0.0
			prob = occurrences/total_words
			prefixes[prefix][suffix] = prob
		end
		
		
		#binding.pry
		#arr = prefixes[prefix]
		
			#suffix = {suffix => prob}
			#pref_probs[prefix][suffix]=prob
			#binding.pry
		end

		prefixes
end


def generate
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



