var tree = "<h2>Document tree render</h2>";

function treeRender() {
    var treeDiv = document.getElementById("treeRender");
    treeDiv.innerHTML = buildTree();

}


function buildTree() {
    this.tree += "<ul>"
    var allElements = document.getElementsByTagName('*');
    recursive(allElements[0], this.tree);
    this.tree += "</ul>";
    return tree;

}


function recursive(htmlElement, tree) {
    if (htmlElement.hasChildNodes && htmlElement.children.length > 0) {
        if (htmlElement.localName == 'html') {
            this.tree += '<li class="root" >' + htmlElement.localName + "</li>";
        } else {
            this.tree += '<li class="hasChild">' + htmlElement.localName + "</li>";
        }
        this.tree += "<ul>";
        for (var i = 0; i < htmlElement.children.length; i++) {
            recursive(htmlElement.children[i], this.tree);
        }
        this.tree += "</ul>";
    } else {
        this.tree += '<li class="child" >' + htmlElement.localName + "</li>";
        console.log("No ChildNODE element: ", htmlElement.localName)
    }

}


treeRender();