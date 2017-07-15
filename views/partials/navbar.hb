<!--<nav class="topbar">
    <ul>
        <li><a href="/">Home</a></li>
        <li><a href="#">Pizza</a></li>
        <li><a href="#">Deals</a></li>
        <li><a href="#">Re-Order</a></li>
        <li><a href="#">New Order</a></li>
        
        <li><a href="/events">Events</a></li>
    </ul>
</nav>-->

<nav>
    <div class="nav-wrapper orange lighten-1">
        <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
        <ul id="nav-mobile" class="left hide-on-med-and-down">
            <li><a href="/">Pizza</a></li>
            <li><a href="/deals">Deals</a></li>
            <li><a href="/re-order">Re-Order</a></li>
            <li><a href="/new-order">New Order</a></li>
        </ul>
        <ul class="nav-mobile right hide-on-med-and-down">
            <li><a href="login">Login</a></li>
            <li><a href="signup">SignUp</a></li>
        </ul>
         <ul class="side-nav red darken-2 center-align" id="mobile-demo">
            <li class="white-text center-align">Menu</li>
            <div class="divider"></div>
            <li><a class="white-text" href="login">Login</a></li>
            <li><a class="white-text" href="/">Pizza</a></li>
            <li><a class="white-text" href="/deals">Deals</a></li>
            <li><a class="white-text" href="/re-order">Re-Order</a></li>
            <li><a class="white-text" href="/new-order">New Order</a></li>
            <li><a class="white-text" href="signup">SignUp</a></li>
        </ul>
    </div>
</nav>

<script>
      $(".button-collapse").sideNav();
</script>