<%-- 
    Document   : social
    Created on : May 17, 2015, 7:55:00 PM
    Author     : Akhil Bhai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="ISO-8859-1">
        <!--  Fb Script -->
        <script>
            // This is called with the results from from FB.getLoginStatus().
            function statusChangeCallback(response) {
                console.log('statusChangeCallback');
                console.log(response);
                // The response object is returned with a status field that lets the
                // app know the current login status of the person.
                // Full docs on the response object can be found in the documentation
                // for FB.getLoginStatus().
                if (response.status === 'connected') {
                    // Logged into your app and Facebook.
                    testAPI();
                } else if (response.status === 'not_authorized') {
                    // The person is logged into Facebook, but not your app.
                    document.getElementById('status').innerHTML = 'Please log ' +
                            'into this app.';
                } else {
                    // The person is not logged into Facebook, so we're not sure if
                    // they are logged into this app or not.
                    document.getElementById('status').innerHTML = 'Please log ' +
                            'into Facebook.';
                }
            }

            // This function is called when someone finishes with the Login
            // Button.  See the onlogin handler attached to it in the sample
            // code below.
            function checkLoginState() {
                FB.getLoginStatus(function(response) {
                    statusChangeCallback(response);
                });
            }

            window.fbAsyncInit = function() {
                FB.init({
                    appId: '570484859747094',
                    cookie: true, // enable cookies to allow the server to access 
                    // the session
                    xfbml: true, // parse social plugins on this page
                    version: 'v2.2' // use version 2.2
                });

                // Now that we've initialized the JavaScript SDK, we call 
                // FB.getLoginStatus().  This function gets the state of the
                // person visiting this page and can return one of three states to
                // the callback you provide.  They can be:
                //
                // 1. Logged into your app ('connected')
                // 2. Logged into Facebook, but not your app ('not_authorized')
                // 3. Not logged into Facebook and can't tell if they are logged into
                //    your app or not.
                //
                // These three cases are handled in the callback function.

                FB.getLoginStatus(function(response) {
                    statusChangeCallback(response);
                });

            };

            // Load the SDK asynchronously
            (function(d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/en_US/sdk.js";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));

            // Here we run a very simple test of the Graph API after login is
            // successful.  See statusChangeCallback() for when this call is made.
            function testAPI() {
                console.log('Welcome!  Fetching your information.... ');
                FB.api('/me', function(response) {
                    //console.log('resp: '+ String(response));
                    console.log('Successful login for: ' + response.name + ' Email ' + response.email + ' DOB ' + response.dob);
                    document.getElementById('status').innerHTML =
                            'Thanks for logging in, ' + response.name + ' Email  ' + response.email + '\n DOB : ' + response.address;
                });
            }
        </script>
        <!--  Google Plus Login -->
        <script src="https://apis.google.com/js/client:platform.js?onload=startApp" async defer></script>
        <!-- JavaScript specific to this application that is not related to API
           calls -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js" ></script>
        <meta name="google-signin-client_id" content="109011474546-geehqiaie1e2t6e88q7ug4fphq81gngq.apps.googleusercontent.com"></meta>
        <script type="text/javascript">
            var auth2 = {};
            var helper = (function() {
                return {
                    /**
                     * Hides the sign in button and starts the post-authorization operations.
                     *
                     * @param {Object} authResult An Object which contains the access token and
                     *   other authentication information.
                     **/
                    onSignInCallback: function(authResult) {
                        console.log("1");
                        $('#authResult').html('Auth Result:<br/>');
                        for (var field in authResult) {
                            $('#authResult').append(' ' + field + ': ' +
                                    authResult[field] + '<br/>');
                        }
                        if (authResult.isSignedIn.get()) {
                            console.log("2");
                            $('#authOps').show('slow');
                            helper.profile();
                            helper.people();
                        } else if (authResult['error'] ||
                                authResult.currentUser.get().getAuthResponse() == null) {
                            // There was an error, which means the user is not signed in.
                            // As an example, you can handle by writing to the console:
                            console.log('There was an error: ' + authResult['error']);
                            $('#authResult').append('Logged out');
                            $('#authOps').hide('slow');
                            $('#gConnect').show();
                        }
                        console.log('authResult', authResult);
                    },
                    /**
                     * Calls the OAuth2 endpoint to disconnect the app for the user.
                     */
                    disconnect: function() {
                        // Revoke the access token.
                        auth2.disconnect();
                    },
                    /**
                     * Gets and renders the list of people visible to this app.
                     
                     people: function() {
                     gapi.client.plus.people.list({
                     'userId': 'me',
                     'collection': 'visible'
                     }).then(function(res) {
                     var people = res.result;
                     $('#visiblePeople').empty();
                     $('#visiblePeople').append('Number of people visible to this app: ' +
                     people.totalItems + '<br/>');
                     for (var personIndex in people.items) {
                     person = people.items[personIndex];
                     $('#visiblePeople').append('<img src="' + person.image.url + '">');
                     }
                     });
                     },*/
                    /**
                     * Gets and renders the currently signed in user's profile data.
                     */
                    profile: function() {
                        console.log("3");
                        gapi.client.plus.people.get({
                            'userId': 'me'
                        }).then(function(res) {
                            var profile = res.result;
                            //console.log("prifiel"+profile);

                            console.log("dob+" + profile.occupation + "\n gender : " + profile.gender);

                            console.log(profile);
                            $('#profile').empty();
                            $('#profile').append(
                                    $('<p><img src=\"' + profile.image.url + '\"></p>'));
                            $('#profile').append(
                                    $('<p>Hello ' + profile.displayName + '!<br />Tagline: ' +
                                            profile.tagline + '<br />About: ' + profile.aboutMe + '</p>'));
                            if (profile.emails) {
                                $('#profile').append('<br/>Emails: ');
                                for (var i = 0; i < profile.emails.length; i++) {
                                    $('#profile').append(profile.emails[i].value).append(' ');
                                }
                                $('#profile').append('<br/>');
                            }
                            if (profile.cover && profile.coverPhoto) {
                                $('#profile').append(
                                        $('<p><img src=\"' + profile.cover.coverPhoto.url + '\"></p>'));
                            }
                        }, function(err) {
                            var error = err.result;
                            $('#profile').empty();
                            $('#profile').append(error.message);
                        });
                    }
                };
            })();
            /**
             * jQuery initialization
             */
            $(document).ready(function() {
                console.log("5");
                $('#disconnect').click(helper.disconnect);
                $('#loaderror').hide();
                if ($('meta')[0].content == 'YOUR_CLIENT_ID') {
                    alert('This sample requires your OAuth credentials (client ID) ' +
                            'from the Google APIs console:\n' +
                            '    https://code.google.com/apis/console/#:access\n\n' +
                            'Find and replace YOUR_CLIENT_ID with your client ID.'
                            );
                }
            });
            /**
             * Handler for when the sign-in state changes.
             *
             * @param {boolean} isSignedIn The new signed in state.
             */
            var updateSignIn = function() {
                console.log('update sign in state');
                if (auth2.isSignedIn.get()) {
                    console.log('signed in');
                    helper.onSignInCallback(gapi.auth2.getAuthInstance());
                } else {
                    console.log('signed out');
                    helper.onSignInCallback(gapi.auth2.getAuthInstance());
                }
            }
            /**
             * This method sets up the sign-in listener after the client library loads.
             */
            function startApp() {
                gapi.load('auth2', function() {
                    gapi.client.load('plus', 'v1').then(function() {
                        gapi.signin2.render('signin-button', {
                            scope: 'https://www.googleapis.com/auth/plus.login',
                            fetch_basic_profile: false});
                        gapi.auth2.init({fetch_basic_profile: false,
                            scope: 'https://www.googleapis.com/auth/plus.login'}).then(
                                function() {
                                    console.log('init');
                                    auth2 = gapi.auth2.getAuthInstance();
                                    auth2.isSignedIn.listen(updateSignIn);
                                    auth2.then(updateSignIn());
                                });
                    });
                });
            }
        </script>
        <!--  Linkedin Script -->
        <script type="text/javascript" src="//platform.linkedin.com/in.js">
                    api_key:   75c1gnp6d5behs
                    onLoad: getProfileData
                    authorize: true
        </script>
        <script type="text/javascript">
            // Setup an event listener to make an API call once auth is complete
            function onLinkedInLoad() {
                IN.Event.on(IN, "auth", getProfileData);
            }

            // Handle the successful return from the API call
            function ShowProfileData(data) {
                    console.log("linkedin");
                     console.log(data);
//                     var member = data.values[0];
                document.getElementById('indiv').innerHTML =
                            'Thanks for logging to linkedin, ' + data.firstName +" "+data.lastName;
              
            }

            // Handle an error response from the API call
            function onError(error) {
                console.log(error);
            }

            // Use the API call wrapper to request the member's basic profile data
            function getProfileData() {
                IN.API.Raw("/people/~?format=json").result(ShowProfileData).error(onError);
//                IN.API.Profile("me").result(ShowProfileData);
            }
        </script>

    </head>
    <body>
       
        <div id="fb-root"></div>
        <script>(function(d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3";
                fjs.parentNode.insertBefore(js,
                        fjs);
            }(document, 'script', 'facebook-jssdk'));</script>
        <div class="fb-login-button" data-max-rows="0" data-size="large" data-show-faces="false" data-auto-logout-link="true" scope="public_profile,email" onlogin="checkLoginState();"></div>
        <div id="status"></div>
        <br>
        <span id="signinButton">
            <span
                class="g-signin"
                data-callback="onSignInCallback"
                data-clientid="109011474546-geehqiaie1e2t6e88q7ug4fphq81gngq.apps.googleusercontent.com"
                data-cookiepolicy="single_host_origin"
                data-requestvisibleactions="http://schema.org/AddAction"
                data-scope="https://www.googleapis.com/auth/plus.login">
            </span>
        </span>
        <div id="authOps" style="display:none"></div>
        <div id="profile"></div>  
        <br>
        <script type="in/Login"></script>
        <div id="indiv"></div>
    </body>
</html>
