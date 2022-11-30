/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.fautapo.web.cuenta;

import javax.servlet.http.HttpServletRequest;
import org.fautapo.domain.logic.MiFacade;
import org.fautapo.service.EmailService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;

/**
 *
 * @author Usuario
 */
@Controller
public class AccesosController {

    @Autowired
    private MiFacade mi;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private BCryptPasswordEncoder bcryptEncoder;
    @Autowired
    private EmailService emailservice;
    @Autowired
    private HttpServletRequest request;
}
