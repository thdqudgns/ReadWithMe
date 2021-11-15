package web.user.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.user.dao.face.FamousDao;
import web.user.service.face.FamousService;

@Service
public class FamousServiceImpl implements FamousService {
	
	private static final Logger logger = LoggerFactory.getLogger(FamousService.class);
	@Autowired private FamousDao famousDao;

}
