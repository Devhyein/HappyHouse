package com.ssafy.happyhouse.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.QnA;
import com.ssafy.happyhouse.model.service.QnAService;

import io.swagger.annotations.ApiOperation;

//http://localhost:8080/happyhouse/swagger-ui.html
@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/api/qna")
public class QnAController {

	private static final Logger logger = LoggerFactory.getLogger(QnAController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	@Autowired
	private QnAService qnaService;

	@ApiOperation(value = "모든 게시글의 정보를 반환한다.", response = List.class)
	@GetMapping
	public ResponseEntity<List<QnA>> searchAll() throws Exception {
		logger.debug("retrieve - 호출");
		return new ResponseEntity<List<QnA>>(qnaService.selectAllQnA(), HttpStatus.OK);
	}

    @ApiOperation(value = "search", response = QnA.class)    
	@GetMapping("/{no}")
	public ResponseEntity<QnA> search(@PathVariable String title) {
		logger.debug("detail - 호출");
		return new ResponseEntity<QnA>(qnaService.selectQnA(title), HttpStatus.OK);
	}

    @ApiOperation(value = "Register", response = String.class)
	@PostMapping
	public ResponseEntity<String> register(@RequestBody QnA qna) {
		logger.debug("register - 호출");
		if (qnaService.insertQnA(qna)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

    @ApiOperation(value = "Update", response = String.class)
	@PutMapping("/{no}")
	public ResponseEntity<String> updateBoard(@RequestBody QnA qna) {
		logger.debug("update - 호출");
		logger.debug("" + qna);
		
		if (qnaService.updateQnA(qna)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

    @ApiOperation(value = "Delete", response = String.class)
	@DeleteMapping("/{no}")
	public ResponseEntity<String> deleteBoard(@PathVariable String qnaTitle) {
		logger.debug("delete - 호출");
		if (qnaService.deleteQnA(qnaTitle)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
}