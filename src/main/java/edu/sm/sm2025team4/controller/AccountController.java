package edu.sm.sm2025team4.controller;

import edu.sm.sm2025team4.dto.Cust;
import edu.sm.sm2025team4.dto.Cust_Info;
import edu.sm.sm2025team4.service.CustService;
import edu.sm.sm2025team4.service.Cust_InfoService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
public class AccountController {

    final CustService custService;
    final Cust_InfoService custInfoService;

    String dir = "myaccount/";

    @RequestMapping("/account")
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
    public String update(Model model, Cust cust) throws Exception {
        custService.modify(cust);
        return "redirect:/logout";
    }


    //주소록 목록
    @RequestMapping("/address")
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

    //주소록 추가
    @RequestMapping("/addaddress")
    public String addaddress(Model model, HttpSession session) throws Exception {
        Cust logincust = (Cust) session.getAttribute("cust");

        if(logincust == null) {
            return "redirect:/login";
        }

        model.addAttribute("c", logincust);
        model.addAttribute("center", dir + "addaddress");
        return "index";
    }
    // 주소록 생성
    @RequestMapping("/add")
    public String add(Model model, Cust_Info cust_info) throws Exception {

        custInfoService.register(cust_info);
        return "redirect:address";
    }
    // 주소록 삭제
    @RequestMapping("/delete")
    public String delete(Model model, Cust_Info cust_info, HttpSession session) throws Exception {
        Cust logincust = (Cust) session.getAttribute("cust");

        if(logincust == null) {
            return "redirect:/login";
        }

        cust_info.setCust_id(logincust.getCust_id());

        custInfoService.remove(cust_info.getCustinfo_no());
        return "redirect:/address";
    }
    // 주소록 수정
    @RequestMapping("/update")
    public String update(Model model, Cust_Info cust_info, HttpSession session) throws Exception {
        Cust logincust = (Cust) session.getAttribute("cust");

        if(logincust == null) {
            return "redirect:/login";
        }

        cust_info.setCust_id(logincust.getCust_id());

        custInfoService.modify(cust_info);
        return "redirect:/address";
    }
}
