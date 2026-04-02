import sys
from datetime import datetime

def get_response(text: str) -> str:
    lowered: str = text.lower()

    if lowered in ['hello', 'hi', 'hey']:
        return "Hello there!"
    elif 'how are you' in lowered:
        return "I'm good thanks"
    elif 'your name' in lowered:
        return "My name is: Bot :)"
    elif 'time' in lowered:
        current_time: datetime = datetime.now()
        return f'The time is: {current_time:%H%M}'
    elif lowered in ['bye', 'see you', 'goodbye']:
        return "it was nice talking to you, Bye"
    else:
        return f'Sorry i do not understand: "{text}"'

