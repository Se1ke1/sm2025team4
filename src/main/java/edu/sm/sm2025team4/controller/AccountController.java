package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Cust;
import edu.sm.sm2025team4.dto.Cust_Info;
import edu.sm.sm2025team4.service.CartService;
import edu.sm.sm2025team4.service.CustService;
import edu.sm.sm2025team4.service.Cust_InfoService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/account")
public class AccountController {

/*
* TODO: RequestMapping 주소 관련 제안.
*  전체를 @RequestMapping("/account")로 묶어서, 하위 항목들을 /account/update와 같이 조정해 그 목적의 가독성을 향상시키고 혹시 모를 중복을 피하는 것이 좋아보임
*  또는 동작에 중점을 두어 전체를 /account로 묶지 않고, 하위 항목의 Mapping을 /update/account와 같은 형태로 변경시킬 수도 있을 듯
* */

    final CustService custService;
    final Cust_InfoService custInfoService;
    final CartService cartService;

    String dir = "myaccount/";

    @RequestMapping("")
    public String account(Model model, HttpSession session) throws Exception {
        Cust logincust = (Cust) session.getAttribute("cust");

        if(logincust == null) {
            return "redirect:/login";
        }

        Cust cust = null;
        cust = custService.get(logincust.getCust_id());

        model.addAttribute("c", cust);
        model.addAttribute("activePage", "account");
        model.addAttribute("left", "left");
        model.addAttribute("right", "account");
        model.addAttribute("center", dir + "index");

        return "index";
    }

    //회원정보 수정
    @RequestMapping("/update")
    public String update(Model model, Cust cust, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {

        custService.modify(cust);

        session.invalidate();

        redirectAttributes.addFlashAttribute("error", "보안을 위해 다시 로그인해주세요");

        return "redirect:/login";
    }

    // 계정 삭제 페이지
    @RequestMapping("/delete-form")
    public String del_account(Model model, HttpSession session) throws Exception {
        Cust logincust = (Cust) session.getAttribute("cust");

        if(logincust == null) {
            return "redirect:/login";
        }

        Cust cust = null;
        cust = custService.get(logincust.getCust_id());

        model.addAttribute("c", cust);
        model.addAttribute("activePage", "del_account");
        model.addAttribute("left", "left");
        model.addAttribute("right", "del_account");
        model.addAttribute("center", dir + "index");

        return "index";
    }

    // 계정 삭제
    @RequestMapping("/delete")
    public String del_account(Model model, @RequestParam("password") String pwd, HttpSession session) throws Exception {
        Cust logincust = (Cust) session.getAttribute("cust");

        if(logincust == null) {
            return "redirect:/login";
        }

        Cust cust = null;
        cust = custService.get(logincust.getCust_id());

        if(!logincust.getCust_pwd().equals(pwd)) {
            model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
            model.addAttribute("left", "left");
            model.addAttribute("right", "del_account");
            model.addAttribute("center", dir + "index");

            return "index";
        }

        custService.remove(logincust.getCust_id());
        custInfoService.removeByForeignKey(logincust.getCust_id());
        cartService.removeByForeignKey(logincust.getCust_id());

        session.invalidate();

        return "redirect:/";
    }


    //주소록 목록
    @RequestMapping("/address-form")
    public String address(Model model, HttpSession session) throws Exception {
        Cust logincust = (Cust) session.getAttribute("cust");

        if(logincust == null) {
            return "redirect:/login";
        }

        List<Cust_Info> cust_info = custInfoService.getByForeignKey(logincust.getCust_id());
        model.addAttribute("ci", cust_info);
        model.addAttribute("activePage", "address");
        model.addAttribute("left", "left");
        model.addAttribute("right", "address");
        model.addAttribute("center", dir + "index");
        return "index";
    }

    //주소록 추가 페이지
    @RequestMapping("/address/add-form")
    public String addaddress(Model model, HttpSession session) throws Exception {
        Cust logincust = (Cust) session.getAttribute("cust");

        if(logincust == null) {
            return "redirect:/login";
        }

        model.addAttribute("c", logincust);
        model.addAttribute("activePage", "addaddress");
        model.addAttribute("left", "left");
        model.addAttribute("right", "addaddress");
        model.addAttribute("center", dir + "index");
        return "index";
    }
    //주소록 추가
    @RequestMapping("/address/add")
    public String add(Model model, Cust_Info cust_info) throws Exception {

        custInfoService.register(cust_info);
        return "redirect:/account/address-form";
    }

}
