package com.liaoliao.profit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.liaoliao.profit.dao.WeixinPayLogDao;
import com.liaoliao.profit.entity.WeixinPayLog;
import com.liaoliao.profit.service.WeixinPayLogService;


@Service
@Transactional
public class WeixinPayLogServiceImpl implements WeixinPayLogService {

	@Autowired
	private WeixinPayLogDao weixinPayLogDao;
	
	
	@Override
	public void saveWeixinPayLog(WeixinPayLog wpl) {
		weixinPayLogDao.saveWeixinPayLog(wpl);
	}


	@Override
	public WeixinPayLog findByOutTradNo(String out_trade_no) {
		return weixinPayLogDao.findByOutTradNo(out_trade_no);
	}


	@Override
	public void updateWeixinPayLog(WeixinPayLog wpl) {
		weixinPayLogDao.updateWeixinPayLog( wpl);
	}


	@Override
	public List<WeixinPayLog> findAll(Integer pageNo) {
		return weixinPayLogDao.findAll(  pageNo);
	}


	@Override
	public Integer findCount() {
		return weixinPayLogDao.findCount() ;
	}

}
