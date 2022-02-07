<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<header>
		<form method="get" action="/jspTemplete/test02/test02mainInfo.jsp">
			<div class="d-flex mt-3">
				<div class="col-2 d-flex justify-content-start align-items-end">
					<h1 class="text-success">Melong</h1>
				</div>
				<div class="input-group col-10 d-flex justify-content-start align-items-end">
					<div class="col-5 d-flex">
						<input type="text" class="form-control" name="titletest">
						<div class="input-group-append">
							<button class="btn btn-success" type="submit">검색</button>		
						</div>
					</div>
				</div>
			</div>
		</form>
	</header>