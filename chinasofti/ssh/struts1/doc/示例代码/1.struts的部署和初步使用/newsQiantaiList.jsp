<%@ page language="java"
	import="java.util.*,com.eccapf.zgbpro.help.ManagerServers,com.eccapf.zgbpro.vo.JiHuaGuanLiVO,com.eccapf.zgbpro.components.clguanli.*"
	pageEncoding="gb2312"%>
	<%@ page import="com.seavision.PermissionManage.components.*"%>
<%@ page import="com.seavision.PermissionManage.vo.DepartmentVO"%>
<%@ page
	import="com.eccapf.zgbpro.common.Constants,com.eccapf.zgbpro.components.news.Catalog,com.eccapf.zgbpro.components.news.News"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic"
	prefix="logic"%>
	<% int zuoleixin=9;
	int zuonews=16;
	int youleixin=9;
	int younews=16;
	int zhongleixinx=7;
	int zhongnewsx=16;
	int zhongleixind=16;
	int zhongnewsd=36;
	int zhongxinwen=36;		
	 %>
	<%!public String checkzif(int length,String string){
	String title=string; 
	if (string.length() > length){
								title = string.substring(0, length)
										+ "..";
							} 
	return title;	
	}
	%>
	
<%
	DepartmentManage depManage = new DepartmentManageImpl();
	DepartmentVO departmentVO = new DepartmentVO();
	departmentVO = depManage.getDepartmentVO(com.eccapf.zgbpro.common.Constants.QIANTAI_ZHIGONGBU); 
int departmentId = departmentVO.getDepartmentId();//ֱ����
	int left = Constants.NEWS_LEFT;
	int center = Constants.NEWS_CENTER;
	int right = Constants.NEWS_RIGHT;
	int xinwen = Constants.NEWS_XINWEN;
	int guizhang = Constants.NEWS_GUIZHANG;
	int gonggao = Constants.NEWS_GONGGAO;
	int getall = Constants.NEWS_ALL;
	int newsnum = Constants.NEWS_NUMBER;
	int typenum = Constants.NEWS_NUM;
	int typejihua=Constants.NEWS_NUM;
	int centernum = 5;
	int xianshi = Constants.NEWS_XIANSHI;
	int fabu = Constants.NEWS_SHOWLEIXING;	
	List newTypeLeftList = null;//�����������б�
	List newTypeCenterList = null;//�����������б�
	List newTypeRightList = null;//�����������б�
	List guizhangTypeLeftList = null;//�����������б�
	List guizhangTypeCenterList = null;//�����������б�
	List guizhangTypeRightList = null;//�����������б�	
	List gonggaolist = null;//�����б�
	List newslist = null;//�����б�
	List jihualist = null;//�ƻ��б�
	newTypeLeftList = ManagerServers.getInstance().getNewsManage()
			.getPaixuType(departmentId, xinwen, left);
	newTypeCenterList = ManagerServers.getInstance().getNewsManage()
			.getPaixuType(departmentId, xinwen, center);
	newTypeRightList = ManagerServers.getInstance().getNewsManage()
			.getPaixuType(departmentId, xinwen, right);
	guizhangTypeLeftList = ManagerServers.getInstance().getNewsManage()
			.getPaixuType(departmentId, guizhang, left);
	guizhangTypeCenterList = ManagerServers.getInstance()
			.getNewsManage().getPaixuType(departmentId, guizhang,
			center);
	guizhangTypeRightList = ManagerServers.getInstance()
			.getNewsManage()
			.getPaixuType(departmentId, guizhang, right);
	gonggaolist = ManagerServers.getInstance().getNewsManage()
			.getNewsByLeixing(getall, typenum, gonggao, departmentId);
	newslist = ManagerServers.getInstance().getNewsManage()
			.getPictureNews(newsnum, xinwen, departmentId);
	jihualist=ManagerServers.getInstance().getJiHuaGuanLiManage().getJiHuaGuanLiVOListForState (departmentId,Constants.JHSJ_FaBu);
%>
<%//==========================================================================
//���㳵����̬��Ϣ  out�� ���� ִ�� ���� ս���� ����� 

float cheLiangSum = 0;  
float daiMing = 0;    //����
float zhiQin = 0;    //ִ��
float fengCun = 0;   //���
float baoYang = 0;   //����
float daiXiu = 0;   //����
float zaiXiu = 0;   //����
float daiBaofei = 0;   //������
float zhanBei = 0;   //ս��

String qiTa_v = "";    //����
String zhiQin_v = "";    //ִ�� 
String zhanBei_v = "";   //ս����  
String wanHao_v = "";    //�����
String daiMing_v = "";    //������
List list = new ArrayList();

CheliangManage clManage = new CheliangManageImpl();

list = clManage.countClzhuangtai(0);
LinkedHashMap map = (LinkedHashMap)list.get(0);

cheLiangSum = Float.parseFloat(map.get("��������").toString());

daiMing = Float.parseFloat(map.get("����").toString());
zhiQin = Float.parseFloat(map.get("ִ��").toString());
fengCun = Float.parseFloat(map.get("���").toString());



baoYang = Float.parseFloat(map.get("����").toString());
daiXiu = Float.parseFloat(map.get("����").toString());
zaiXiu = Float.parseFloat(map.get("����").toString());
daiBaofei = Float.parseFloat(map.get("������").toString());
zhanBei = Float.parseFloat(map.get("ս��").toString());
//-----------------------
if(cheLiangSum == 0){

	zhanBei_v = "0";	//ս����
	wanHao_v = "0";        //�����(����-������-����-����)
	daiMing_v = "0";    //������
	qiTa_v = "0";       //����
	zhiQin_v = "0";          //ִ��

}else {

	zhanBei_v = Constants.floatToStr(zhanBei,cheLiangSum);	//ս����
	wanHao_v = Constants.floatToStr((cheLiangSum - daiBaofei - zaiXiu - daiXiu),cheLiangSum);        //�����(����-������-����-����)
	daiMing_v = Constants.floatToStr(daiMing,cheLiangSum);    //������
	qiTa_v = Constants.floatToStr((fengCun + baoYang + daiXiu + zaiXiu + daiBaofei),cheLiangSum);       //����
	zhiQin_v = Constants.floatToStr(zhiQin,cheLiangSum);          //ִ��
	
	
}
//==================�����ʻԱ��̬��Ϣ  out�� ���� ���� Ԥ���� ���� ��λ��

List listDriver = new ArrayList();
JiashiyuanManage jsy = new JiashiyuanManageImpl();

listDriver = jsy.countJsyZaiweiAll();
LinkedHashMap lmp = (LinkedHashMap)listDriver.get(0);

float jsyCount = Float.parseFloat(lmp.get("jsyCount").toString());	//��ʻԱ���� ����
//System.out.println("------��ʻԱ����---" + jsyCount);
float jsyChuche = Float.parseFloat(lmp.get("jsyChuche").toString());		// ��������
float jsyYuchuche = Float.parseFloat(lmp.get("jsyYuchuche").toString());	//Ԥ��������
float jsyDaiming = Float.parseFloat(lmp.get("jsyDaiming").toString());		//��������
float jsyQueqin = Float.parseFloat(lmp.get("jsyQueqin").toString());		//ȱ������
String daiMingD_v = "";    //������
String chuCheD_v = "";    //������ 
String yuChuCheD_v = "";   //Ԥ������  
String qiTaD_v = "";    //������
String zaiWeiD_v = "";    //��λ��
if(jsyCount == 0){
	daiMingD_v = "0";    //������
	chuCheD_v = "0";    //������ 
	yuChuCheD_v = "0";   //Ԥ������  
	qiTaD_v = "0";    //������
	zaiWeiD_v = "0";    //��λ��
}else{
	daiMingD_v = Constants.floatToStr(jsyDaiming,jsyCount);    //������
	chuCheD_v = Constants.floatToStr(jsyChuche,jsyCount);    //������ 
	yuChuCheD_v = Constants.floatToStr(jsyYuchuche,jsyCount);   //Ԥ������  
	qiTaD_v = Constants.floatToStr(jsyQueqin,jsyCount);    //������
	zaiWeiD_v = Constants.floatToStr((jsyCount - jsyQueqin),jsyCount);    //��λ��

}

%>
<html>
	<head>
		<title>�侯�ۺ���Ϣ��</title>
		<style type="text/css">
#biaoti1 {
   position:relative;
    
}
#altlayer {
   position:absolute;
   top:1;
   left:1;
  
}</style>
		<link href="../../resources/css/xxcss.css" rel="stylesheet"
			type="text/css" />
		<script language="JavaScript" src="../../resources/javascript/news.js"
			type="text/javascript"></script>
	</head>
	<body onload="quickalt();changepictu();">
		<jsp:include flush="true" page="newsTop.jsp"></jsp:include>
		<!-- ҳ����Ҫ��Ϣչʾ�� -->
		<div id="center">
			<div id="layout">
				<!-- ҳ������Ŀ�� -->
				<div id="left">
					<!-- ҳ���󲿷�������Ŀ�� -->
					<%
						List newTypeChildLeftList = null;
						if (newTypeLeftList != null) {
							String moreurl = "";
							for (int a = 0; a < newTypeLeftList.size(); a++) {
								Catalog catalogp = (Catalog) newTypeLeftList.get(a);
								if (catalogp.getParentId() == 0) {
							newTypeChildLeftList = ManagerServers.getInstance()
									.getNewsManage().getShowLeixing(departmentId,
									xinwen, catalogp.getCatalogId(),
									getall, typenum, fabu);
							moreurl = "newsXiaoType.jsp?type=" + xinwen
									+ "&&catalogId=" + catalogp.getCatalogId();
								} else {
							newTypeChildLeftList = ManagerServers.getInstance()
									.getNewsManage().getNewsByLeixing(
									catalogp.getCatalogId(), typenum,
									xinwen, departmentId);
									moreurl = "newsLieBiao.jsp?type=" + xinwen
									+ "&&catalogId=" + catalogp.getCatalogId();
								}
								if (newTypeChildLeftList != null
								&& newTypeChildLeftList.size() != 0) {
					%>



					<div class="lbox">
						<!-- ҳ���󲿷�������Ŀ���� -->
						<%
								String typeName = "";
								if (catalogp.getSorh() == xianshi) {
									typeName = catalogp.getName();
								}
								if (catalogp.getFilepath().equals("")) {
						%>
						<div class="title"
							style="background:url(../../resources/images/left_span1bg.gif) no-repeat left top;">
							<%=checkzif(zuoleixin,typeName)%>
						</div>
						<%
						} else {
						%>
						<div id="biaoti1">
							<IMG height="auto"
								src="../../../zgbpro/jsp/newsqiantai/<%=catalogp.getFilepath()%>"
								id="image" onload="javascript:resizepic(this);"
								alt="<%=checkzif(zuoleixin,typeName)%>" />
							<div style="visibility:hidden" id="altlayer" class="title"
								width="167px" height="22px"></div>

						</div>
						<%
						}
						%>
						<!-- ҳ���󲿷�������Ŀ������� -->
						<!-- ҳ���󲿷�������Ŀ���� -->
						<div class="neirong">
							<ul>
								<%
											for (int b = 0; b < newTypeChildLeftList.size(); b++) {
											String name = "";
											String url = "";
											if (catalogp.getParentId() == 0) {
												Catalog catalogc = (Catalog) newTypeChildLeftList
												.get(b);
												name = catalogc.getDescription();
												url = "newsLieBiao.jsp?type=" + xinwen
												+ "&&catalogId="
												+ catalogc.getCatalogId();
											} else {
												News news = (News) newTypeChildLeftList.get(b);
												name = news.getSubject();
												url = "newsShow.jsp?type=" + xinwen
												+ "&&newsId=" + news.getNewsId();
											}
								%>
								<li>
									<a href="<%=url%>"><%=checkzif(zuonews,name)%></a>
								</li>
								<%
										}

										if (newTypeChildLeftList.size() + 1 > typenum) {
								%>
								<li>
									<a href="<%=moreurl%>">����...</a>
								</li>
								<%
								}
								%>
							</ul>
						</div>
						<!-- ҳ���󲿷�������Ŀ���ݽ��� -->
					</div>
					<!-- ҳ���󲿷�������Ŀ������ -->
					<%
							}
							}
						}
					%>
					<!-- ҳ���󲿷ֹ�����Ŀ�� -->
					<%
						List guizhangTypeChildLeftList = null;
						if (guizhangTypeLeftList != null) {
							for (int a = 0; a < guizhangTypeLeftList.size(); a++) {
								Catalog catalogp = (Catalog) guizhangTypeLeftList.get(a);
								String moreurl="";
								if (catalogp.getParentId() == 0) {
							guizhangTypeChildLeftList = ManagerServers
									.getInstance().getNewsManage().getShowLeixing(
									departmentId, guizhang,
									catalogp.getCatalogId(), getall,
									typenum, fabu);
									moreurl = "newsXiaoType.jsp?type=" + guizhang
									+ "&&catalogId=" + catalogp.getCatalogId();
								} else {
							guizhangTypeChildLeftList = ManagerServers
									.getInstance().getNewsManage()
									.getNewsByLeixing(catalogp.getCatalogId(),
									typenum, guizhang, departmentId);
									moreurl = "newsLieBiao.jsp?type=" + guizhang
									+ "&&catalogId=" + catalogp.getCatalogId();
								}
								if (guizhangTypeChildLeftList != null
								&& guizhangTypeChildLeftList.size() != 0) {
					%>
					<div class="lbox">
						<!-- ҳ���󲿷ֹ�����Ŀ���� -->
						<%
								String typeName = "";
								if (catalogp.getSorh() == xianshi) {
									typeName = catalogp.getName();
								}
								if (catalogp.getFilepath().equals("")) {
						%>
						<div class="title"
							style="background:url(../../resources/images/left_span1bg.gif) no-repeat left top;">
							<%=checkzif(zuoleixin,typeName)%>
						</div>
						<%
						} else {
						%>
						<div id="biaoti1">
							<IMG height="auto"
								src="../../../zgbpro/jsp/newsqiantai/<%=catalogp.getFilepath()%>"
								id="image" onload="javascript:resizepic(this);"
								alt="<%=checkzif(zuoleixin,typeName)%>" />
							<div style="visibility:hidden" id="altlayer" class="title"
								width="167px" height="22px"></div>

						</div>
						<%
						}
						%>
						<!-- ҳ���󲿷ֹ�����Ŀ������� -->
						<!-- ҳ���󲿷ֹ�����Ŀ���� -->
						<div class="neirong">
							<ul>
								<%
											for (int b = 0; b < guizhangTypeChildLeftList.size(); b++) {
											String name = "";
											String url = "";
											if (catalogp.getParentId() == 0) {
												Catalog catalogc = (Catalog) guizhangTypeChildLeftList
												.get(b);
												name = catalogc.getDescription();
												url = "newsLieBiao.jsp?type=" + guizhang
												+ "&&catalogId="
												+ catalogc.getCatalogId();
											} else {
												News news = (News) guizhangTypeChildLeftList
												.get(b);
												name = news.getSubject();
												url = "newsShow.jsp?type=" + guizhang
												+ "&&newsId=" + news.getNewsId();
											}
								%>
								<li>
									<a href="<%=url%>"><%=checkzif(zuonews,name)%></a>
								</li>
								<%
										}
										if (guizhangTypeChildLeftList.size() + 1 > typenum) {
								%>
								<li>
									<a href="<%=moreurl%>">����...</a>
								</li>
								<%
								}
								%>
							</ul>
						</div>
						<!-- ҳ���󲿷ֹ�����Ŀ���ݽ��� -->
					</div>
					<!-- ҳ���󲿷ֹ�����Ŀ������ -->
					<%
							}
							}
						}
					%>
					<!-- ҳ������Ŀ������ -->

					<!-- ҳ������Ŀ������ -->
				</div>


				<!-- ҳ���в���Ŀ�����Ҳ���Ŀ�� -->
				<div id="right">
					<div class="cbox2">
						<div class="ctit2"
							style="background:url(../../resources/images/Folder-Html.gif) no-repeat 10px center;">
							<span class="lmbt1">����</span>
							<span class="more"><a href="newsLieBiao.jsp?type=<%=xinwen%>&&catalogId=-1">more</a> </span>
						</div>
						<div class="tpnews">
							<div class="imges"><img id="picturechange" src="../../resources/images/01.jpg" width="200" height="139" border="0" /></div>

							<div class="newsnr2">
								<ul>
									<%
									if (newslist != null&&newslist.size()!=0) {
									%>
									<script language="JavaScript">
									function changepictu()
									{
									a=<%=newslist.size()%>;
									var pp=Math.random();
									var foot=Math.round(pp*(a-1));
									b=new Array(a);
									<%for(int k=0;k<newslist.size();k++){
									News news = (News) newslist.get(k);
									%>
									b[<%=k%>]='<%=news.getPicDir()%>';
									<%}%>
									document.getElementById("picturechange").src="../../../zgbpro/"+b[foot];
									setTimeout( 'changepictu()',1000)
									}
									</script>
									<%
									}
									%>
									<%
											if (newslist != null) {
											for (int a = 0; a < newslist.size(); a++) {
												News news = (News) newslist.get(a);
									%>

									<li>
										<a href="newsShow.jsp?type=<%=xinwen%>&&newsId=<%=news.getNewsId()%>"><%=checkzif(zhongxinwen,news.getSubject())%></a>
									</li>
									<%
										}
										}
									%>
								</ul>
							</div>
						</div>
						<!-- ҳ���в�����������-->
					</div>

					<%
						List newTypeChildCenterList = null;
						if (newTypeCenterList != null) {
							int size = 0;
							if (newTypeCenterList.size() % 2 == 0) {
								size = newTypeCenterList.size();
							} else {
								size = newTypeCenterList.size() - 1;
							}
					%>
					<div class="cbox1">
						<%
									for (int a = 0; a < size; a++) {
									Catalog catalogp = (Catalog) newTypeCenterList.get(a);
									String moreurl ="";
									if (catalogp.getParentId() == 0) {
								newTypeChildCenterList = ManagerServers.getInstance()
										.getNewsManage().getShowLeixing(departmentId,
										xinwen, catalogp.getCatalogId(),
										getall, centernum, fabu);
										moreurl = "newsXiaoType.jsp?type=" + xinwen
									+ "&&catalogId=" + catalogp.getCatalogId();
									} else {
								newTypeChildCenterList = ManagerServers.getInstance()
										.getNewsManage().getNewsByLeixing(
										catalogp.getCatalogId(), centernum,
										xinwen, departmentId);
										moreurl = "newsLieBiao.jsp?type=" + xinwen
									+ "&&catalogId=" + catalogp.getCatalogId();
									}
									if (newTypeChildCenterList != null
									&& newTypeChildCenterList.size() != 0) {
						%>
						<div class="mnews">
							<%
									String typeName = "";
									if (catalogp.getSorh() == xianshi) {
										typeName = catalogp.getName();
									}
									if (catalogp.getFilepath().equals("")) {
							%>
							<div class="mtitle"
								style="background:url(../../resources/images/newstitbg.gif) no-repeat left top;">
								<span class="lmbt"><%=checkzif(zhongleixinx,typeName)%></span>
								<span class="more"><a href="<%=moreurl%>">more</a> </span>
							</div>
							<%
							} else {
							%>
							<div id="biaoti1" >
								<IMG height="auto"
									src="../../../zgbpro/jsp/newsqiantai/<%=catalogp.getFilepath()%>"
									id="image" onload="javascript:resizepic2(this);"
									alt="<span class='lmbt'><%=checkzif(zhongleixinx,typeName)%> </span><span class='more'><a href='<%=moreurl%>'>more</a></span>"/><div style="visibility:hidden" id="altlayer"  class="mtitle" width="167px" height="22px"></div>

							</div>
							<%
							}
							%>

							<div class="mlist">
								<ul>
									<%
												for (int b = 0; b < newTypeChildCenterList.size(); b++) {
												String name = "";
												String url = "";
												if (catalogp.getParentId() == 0) {
													Catalog catalogc = (Catalog) newTypeChildCenterList
													.get(b);
													name = catalogc.getDescription();
													url = "newsLieBiao.jsp?type=" + xinwen
													+ "&&catalogId="
													+ catalogc.getCatalogId();
												} else {
													News news = (News) newTypeChildCenterList
													.get(b);
													name = news.getSubject();
													url = "newsShow.jsp?type=" + xinwen
													+ "&&newsId=" + news.getNewsId();
												}
									%>
									<li>
										<a href="<%=url%>"><%=checkzif(zhongnewsx,name)%></a>
									</li>
									<%
									}
									%>
								</ul>
							</div>
						</div>

						<%
								}
								}
						%>
					</div>


					<%
					}
					%>
					<%
						List guizhangTypeChildCenterList = null;
						if (guizhangTypeCenterList != null) {
							int size = 0;
							if (guizhangTypeCenterList.size() % 2 == 0) {
								size = guizhangTypeCenterList.size();
							} else {
								size = guizhangTypeCenterList.size() - 1;
							}
					%>
					<div class="cbox1">
						<%
									for (int a = 0; a < size; a++) {
									Catalog catalogp = (Catalog) guizhangTypeCenterList.get(a);
									String moreurl="";
									if (catalogp.getParentId() == 0) {
								guizhangTypeChildCenterList = ManagerServers
										.getInstance().getNewsManage().getShowLeixing(
										departmentId, guizhang,
										catalogp.getCatalogId(), getall,
										centernum, fabu);
										moreurl = "newsXiaoType.jsp?type=" + guizhang
									+ "&&catalogId=" + catalogp.getCatalogId();
									} else {
								guizhangTypeChildCenterList = ManagerServers
										.getInstance().getNewsManage()
										.getNewsByLeixing(catalogp.getCatalogId(),
										centernum, guizhang, departmentId);
										moreurl = "newsLieBiao.jsp?type=" + guizhang
									+ "&&catalogId=" + catalogp.getCatalogId();
									}
									if (guizhangTypeChildCenterList != null
									&& guizhangTypeChildCenterList.size() != 0) {
						%>
						<div class="mnews">
							<%
									String typeName = "";
									if (catalogp.getSorh() == xianshi) {
										typeName = catalogp.getName();
									}
									if (catalogp.getFilepath().equals("")) {
							%>
							<div class="mtitle"
								style="background:url(../../resources/images/newstitbg.gif) no-repeat left top;">
								<span class="lmbt"><%=checkzif(zhongleixinx,typeName)%></span>
								<span class="more"><a href="<%=moreurl%>">more</a> </span>
							</div>
							<%
							} else {
							%>
							<div id="biaoti1">
								<IMG height="auto"
									src="../../../zgbpro/jsp/newsqiantai/<%=catalogp.getFilepath()%>"
									id="image" onload="javascript:resizepic2(this);"
									alt="<span class='lmbt'><%=checkzif(zhongleixinx,typeName)%> </span><span class='more'><a href='<%=moreurl%>'>more</a></span>"/><div style="visibility:hidden" id="altlayer" class="mtitlep" width="167px" height="22px"></div>

							</div>
							<%
							}
							%>
							<div class="mlist">
								<ul>
									<%
												for (int b = 0; b < guizhangTypeChildCenterList.size(); b++) {
												String name = "";
												String url = "";
												if (catalogp.getParentId() == 0) {
													Catalog catalogc = (Catalog) guizhangTypeChildCenterList
													.get(b);
													name = catalogc.getDescription();
													url = "newsLieBiao.jsp?type=" + guizhang
													+ "&&catalogId="
													+ catalogc.getCatalogId();
												} else {
													News news = (News) guizhangTypeChildCenterList
													.get(b);
													name = news.getSubject();
													url = "newsShow.jsp?type=" + guizhang
													+ "&&newsId=" + news.getNewsId();
												}
									%>
									<li>
										<a href="<%=url%>"><%=checkzif(zhongnewsx,name)%></a>
									</li>
									<%
									}
									%>
								</ul>
							</div>
						</div>
						<%
								}
								}
							}
						%>
					</div>
					<%
							if (newTypeCenterList != null) {
							if (newTypeCenterList.size() % 2 != 0) {
								Catalog catalogp = (Catalog) newTypeCenterList
								.get(newTypeCenterList.size() - 1);
								String moreurl = "";
								if (catalogp.getParentId() == 0) {
							newTypeChildCenterList = ManagerServers.getInstance()
									.getNewsManage().getShowLeixing(departmentId,
									xinwen, catalogp.getCatalogId(),
									getall, centernum, fabu);
									moreurl = "newsXiaoType.jsp?type=" + xinwen
									+ "&&catalogId=" + catalogp.getCatalogId();
								} else {
							newTypeChildCenterList = ManagerServers.getInstance()
									.getNewsManage().getNewsByLeixing(
									catalogp.getCatalogId(), centernum,
									xinwen, departmentId);
									moreurl = "newsLieBiao.jsp?type=" + xinwen
									+ "&&catalogId=" + catalogp.getCatalogId();
								}
								if (newTypeChildCenterList != null
								&& newTypeChildCenterList.size() != 0) {
					%>
					<div class="cbox2">
						<%
								String typeName = "";
								if (catalogp.getSorh() == xianshi) {
									typeName = catalogp.getName();
								}
								if (catalogp.getFilepath().equals("")) {
						%>
						<div class="ctit2"
							style="background:url(../../resources/images/Folder-Html.gif) no-repeat 10px center;">
							<span class="lmbt1"><%=checkzif(zhongleixind,typeName)%></span>
							<span class="more"><a href="<%=moreurl%>">more</a> </span>
						</div>
						<%
						} else {
						%>
						<div id="biaoti1">
							<IMG height="auto"
								src="../../../zgbpro/jsp/newsqiantai/<%=catalogp.getFilepath()%>"
								id="image" onload="javascript:resizepic3(this);"
								alt="<span class='lmbt1'><%=checkzif(zhongleixind,typeName)%></span><span class='more'><a href='<%=moreurl%>'>more</a> </span>" />
							<div style="visibility:hidden" id="altlayer" class="ctitp"
								width="580px" height="20px"></div>

						</div>
						<%
						}
						%>
						<div class="clist2">
							<ul>
								<%
											for (int b = 0; b < newTypeChildCenterList.size(); b++) {
											String name = "";
											String url = "";
											if (catalogp.getParentId() == 0) {
												Catalog catalogc = (Catalog) newTypeChildCenterList
												.get(b);
												name = catalogc.getDescription();
												url = "newsLieBiao.jsp?type=" + xinwen
												+ "&&catalogId="
												+ catalogc.getCatalogId();
											} else {
												News news = (News) newTypeChildCenterList
												.get(b);
												name = news.getSubject();
												url = "newsShow.jsp?type=" + xinwen
												+ "&&newsId=" + news.getNewsId();
											}
								%>
								<li>
									<a href="<%=url%>"><%=checkzif(zhongnewsd,name)%></a>
								</li>
								<%
								}
								%>

							</ul>
						</div>
					</div>
					<%
							}
							}
						}
					%>
					<%
							if (guizhangTypeCenterList != null) {
							if (guizhangTypeCenterList.size() % 2 != 0) {
								Catalog catalogp = (Catalog) guizhangTypeCenterList
								.get(guizhangTypeCenterList.size() - 1);
								String moreurl ="";
								if (catalogp.getParentId() == 0) {
							guizhangTypeChildCenterList = ManagerServers
									.getInstance().getNewsManage().getShowLeixing(
									departmentId, guizhang,
									catalogp.getCatalogId(), getall,
									centernum, fabu);
									moreurl = "newsXiaoType.jsp?type=" + guizhang
									+ "&&catalogId=" + catalogp.getCatalogId();
								} else {
							guizhangTypeChildCenterList = ManagerServers
									.getInstance().getNewsManage()
									.getNewsByLeixing(catalogp.getCatalogId(),
									centernum, guizhang, departmentId);
									moreurl = "newsLieBiao.jsp?type=" + guizhang
									+ "&&catalogId=" + catalogp.getCatalogId();
								}
								if (guizhangTypeChildCenterList != null
								&& guizhangTypeChildCenterList.size() != 0) {
					%>
					<div class="cbox2">
						<%
								String typeName = "";
								if (catalogp.getSorh() == xianshi) {
									typeName = catalogp.getName();
								}
								if (catalogp.getFilepath().equals("")) {
						%>
						<div class="ctit2"
							style="background:url(../../resources/images/Folder-Html.gif) no-repeat 10px center;">
							<span class="lmbt1"><%=checkzif(zhongleixind,typeName)%></span>
							<span class="more"><a href="<%=moreurl%>">more</a> </span>
						</div>
						<%
						} else {
						%>
						<div id="biaoti1">
							<IMG height="auto"
								src="../../../zgbpro/jsp/newsqiantai/<%=catalogp.getFilepath()%>"
								id="image" onload="javascript:resizepic3(this);"
								alt="<span class='lmbt1'><%=checkzif(zhongleixind,typeName)%> </span><span class='more'><a href='<%=moreurl%>'>more</a> </span>" />
							<div style="visibility:hidden" id="altlayer" class="ctitp"
								width="580px" height="20px"></div>

						</div>
						<%
						}
						%>
						<div class="clist2">
							<ul>
								<%
											for (int b = 0; b < guizhangTypeChildCenterList.size(); b++) {
											String name = "";
											String url = "";
											if (catalogp.getParentId() == 0) {
												Catalog catalogc = (Catalog) guizhangTypeChildCenterList
												.get(b);
												name = catalogc.getDescription();
												url = "newsLieBiao.jsp?type=" + guizhang
												+ "&&catalogId="
												+ catalogc.getCatalogId();
											} else {
												News news = (News) guizhangTypeChildCenterList
												.get(b);
												name = news.getSubject();
												url = "newsShow.jsp?type=" + guizhang
												+ "&&newsId=" + news.getNewsId();
											}
								%>
								<li>
									<a href="<%=guizhang%>"><%=checkzif(zhongnewsd,name)%></a>
								</li>
								<%
								}
								%>

							</ul>
						</div>
					</div>

					<%
							}
							}
						}
					%>
<div class="cbox2">
	<div class="ctit2" style="background:url(../resources/images/Folder-Html.gif) no-repeat 10px center;"><span class="lmbt1">��������</span>
	<span class="more"><a href="#">more</a></span></div>
	<!-- ������Ϣ -->
	<div class="clgl">
	<div class="cltit">������Ϣ</div>
	<div class="clnr">
	    <ul>
		<li>����</li>
		<li>ִ��</li>
		<li>����</li>
		<li>ս����</li>
		<li>�����</li>
		</ul>
		<ul>
		<li><%=daiMing_v%>%</li>
		<li><%=zhiQin_v%>%</li>
		<li><%=qiTa_v%>%</li>
		<li><%=zhanBei_v%>%</li>
		<li><%=wanHao_v%>%</li>
		</ul>
		</div>
	</div>
	<div class="clgl">
	<div class="cltit">��ʻԱ��Ϣ</div>
	<div class="clnr">
	    <ul>
		<li>�б�����</li>
		<li>����</li>
		<li>Ԥ����</li>
		<li>����</li>
		<li>��λ��</li>
		</ul>
		<ul>
		<li><%=daiMingD_v%>%</li>
		<li><%=chuCheD_v%>%</li>
		<li><%=yuChuCheD_v%>%</li>
		<li><%=qiTaD_v%>%</li>
		<li><%=zaiWeiD_v%>%</li>
		</ul>
		</div>
	</div>
    <!-- ������Ϣ -->
	</div>
	



				</div>
				<!-- ҳ���в���Ŀ�����Ҳ���Ŀ������ -->
			</div>

			<div id="nav1024">
				<!-- ҳ���Ҳ�������Ŀ�� -->
				<div class="nbox">
					<div class="ntitle"
						style="background:url(../../resources/images/1024tit.gif) no-repeat center top;">
						����
					</div>
					<div class="nneirong">
						<ul>
							<%
									if (gonggaolist != null) {
									for (int a = 0; a < gonggaolist.size(); a++) {
										News news = (News) gonggaolist.get(a);
							%>
							<li>
								<a href="newsShow.jsp?type=<%=gonggao%>&&newsId=<%=news.getNewsId()%>"><%=checkzif(younews,news.getSubject())%></a>
							</li>
							<%
									}
									if (gonggaolist.size() + 1 > typenum) {
							%>
							<li>
								<a href="newsLieBiao.jsp?type=<%=gonggao%>&&catalogId=-1">����...</a>
							</li>
							<%
								}
								}
							%>
						</ul>
					</div>
				</div><div class="nbox">
					<div class="ntitle"
						style="background:url(../../resources/images/1024tit.gif) no-repeat center top;">
						�ƻ�����
					</div>
					<div class="nneirong">
						<ul>
							<%
									if (jihualist != null) {
									if(jihualist.size()<=typejihua)
					{
					typejihua=jihualist.size();
					}
									for (int a = 0; a < typejihua; a++) {
										JiHuaGuanLiVO jiHuaGuanLiVO=(JiHuaGuanLiVO)jihualist.get(a);
							%>
							<li>
								<a href="planShow.jsp?leixingid=<%=jiHuaGuanLiVO.getId()%>"><%=checkzif(younews,jiHuaGuanLiVO.getJhTiMu())%></a>
							</li>
							<%
									}
									if (jihualist.size() + 1 > typenum) {
							%>
							<li>
								<a href="">����...</a>
							</li>
							<%
								}
								}
							%>
						</ul>
					</div>
				</div>
				
				<!-- ҳ���Ҳ�������Ŀ�� -->
				<%
					List newTypeChildRightList = null;
					if (newTypeRightList != null) {
						for (int a = 0; a < newTypeRightList.size(); a++) {
							Catalog catalogp = (Catalog) newTypeRightList.get(a);
							String moreurl="";
							if (catalogp.getParentId() == 0) {
						newTypeChildRightList = ManagerServers.getInstance()
								.getNewsManage().getShowLeixing(departmentId,
								xinwen, catalogp.getCatalogId(),
								getall, typenum, fabu);
								moreurl = "newsXiaoType.jsp?type=" + xinwen
									+ "&&catalogId=" + catalogp.getCatalogId();
							} else {
						newTypeChildRightList = ManagerServers.getInstance()
								.getNewsManage().getNewsByLeixing(
								catalogp.getCatalogId(), typenum,
								xinwen, departmentId);
								moreurl = "newsLieBiao.jsp?type=" + xinwen
									+ "&&catalogId=" + catalogp.getCatalogId();
							}
							if (newTypeChildRightList != null
							&& newTypeChildRightList.size() != 0) {
				%>
				<div class="nbox">
					<!-- ҳ���Ҳ���������Ŀ���� -->
					<%
							String typeName = "";
							if (catalogp.getSorh() == xianshi) {
								typeName = catalogp.getName();
							}
							if (catalogp.getFilepath().equals("")) {
					%>
					<div class="ntitle"
						style="background:url(../../resources/images/1024tit.gif) no-repeat center top;">
						<%=checkzif(youleixin,typeName)%>
					</div>
					<%
					} else {
					%>
					<div id="biaoti1">
						<IMG height="auto"
							src="../../../zgbpro/jsp/newsqiantai/<%=catalogp.getFilepath()%>"
							id="image" onload="javascript:resizepic1(this);"
							alt="<%=checkzif(youleixin,typeName)%>" />
						<div style="visibility:hidden" id="altlayer" class="ntitle"
							width="180px" height="22px"></div>

					</div>
					<%
					}
					%>
					<!-- ҳ���Ҳ���������Ŀ������� -->
					<!-- ҳ���Ҳ���������Ŀ���� -->
					<div class="nneirong">
						<ul>
							<%
										for (int b = 0; b < newTypeChildRightList.size(); b++) {
										String name = "";
										String url = "";
										if (catalogp.getParentId() == 0) {
											Catalog catalogc = (Catalog) newTypeChildRightList
											.get(b);
											name = catalogc.getDescription();
											url = "newsLieBiao.jsp?type=" + xinwen
											+ "&&catalogId="
											+ catalogc.getCatalogId();
										} else {
											News news = (News) newTypeChildRightList.get(b);
											name = news.getSubject();
											url = "newsShow.jsp?type=" + guizhang
											+ "&&newsId=" + news.getNewsId();
										}
							%>
							<li>
								<a href="<%=url%>"><%=checkzif(younews,name)%>
								</a>
							</li>
							<%
									}
									if (newTypeChildRightList.size() + 1 > typenum) {
							%>
							<li>
								<a href="<%=moreurl%>">����...</a>
							</li>
							<%
							}
							%>
						</ul>
					</div>
					<!-- ҳ���Ҳ���������Ŀ���ݽ��� -->
				</div>
				<!-- ҳ���Ҳ���������Ŀ������ -->
				<%
						}
						}
					}
				%>
				<!-- ҳ���Ҳ��ֹ�����Ŀ�� -->
				<%
					List guizhangTypeChildRightList = null;
					if (guizhangTypeRightList != null) {
						for (int a = 0; a < guizhangTypeRightList.size(); a++) {
							Catalog catalogp = (Catalog) guizhangTypeRightList.get(a);
							String moreurl="";
							if (catalogp.getParentId() == 0) {
						guizhangTypeChildRightList = ManagerServers
								.getInstance().getNewsManage().getShowLeixing(
								departmentId, guizhang,
								catalogp.getCatalogId(), getall,
								typenum, fabu);
								moreurl = "newsXiaoType.jsp?type=" + guizhang
									+ "&&catalogId=" + catalogp.getCatalogId();
							} else {
						guizhangTypeChildRightList = ManagerServers
								.getInstance().getNewsManage()
								.getNewsByLeixing(catalogp.getCatalogId(),
								typenum, guizhang, departmentId);
								moreurl = "newsLieBiao.jsp?type=" + guizhang
									+ "&&catalogId=" + catalogp.getCatalogId();
							}

							if (guizhangTypeChildRightList != null
							&& guizhangTypeChildRightList.size() != 0) {
				%>
				<div class="nbox">
					<!-- ҳ���Ҳ��ֹ�����Ŀ���� -->
					<%
							String typeName = "";
							if (catalogp.getSorh() == xianshi) {
								typeName = catalogp.getName();
							}
							if (catalogp.getFilepath().equals("")) {
					%>
					<div class="ntitle"
						style="background:url(../../resources/images/1024tit.gif) no-repeat center top;">
						<%=checkzif(youleixin,typeName)%>
					</div>
					<%
					} else {
					%>
					<div id="biaoti1">
						<IMG height="auto"
							src="../../../zgbpro/jsp/newsqiantai/<%=catalogp.getFilepath()%>"
							id="image" onload="javascript:resizepic1(this);"
							alt="<%=checkzif(youleixin,typeName)%>" />
						<div style="visibility:hidden" id="altlayer" class="ntitle"
							width="180px" height="22px"></div>

					</div>
					<%
					}
					%>
					<!-- ҳ���Ҳ��ֹ�����Ŀ������� -->
					<!-- ҳ���Ҳ��ֹ�����Ŀ���� -->
					<div class="nneirong">
						<ul>
							<%
										for (int b = 0; b < guizhangTypeChildRightList.size(); b++) {
										String name = "";
										String url = "";
										if (catalogp.getParentId() == 0) {
											Catalog catalogc = (Catalog) guizhangTypeChildRightList
											.get(b);
											name = catalogc.getDescription();
											url = "newsLieBiao.jsp?type=" + guizhang
											+ "&&catalogId="
											+ catalogc.getCatalogId();
										} else {
											News news = (News) guizhangTypeChildRightList
											.get(b);
											name = news.getSubject();
											url = "newsShow.jsp?type=" + guizhang
											+ "&&newsId=" + news.getNewsId();
										}
							%>
							<li>
								<a href="<%=url%>"><%=checkzif(younews,name)%></a>
							</li>
							<%
									}
									if (guizhangTypeChildRightList.size() + 1 > typenum) {
							%>
							<li>
								<a href="<%=moreurl%>">����...</a>
							</li>
							<%
							}
							%>
						</ul>
					</div>
					<!-- ҳ���Ҳ��ֹ�����Ŀ���ݽ��� -->
				</div>
				<!-- ҳ���Ҳ��ֹ�����Ŀ������ -->
				<%
						}
						}
					}
				%>
				<!-- ҳ���Ҳ���Ŀ������ -->
			</div>
			<!-- ҳ����Ҫ��Ϣչʾ������ -->
		</div>
		<jsp:include flush="true" page="newsBottom.jsp"></jsp:include>
	</body>
</html>
