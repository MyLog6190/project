/*
 * //package com.project.user.controller; // //import java.util.List; //
 * //import org.springframework.beans.factory.annotation.Value; //import
 * org.springframework.stereotype.Controller; //import
 * org.springframework.ui.Model; //import
 * org.springframework.web.bind.annotation.GetMapping; //import
 * org.springframework.web.bind.annotation.RequestMapping; // //import
 * com.project.user.dto.ExerciseLibDTO; //import
 * com.project.user.service.ExerciseLibService; // //import
 * lombok.RequiredArgsConstructor; //import lombok.extern.log4j.Log4j2; // //
 * //@Controller //@Log4j2 //@RequestMapping("/exlib")
 * //@RequiredArgsConstructor //public class ExerciseLibController { // private
 * final ExerciseLibService exerciseLibService; // //
 * // @Value("${exerciselib.imgdir}") // String imgdir; // // // //
 * // @GetMapping // public String libraries(Model model) { //
 * List<ExerciseLibDTO> list = null; // try { // list =
 * exerciseLibService.getAll(); // model.addAttribute("ellist", list); //
 * log.info(model); // } catch(Exception e) { // log.error(e.getMessage()); //
 * log.info("라이브러리 로드 과정에서 문제 발생"); // } // // // return "/exercise-lib"; // }
 * 
 * // @GetMapping("/list") // public String libex1(Model model) { // //
 * List<ExerciseLibDTO> list = null; // // try { // list =
 * exerciseLibService.getAll(); // model.addAttribute("list", list); // }
 * catch(Exception e) { // log.error(e.getMessage()); //
 * log.info("라이브러리 로드 과정에서 문제 발생"); // model.addAttribute("error",
 * "뉴스를 정상적으로 가져오지 못했습니다."); // } // // return "/lib-example"; // } //}
 */