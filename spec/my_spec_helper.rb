require_relative '../index.rb'

LIST = [
		[
			Person.new(0, "Michelle", "Michelle0@bar.com"), 
			Person.new(1, "Michael", "Michael1@bar.com"), 
			9
		],
		[
			Person.new(0, "Michelle", "Michelle0@bar.com"), 
			Person.new(2, "Donald", "Donald2@bar.com"), 
			8
		],
		[
			Person.new(0, "Michelle", "Michelle0@bar.com"), 
			Person.new(3, "Xin", "Xin3@bar.com"), 
			9
		],
		[
			Person.new(0, "Michelle", "Michelle0@bar.com"), 
			Person.new(4, "Dan", "Dan4@bar.com"), 
			6
		],
		[
			Person.new(1, "Michael", "Michael1@bar.com"), 
			Person.new(2, "Donald", "Donald2@bar.com"), 
			6
		],
		[
			Person.new(1, "Michael", "Michael1@bar.com"), 
			Person.new(3, "Xin", "Xin3@bar.com"), 
			1
		],
		[
			Person.new(1, "Michael", "Michael1@bar.com"), 
			Person.new(4, "Dan", "Dan4@bar.com"), 
			3
		],
		[
			Person.new(2, "Donald", "Donald2@bar.com"), 
			Person.new(3, "Xin", "Xin3@bar.com"), 
			5
		],
		[
			Person.new(2, "Donald", "Donald2@bar.com"), 
			Person.new(4, "Dan", "Dan4@bar.com"), 
			1
		],
		[
			Person.new(3, "Xin", "Xin3@bar.com"), 
			Person.new(4, "Dan", "Dan4@bar.com"),
			6
		]
]