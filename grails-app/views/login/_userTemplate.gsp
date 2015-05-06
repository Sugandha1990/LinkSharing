

<g:each in="${userList}" var="user">
    <article class="tweet" style="height: 100px">
    <g:link controller="user" action="publicProfile" params="[userId: user.id]">
        <div class="userImg">
        <img class="tweetImg" src="${createLink(controller: 'user', action:'displayLogo ', id:user?.id)}"/>
    </div>
        </g:link>
    <div class="userPost" >
        <h2>${user.fullName} @${user.username}</h2>
        <p>Subscriptions           Topics</p>
        ${user.subcriptionCount}               ${user.topics.size()}
    </div>

</article>
    </g:each>