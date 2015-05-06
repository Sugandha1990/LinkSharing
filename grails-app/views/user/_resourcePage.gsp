<div class="list">

    <g:each in="${data.inbox}" status="i" var="resource">
        <article class="tweet">

            <div class="userImg">
                <g:link controller="user" action="publicProfile" params="[userId:resource.createdBy.id]"><img src="${createLink(controller: 'user', action:'displayLogo ', id:resource.createdBy?.id)}"/></g:link>
            </div>

            <div  class="userPost">
                <h2>${resource.id}</h2>
                <h2>${resource.createdBy.fullName} @${resource.createdBy.username}</h2>
                <p>${resource.description}</p>

            </div>

        </article>
    </g:each>

</div>
<div class="paginateButtons">
    <util:remotePaginate total="100" update="repoList" action="dashboardResource" />
</div>
</div>