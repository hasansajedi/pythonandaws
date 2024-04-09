from mylib.logic import wiki, search_wiki


def test_wiki():
    assert "god" in wiki()


def test_wiki_search():
    assert "National Basketball Association" in search_wiki("NBA")
