<script>
    import { goto, stores } from '@sapper/app';
    const { session } = stores();

    let password = '';
    let email = '';
    let error;

    const handleLogin = async () => {
        const response = await fetch('/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                Accept: 'application/json',
            },
            body: JSON.stringify({ email, password }),
        });

        const parsed = await response.json();

        if (parsed.error) {
            error = parsed.error;
        } else {
            $session.token = parsed.token;
            $session.user = parsed.user;
            

            goto('/profile');
       } 
    };
    
</script>


<form on:submit|preventDefault={handleLogin} method="post">
    <div class="container  mx-auto flex flex-wrap items-center justify-center">
    <div class="shadow-2xl lg:w-2/6 md:w-1/2 bg-gray-100 rounded-lg p-8 flex flex-col md:w-1/2 w-full mt-10 md:mt-0 ">
        <h2 class="text-gray-900 text-lg font-medium title-font mb-5">Ingresar</h2>
        
        <div class="relative mb-4">
          <label for="email" class="leading-7 text-sm text-gray-600">Email</label>
          <input type="email" id="email" name="email" bind:value={email} class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out">
          <label for="password" class="leading-7 text-sm text-gray-600">Contraseña</label>
          <input type="password" id="email" name="password" bind:value={password} class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"/>
        </div>
        <button class="text-white bg-red-500 border-0 py-2 px-8 focus:outline-none hover:bg-red-600 rounded text-lg" type="submit" onclick=submit >Login</button>
        <p class="font-bold text-red-500">Si aún no estás registrado, haz click <span><a class="underline" href='signup'> Aquí</a></span> </p>
      </div>
    </div>
</form>

{#if error}
    <p>{error}</p>
{/if}

