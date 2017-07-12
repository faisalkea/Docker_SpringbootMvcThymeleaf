package com.faisal.springboot.dockerexample;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Created by faisaljarkass on 12/07/2017.
 */
@Controller
public class HomeController {

    @GetMapping(value = "/")
    public String index(){
        return "index";
    }

}
