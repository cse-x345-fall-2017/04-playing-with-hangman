
Please write a couple of sentences explaining your choice of restart
strategy.

The reasoning behind my choice of the restart strategy being ":transient" is due to the fact that if the Dictionary's dependencies want to close normally, the Dictionary should do the same. However, in the case of an irregular shutdown, the Dictionary should be restarted to be ready to be used again.
