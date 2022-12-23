    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

    <div class="container d-flex py-3">
      <h2 class="me-auto">Total Accounts Balance:</h2>
      <h2 class="ms-auto">
            <c:if test="${requestScope.totalBalance != null}">
                  <c:out value="${totalBalance}"/>
            </c:if>
      </h2>
    </div>

    <div class="container">
        <!-- Accordion Menu / Drop Down -->
                <c:if test="${requestScope.userAccounts != null }">

                 <c:forEach items="${requestScope.userAccounts}" var="account">

                <div class="accordion accordion-flush" id="accordionFlushExample">
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="flush-headingOne">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-${account.account_id}" aria-expanded="false" aria-controls="flush-collapseOne">
                          ${account.account_name}
                        </button>
                      </h2>
                      <div id="flush-${account.account_id}" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">
                            <!-- Account Details List -->
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item d-flex">Account Name <span class="ms-auto"><b>${account.account_name}</b></span></li>
                                <li class="list-group-item d-flex">Account Number <span class="ms-auto"><b>${account.account_number}</b></span></li>
                                <li class="list-group-item d-flex">Account Type <span class="ms-auto"><b>${account.account_type}</b></span></li>
                                <li class="list-group-item d-flex">Account Balance <span class="ms-auto"><b>${account.balance}</b></span></li>

                            </ul>
                            <!-- Account Details List -->
                        </div>
                      </div>
                    </div>
                  </div>
                 </c:forEach>

                </c:if>
                <!-- End Of Accordion Menu / Drop Down -->
    </div>
