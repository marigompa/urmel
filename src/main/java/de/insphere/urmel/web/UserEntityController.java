package de.insphere.urmel.web;

import de.insphere.urmel.UserEntity;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/userentitys")
@Controller
@RooWebScaffold(path = "userentitys", formBackingObject = UserEntity.class)
public class UserEntityController {
}
