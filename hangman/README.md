Supervisor strategy for the application I chose :rest_for_one
because if the state were to go down, the whole application needs
to be restarted. Chose :transient for my restart because only want to
restart if processes exit abnormally.
