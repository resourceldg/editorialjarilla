<script>
    import { goto, stores } from '@sapper/app';

    const { page, session } = stores();
</script>

<nav>
    <ul>
        <li><a class:active="{$page.path === '/'}"  href="/">Inicio</a></li>

        {#if $session.token}
            <li><a class:active="{$page.path === '/profile'}"  href="profile">Perfil</a></li>
        {:else}   
            <li><a class:active="{$page.path === '/about'}" href="about">Nosotros</a></li>
            <li><a class:active="{$page.path === '/collections'}" href="collections">Colecciones</a></li>
            <li><a class:active="{$page.path === '/magazine'}" href="magazine">Revista</a></li>
            <li><a class:active="{$page.path === '/contact'}" href="contact">Contacto</a></li>
            <li><a class:active="{$page.path === '/login'}" href="login">Ingresar</a></li>
            <li><a class:active="{$page.path === '/images'}" href="images">Imágenes</a></li>
            <!--<li><a class:active="{$page.path === '/login'}" href="login">login</a></li>
            <li><a class:active="{$page.path === '/signup'}" href="signup">register</a></li> -->
        
        {/if}
    </ul>
</nav>

<style>
    nav {
        border-bottom: 1px solid rgba(21, 10, 34, 0.1);
        font-weight: 400;
        padding: 0 1em;
    }

    ul {
        margin: 0;
        padding: 0;
    }

    /* clearfix */
    ul::after {
        content: '';
        display: block;
        clear: both;
    }

    li {
        display: block;
        float: left;
    }

    a {
        text-decoration: none;
        padding: 1em 0.5em;
        display: block;
    }

  
</style>
