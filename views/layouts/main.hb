<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title></title>
        {{headerLink}}
    </head>
    <body>
        <header>

            {{mid}}
            {{> navbar}}
        </header>
        <main>
            {{{body}}}
            {{getScript "main"}}
        </main>
        <footer>
            {{> footer}}
        </footer>


    </body>
</html>
