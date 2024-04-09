import wikipedia


def wiki(name="War Goddess", length=1):
    return wikipedia.summary(name, length)
