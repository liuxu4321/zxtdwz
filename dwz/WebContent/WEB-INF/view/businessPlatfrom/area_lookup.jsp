<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<div class="pageContent">
	<div class="pageFormContent" layoutH="58">
		<ul class="tree treeFolder collapse">
			<c:forEach var="lv1" items="${areaLevelMap['1'] }">
				<!-- 省 -->
				<c:forEach var="fa1" items="${lv1.value }">
					<li><%-- <a href="javascript:" onclick="$.bringBack({subId:'${areaDetailMap[fa1]['SUB_ID'] }', subName:'${areaDetailMap[fa1]['SUB_NAME'] }'})">${areaDetailMap[fa1]['SUB_NAME'] }</a> --%>
						  <a href="javascript:">${areaDetailMap[fa1]['SUB_NAME'] }</a>
						<!-- 市 -->
						<c:if test="${hasChildMap[fa1] }">
							<ul>
								<c:forEach var="fa2" items="${areaLevelMap['2'][fa1] }">
									<li><a href="javascript:" onclick="$.bringBack({subId:'${areaDetailMap[fa2]['SUB_ID'] }', subName:'${areaDetailMap[fa2]['SUB_NAME'] }'})">${areaDetailMap[fa2]['SUB_NAME'] }</a>
										<!-- 区 -->
										<%-- <c:if test="${hasChildMap[fa2] }">
											<ul>
												<c:forEach var="fa3" items="${areaLevelMap['3'][fa2] }">
													<li><a href="javascript:"  onclick="$.bringBack({subId:'${areaDetailMap[fa3]['SUB_ID'] }', subName:'${areaDetailMap[fa3]['SUB_NAME'] }'})">${areaDetailMap[fa3]['SUB_NAME'] }</a></li>
												</c:forEach>
											</ul>
										</c:if> --%>
									</li>
								</c:forEach>
							</ul>
						</c:if>
					</li>
				</c:forEach>
			</c:forEach>
		</ul>
	</div>
	
	<div class="formBar">
		<ul>
			<li><div class="button"><div class="buttonContent"><button class="close" type="button">关闭</button></div></div></li>
		</ul>
	</div>
</div>