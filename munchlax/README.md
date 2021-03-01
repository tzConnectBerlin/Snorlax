# Munchlax - a leaner, prettier, but less efficient approach

(In case you don't know your Pokemon too well, Munchlax is the juvenile form of Snorlax. Now you know.)

So the difference here is that we're cutting the whole "lazy lambdas calling other lazy lambdas" concept out like the overengineered monstrosity it truly is. This might be a good thing in some cases, and less good in others. It's all about what you're optimizing for. With this approach, a single lambda will probably be larger, and you will almost certainly have code dupliction across your entry points... but for this prize, you get far cleaner readability of each endpoint.

Also, you might not have wanted to refactor your code to make use of lazy calling internally anyway, in which case this framework is the right one to use. Having a capability in the contract that you aren't making use of is a liability.

I'd say this approach is prettier, cleaner, more readable, more easily auditable... while the original one is going to be more storage-efficient in real-world scenarios.