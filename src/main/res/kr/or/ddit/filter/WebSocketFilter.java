//package kr.or.ddit.filter;
//
//import java.io.ioexception;
//import java.security.principal;
//
//import javax.servlet.filter;
//import javax.servlet.filterchain;
//import javax.servlet.filterconfig;
//import javax.servlet.servletexception;
//import javax.servlet.servletrequest;
//import javax.servlet.servletresponse;
//import javax.servlet.http.httpservletrequest;
//import javax.servlet.http.httpservletrequestwrapper;
//
//import kr.or.ddit.utils.principalwithsession;
//
//public class websocketfilter implements filter {
//
//	@override
//	public void destroy() {
//	}
//
//	@override
//	public void init(filterconfig arg0) throws servletexception {
//	}
//
//	@override
//	public void dofilter(servletrequest servletrequest, servletresponse servletresponse,
//			filterchain filterchain) throws ioexception, servletexception {
//		httpservletrequest request = (httpservletrequest) servletrequest;
//		
//		final principalwithsession princiapl = new principalwithsession(request.getsession());
//		
//		httpservletrequestwrapper requestwrapper = new httpservletrequestwrapper(request){
//
//			@override
//			public principal getuserprincipal() {
//				return princiapl;
//			}
//		};
//		
//		filterchain.dofilter(requestwrapper, servletresponse);
//	}
//	
//}
//
//



