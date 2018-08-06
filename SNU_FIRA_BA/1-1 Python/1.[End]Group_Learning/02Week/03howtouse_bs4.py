import bs4

html_str = """
<html>
    <body>
        <ul>
            <li><hello></li>
            <li><bye></li>
            <li><bye></li>
        </ul>
    </body>
</html>
"""

bs0bj = bs4.BeautifulSoup(html_str,"html.parser")

ul = bs0bj.find("ul")
print(ul)   #ul 태그 달려있는거 찾아라
print("\n")

ul = bs0bj.find("li")
print(ul)  # li 달려있는것만 찾아라. 첫번째 것만 찾음