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

	#pref_probs = prefixes
	prefix_prob={}
	prefixes.each do |prefix, arr|
		
		prefixprob[arr.map { |suffix| [suffix,prob]}]
		#arr = prefixes[prefix]
		total_words = arr.length
		arr.each do |suffix|
			occurrences = count_words(arr, suffix)
			prob = occurrences/total_words

			#suffix = {suffix => prob}
			pref_probs[prefix][suffix]=prob
			binding.pry
		end
	end





	# a.each_with_index do |prefix, i|
	# 	suffix=a[i+1]
		
	# 	if prefixes.has_key?(prefix)
	# 		initialwords=(prefixes[prefix].length+1.0)
	# 		occur = count_words(prefixes[prefix],suffix)
	# 		prefixes[prefix][suffix]=occur/initialwords

	# 		# if prefixes[word].has_key(a[i+1])
	# 		# 	prob
	# 		# end
			
	# 		prefixes[prefix].each do |suffix, prob|
	# 			if prefixes[prefix].has_key?(suffix)
	# 				prefixes[prefix][suffix]=prob
	# 			else
	# 				#ccurrences = count_words(prefixes[word], suffix)
	# 			#prob=occurrences/initialwords
	# 			prob=1.0/initialwords
	# 			prefixes[prefix][suffix]=prob 
	# 			end
	# 		end

	# 	else prefixes[prefix]={suffix=>1} 
	# 	end

	# end
	

# binding.pry



