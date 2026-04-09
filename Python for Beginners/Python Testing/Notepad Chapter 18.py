import sys

class Notepad:
    def __init__(self, author: str, file_name: str) -> None:
        self.author = author
        self.file_name = file_name


    def _show_instructions(self) -> None:
        print(f'Welcome to Notepad!, {self.author}!')
        print('Commands:')
        print('1 - write note')
        print('2 - display note')
        print('0 - exit notepad')

    def _write_note(self) -> None:
        user_input: str = input('Enter a note: ')

        with open(self.file_name, 'w') as note:
            note.write(user_input)

    def _display_note(self) -> None:
        try:
            with open(self.file_name, 'r') as note:
                text: str = note.read()
                print(f'Bot: {text}')

        except FileNotFoundError:
            print(f'Bot: You need to write note first')


    def _exit(self) -> None:
        print(f'See you next time, {self.author}!')



    def run(self) -> None:
        self._show_instructions()
        while True:
            user_input:str = input(f'{self.author} ')

            if user_input not in ('0', '1', '2'):
                print(f'Bot: Please enter a valid option')
                continue

            if user_input == '1':
                self._write_note()
            elif user_input == '2':
                self._display_note()
            elif user_input == '0':
                self._exit()
            else:
                print(f'Bot: Unknown option, {user_input}')



    def main(self) -> None:
        notepad = Notepad(self.author, self.file_name)
        notepad.run()

    if __name__ == '__main__':
        main()
    

