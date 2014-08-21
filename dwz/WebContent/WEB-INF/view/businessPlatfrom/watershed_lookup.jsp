<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<div class="pageContent">
	<div class="pageFormContent" layoutH="58">
		<ul class="tree expand">
			<c:forEach var="lv1" items="${watershedLevelMap['1'] }">
				<c:forEach var="fa1" items="${lv1.value }">
					<%-- <c:choose>
						<c:when test="${hasChildMap[fa1] }"> --%>
							<li><a href="javascript:" onclick="$.bringBack({watershedId:'${watershedDetailMap[fa1]['SUB_ID'] }', watershedName:'${watershedDetailMap[fa1]['SUB_NAME'] }'})">${watershedDetailMap[fa1]['SUB_NAME'] }</a>
								<ul>
									<c:forEach var="fa2" items="${watershedLevelMap['2'][fa1] }">
											<%-- <c:choose>
												<c:when test="${hasChildMap[fa2] }"> --%>
													<li><a href="javascript:" onclick="$.bringBack({watershedId:'${watershedDetailMap[fa2]['SUB_ID'] }', watershedName:'${watershedDetailMap[fa2]['SUB_NAME'] }'})">${watershedDetailMap[fa2]['SUB_NAME'] }</a>
														<ul>
															<c:forEach var="fa3" items="${watershedLevelMap['3'][fa2] }">
																	<%-- <c:choose>
																		<c:when test="${hasChildMap[fa3] }"> --%>
																			<li><a href="javascript:"  onclick="$.bringBack({watershedId:'${watershedDetailMap[fa3]['SUB_ID'] }', watershedName:'${watershedDetailMap[fa3]['SUB_NAME'] }'})">${watershedDetailMap[fa3]['SUB_NAME'] }</a>
																				<ul>
																					<c:forEach var="fa4" items="${watershedLevelMap['4'][fa3] }">
																						<li><a href="javascript:"  onclick="$.bringBack({watershedId:'${watershedDetailMap[fa4]['SUB_ID'] }', watershedName:'${watershedDetailMap[fa4]['SUB_NAME'] }'})">${watershedDetailMap[fa4]['SUB_NAME'] }</a></li>
																					</c:forEach>
																				</ul>
																			</li>
																		<%-- </c:when>
																		<c:otherwise>
																			<li><a href="javascript:" onclick="$.bringBack({subId:'${industryDetailMap[fa3]['SUB_ID'] }', subName:'${industryDetailMap[fa3]['SUB_NAME'] }'})">${industryDetailMap[fa3]['SUB_NAME'] }</a></li>
																		</c:otherwise>
																	</c:choose> --%>
															</c:forEach>
														</ul>
													</li>
												<%-- </c:when>
												<c:otherwise>
													<li><a href="javascript:" onclick="$.bringBack({subId:'${areaDetailMap[fa2]['SUB_ID'] }', subName:'${areaDetailMap[fa2]['SUB_NAME'] }'})">${areaDetailMap[fa2]['SUB_NAME'] }</a></li>
												</c:otherwise>
											</c:choose> --%>
									</c:forEach>
								</ul>
							</li>
						<%-- </c:when>
						<c:otherwise>
							<li><a href="javascript:" onclick="$.bringBack({subId:'${areaDetailMap[fa1]['SUB_ID'] }', subName:'${areaDetailMap[fa1]['SUB_NAME'] }'})">${areaDetailMap[fa1]['SUB_NAME'] }</a></li>
						</c:otherwise>
					</c:choose> --%>
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