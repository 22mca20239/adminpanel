<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tachyons@4.12.0/css/tachyons.min.css">
    </head>
    <body>
        <div class="mw6 center ba b--black-10 br3 bw2 mt6">
            <form method="post" action="AddCustomer" class="mw6 center pa3">
                <p class="f2 tc underline">Customer Details</p>
                <div class="flex flex-wrap mb3">
                    <div class="w-50 pa2">
                        <label for="first_name" class="db fw6 mb2">First Name:</label>
                        <input type="text" name="first_name" id="first_name" class="pa2 input-reset br3 b--black-20 w-100">
                    </div>
                    <div class="w-50 pa2">
                        <label for="last_name" class="db fw6 mb2">Last Name:</label>
                        <input type="text" name="last_name" id="last_name" class="pa2 input-reset br3 b--black-20 w-100">
                    </div>
                    <div class="w-50 pa2">
                        <label for="street" class="db fw6 mb2">Street:</label>
                        <input type="text" name="street" id="street" class="pa2 input-reset br3 b--black-20 w-100"><br>
                    </div>
                    <div class="w-50 pa2">
                        <label for="address" class="db fw6 mb2">Address:</label>
                        <input type="text" name="address" id="address" class="pa2 input-reset br3 b--black-20 w-100"><br>
                    </div>
                    <div class="w-50 pa2">
                        <label for="city" class="db fw6 mb2">City:</label>
                        <input type="text" name="city" id="city" class="pa2 input-reset br3 b--black-20 w-100 "><br>
                    </div>
                    <div class="w-50 pa2">
                        <label for="state" class="db fw6 mb2">State:</label>
                        <input type="text" name="state" id="state" class="pa2 input-reset br3 b--black-20 w-100"><br>
                    </div>
                    <div class="w-50 pa2">
                        <label for="email" class="db fw6 mb2">Email:</label>
                        <input type="email" name="email" id="email" class="pa2 input-reset br3 b--black-20 w-100">
                    </div>
                    <div class="w-50 pa2">
                        <label for="phone" class="db fw6 mb2">Phone:</label>
                        <input type="tel" name="phone" id="phone" class="pa2 input-reset br3 b--black-20 w-100">
                    </div>
                </div>
                <input type="submit" value="Submit" class="mt3 w-100 br3 pa2 grow bg-blue b--blue white db fw6">
            </form>
        </div>
    </body>
</html>

