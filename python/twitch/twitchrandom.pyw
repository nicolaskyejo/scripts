"""Opens a random stream from top 100 streams in a random top 100 category"""


import random
import webbrowser
from twitch import TwitchHelix  # https://github.com/tsifrer/python-twitch-client


client_id = ''  # How to get a client-id --> https://dev.twitch.tv/docs/v5


client = TwitchHelix(client_id=client_id)
top_games_iterator = client.get_top_games(page_size=100)
random_game = random.choice(top_games_iterator)
game_id = random_game.get('id')

streams_iterator = client.get_streams(page_size=100, game_ids=[game_id])
random_stream = random.choice(streams_iterator)
username = random_stream.get('user_name')
webbrowser.open('https://www.twitch.tv/' + username)
