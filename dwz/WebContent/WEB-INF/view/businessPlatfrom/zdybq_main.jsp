<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<style type="text/css">
	td .titleTools{border-color:RGB(234,241,242); background-color:#efefef; padding:10px;height: 40px;border:solid 1px #CCC;}
	td .titleTools1{border-color:RGB(234,241,242); background-color:#efefef; padding:10px;border:solid 1px #CCC;}
	.thwitch{width: 25%; }
</style>
<div class="pageContent">
	<table style="width: 99%;">	
		<tr>
			<th style="width:80%;" >
				<div layoutH="9" style="float: left; display:block; overflow:auto; border:solid 1px #CCC; line-height:21px; background:#fff; width: 100%;">
					<table style="width: 100%">
						<tr>	
							<td>
								<div class="titleTools" defH="40">						
									污染源名称<input type="text" size="20"/>
								<div style="float: right;padding-right: 30px">是否30万瓦<input type="checkbox"/></div>								
								</div>					
							</td>
						</tr>			
						<tr>	
							<td>
								<div class="titleTools1" defH="30">	
									<table>
										<tr height="30px">
											<th align="right" class="thwitch"><label style="margin-right: 20px">行业类别</label></th>
											<th align="left"><input size="10" type="text"/></th>
											<th></th>
											
											<th align="right" class="thwitch">
												<label style="margin-right: 20px">流域</label>
											</th>
											<th>
												<input size="10" type="text"/></th>
											<th></th>
											<th align="right" class="thwitch">
												<label style="margin-right: 20px">关注程度</label>
											</th>
											<th class="thwitch">
												<select name="ty" class="required combox">																
													<option value="0" selected="selected">关注程度1</option>														
												</select>
											</th>
											<th></th>
										</tr>
										<tr height="30px">
											<th align="right"><label style="margin-right: 20px">所属环保机构</label></th>
											<th align="left"><input size="10" type="text"/></th>
											<th></th>
											<th align="right">
												<label style="margin-right: 20px">单位类别</label>
											</th>
											<th>
												<select class="required combox" name="ty">
													<option value="0" selected="selected">单位类别1</option>
												</select>
											</th>
											<th></th>
											<th align="right">
												<label style="margin-right: 20px">注册类型</label>
											</th>
											<th>														
												<select name="ty" class="required combox">
													<option value="0" selected="selected">注册类型1</option>
												</select>
												</th>
											<th></th>
										</tr>
										<tr height="30px">
											<th align="right"><label style="margin-right: 20px">地区代码</label></th>
											<th align="left"><input size="10" type="text"/></th>
											<th></th>
											<th align="right">
												<label style="margin-right: 20px">隶属关系</label>
											</th>
											<th>
												<select name="ty" class="required combox">
													<option value="0" selected="selected">隶属关系1</option>
												</select>
											</th>
											<th></th>
											<th align="right">
												<label style="margin-right: 20px">污染源类别</label>
											</th>
											<th>
												<select name="ty" class="required combox">
													<option value="0" selected="selected">污染源类别1</option>
												</select>
											</th>
											<th></th>
										</tr>																															
									</table>											
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="formBar" defH="30" style="border: solid 1px #ccc;">	
									<ul>	
										<li>
											<div class="button"><div class="buttonContent"><button type="button" class="close">查询</button></div></div>
											<div class="button"><div class="buttonContent"><button type="button" class="close">全部清除</button></div></div>
											<div class="button"><div class="buttonContent"><button type="button" class="close">新建模板</button></div></div>
										</li>
									</ul>																
								</div>					
							</td>
						</tr>
						<tr>
							<th>
								<div class="formBar" style="border: solid 1px #ccc;">
									<ul >
										<li><div class="button"><div class="buttonContent"><button type="button" class="close">保存模板</button></div></div></li>
									</ul>
								</div>
							</th>	
						</tr>
						<tr>
							<th >
								<div layoutH="282">
									<div style="float:right; display:block; overflow:auto; border:solid 1px #CCC; line-height:21px; background:#fff;">
										
										<table style="width: 100%">
											<tr>
												<th width="45%" style="border: solid 1px #ccc;">
													<div class="panelBar" defH="40" style="padding:10 0 0 5px;">
														<span>未关注</span>
													</div>
												</th>
											
												<th width="10%" rowspan="2">
													<div align="center">
														<div style="width: 50%">								
															<div class="buttonActive"><div class="buttonContent">
																<a id="detail" >全部&gt;&gt;</a>
															</div></div>	
														</div><br>
														<div style="width: 50%">
															<div class="buttonActive"><div class="buttonContent">
																<a  id="detail" >&lt;&lt;全部</a>
															</div></div>	
														</div>
													</div>
												</th>	
																											
												<th width="45%" style="border: solid 1px #ccc;">
													<div class="panelBar" defH="40" style="padding:10 0 0 5px;">
														<span>关注企业</span>
													</div>
												</th>
											</tr>
											<tr>
												<th style="border: solid 1px #ccc;">
													<div class="sortDrag" style="margin:5px;float:left;min-height:100px;width: 95%;">
														<div style="border:1px solid #efefef;padding:5px;margin:5px">未关注操作1</div>
														<div style="border:1px solid #efefef;padding:5px;margin:5px">未关注操作2</div>
														<div style="border:1px solid #efefef;padding:5px;margin:5px">未关注操作3</div>
														<div style="border:1px solid #efefef;padding:5px;margin:5px">未关注操作4</div>
														<div style="border:1px solid #efefef;padding:5px;margin:5px">未关注操作5</div>
													</div>
												</th>
											
												<th style="border: solid 1px #ccc;">	
													<div class="sortDrag" style="margin:5px;float:left;min-height:100px;width: 95%;">
														<div style="border:1px solid #efefef;padding:5px;margin:5px">关注操作1</div>
														<div style="border:1px solid #efefef;padding:5px;margin:5px">关注操作2</div>
														<div style="border:1px solid #efefef;padding:5px;margin:5px">关注操作3</div>
														<div style="border:1px solid #efefef;padding:5px;margin:5px">关注操作4</div>
														<div style="border:1px solid #efefef;padding:5px;margin:5px">关注操作5</div>
													</div>								
												</th>
											</tr>
										</table>
									</div>
								</div>
							</th>
						</tr>	
					</table>
				</div>
			</th>	
			<th style="width: 20%;">	
				<div layoutH="9" class="unitBox" style="float:right; display:block; overflow:auto; border:solid 1px #CCC; line-height:21px; background:#fff; width: 100%;">
					<div class="panelBar" defH="40" style="padding:10 0 0 5px;">
						<span>用户定义标签列表</span>
					</div>					
					<table class="list" width="100%" targetType="navTab" asc="asc" desc="desc">
						<thead>
							<tr>
								<td width="60%" align="left">操作</td>
								<td width="40%" align="left">名称简写</td>								
							</tr>
						</thead>
						<tbody>			
							<tr target="sid_user" rel="1">

							</tr>			
						</tbody>
					</table>  
				</div>
			</th>
		</tr>	
	</table>
</div>

