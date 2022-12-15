#!/usr/bin/python3

s = "#!/usr/bin/python3{1}{1}s = {2}{0}{2}{1}{1}# Global Scope Comment{1}if __name__ == {2}__main__{2}:{1}    # Main Scope Comment{1}    print(s.format(s, chr(10), chr(34)))"

# Global Scope Comment
if __name__ == "__main__":
    # Main Scope Comment
    print(s.format(s, chr(10), chr(34)))
