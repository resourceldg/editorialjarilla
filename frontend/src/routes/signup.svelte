<script>
	
    import { goto, stores } from "@sapper/app";
    const { session } = stores();
  
    let password = "";
    let confirm_pass = "";
    let username = ""; 
    let email = "";
    let phone="";
    let error;
  
    const handleSignup = async () => {
      
      if (password === confirm_pass){
        const response = await fetch("/signup", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            Accept: "application/json",
          },
          body: JSON.stringify({ username, email, password}),
        });
    
        const parsed = await response.json();
    
        if (parsed.error) {
          error = parsed.error;
        } else {
          $session.token = parsed.token;
          $session.user= parsed.user.username;
          goto("/profile");
        }

      }else{
        placeholderpass="password confirm not match",
        placeholderpassconfirm="please retry passwords"

      }
    };
    

    
  </script>
  
    
    <form on:submit|preventDefault="{handleSignup}" method="post">
      <div class="container  mx-auto flex flex-wrap items-center justify-center">
        <div class="shadow-2xl lg:w-2/6 md:w-1/2 bg-gray-100 rounded-lg p-8 flex flex-col md:w-1/2 w-full mt-10 md:mt-0 ">
          <h2 class="text-gray-900 text-lg font-medium title-font mb-5">Registrarse </h2>
          <div class="relative mb-4">
          <label  for="name" class="leading-7 text-sm text-gray-600">
            Nombre:
            <input id="name" type="username" placeholder= "Nombre" bind:value="{username}" class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out" />
          </label>
          <label  for="email" class="leading-7 text-sm text-gray-600">
            Email:
            <input id="email" type="email" placeholder="Email" bind:value="{email}" class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out" />
          </label>

          <label for="pass" class="leading-7 text-sm text-gray-600">
            Contraseña:
            <input id= "pass" name= "password" type="password" placeholder= "Contraseña" bind:value="{password}" class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"/>
          </label>

          <label  for="confirm_pass" class="leading-7 text-sm text-gray-600">
            Confirme Contraseña:
            <input id= "confirm_pass" name="confirm_pass" type="password" placeholder="Confirme contraseña" bind:value="{confirm_pass}" class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out" />  
          </label> 
          <label for="confirm_pass" class="leading-7 text-sm text-gray-600">
          Teléfono:
          <input type="phone" placeholder="Teléfono" bind:value={phone} class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"/>
          </label>
        </div>
       <a href="thanks"><button class="text-white bg-red-500 border-0 py-2 px-8 focus:outline-none hover:bg-red-600 rounded text-lg" type="submit" onclick=submit > Registrarse</button></a>
        </div>
    </div>
    </form>
    
    
    {#if error}
    <p>{error}</p>
    {/if}