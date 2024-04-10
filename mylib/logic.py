from textblob import TextBlob
import wikipedia


def wiki(name="War Goddess", length=1):
    return wikipedia.summary(name, length)


def search_wiki(name):
    return wikipedia.search(name)


def phrase(name):
    """Return phrases from wikipedia"""
    page = wiki(name)
    blob = TextBlob(page)
    return blob.noun_phrases
