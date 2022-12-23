    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

    <div class="offcanvas offcanvas-end" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
      <div class="offcanvas-header">
          <h5 id="offcanvasRightLabel">Create / Add An Account </h5>
          <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>

      <div class="offcanvas-body">

          <div class="card">
            <div class="card-body">

              <form action="/account/create_account" method="POST" class="add-account-form">

                <div class="form-group mb-3">
                  <label for="">Enter Account Name</label>
                  <input type="text" name="account_name" class="form-control" placeholder="Enter Account name:">
                </div>

                <div class="form-group mb-3">
                  <label for="">Select Account Type</label>
                  <select name="account_type" class="form-control" id="">
                    <option value="">-- Select Account --</option>
                    <option value="check">Check</option>
                    <option value="savings">Savings</option>
                    <option value="business">Business</option>
                  </select>
                </div>

                <div class="form-group my-2">
                  <button id="" class="btn btn-md transact-btn">Add Account</button>
                </div>

              </form>
            </div>

          </div>

      </div>
    </div>

    <div class="container d-flex">

      <button id="add-account-btn" class="btn btn-lg shadow" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
        <i class="fas fa-credit-card"></i> Add New Account
      </button>

      <button id="transact-btn" class="btn btn-lg ms-auto shadow" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
        <i class="fas fa-wallet"></i>Transact
      </button>
    </div>