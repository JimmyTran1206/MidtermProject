package com.skilldistillery.gamequest.controllers;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.gamequest.data.UserDAO;
import com.skilldistillery.gamequest.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired
	private UserDAO userDAO;

	@GetMapping(value = { "/", "home.do", "" })
	public String home() {
		// User u = userDAO.authenticateUser("JohnnyCage", "123");
		// model.addAttribute("loggedIn", u);
		return "home";
	}

	@GetMapping(value = "login.do")
	public String showLoginBlank() {
		return "User/LoginBlank";
	}

	@GetMapping(value = "register.do")
	public String showRegisterBlank() {
		return "User/RegisterBlank";
	}

	// userLogin.do - handle user login
	@PostMapping(value = "userLogin.do")
	public String userLogin(User user, HttpSession session) {
		User currentUser = (User) session.getAttribute("loggedIn");
		if (currentUser != null) {
			return "redirect:home.do";
		} else {
			User loggedInUser = userDAO.authenticateUser(user.getUsername(), user.getPassword());
			if (loggedInUser == null) {
				return "redirect:loginNoUser.do";
			} else {
				if (loggedInUser.isEnabled() == true) {
					session.setAttribute("loggedIn", loggedInUser);
					return "redirect:home.do";
				} else {
					return "redirect:deactivatedUser.do";
				}
			}
		}
	}

	@GetMapping(value="loginNoUser.do")
	public String loginNoUser() {
		return "User/LoginNoUser";
	}
	
	@GetMapping(value="deactivatedUser.do")
	public String deactivatedUser() {
		return "User/DeactivatedUser";
	}
	
	// handle logout.do
	@GetMapping(value="logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loggedIn");
		return "home";
	}
	
	// userRegister.do - handle user register
	@PostMapping(value = "userRegister.do")
	public String userRegister(User user, HttpSession session,RedirectAttributes redir) {
		User currentUser = (User) session.getAttribute("loggedIn");
		if (currentUser != null) {
			session.removeAttribute("loggedIn");
			return "redirect:register.do";
		}
		if (userDAO.findUserByUsername(user.getUsername())!=null) {
			redir.addFlashAttribute("username", user.getUsername());
			return "redirect:registerDuplicatedUser.do";
		}else {
			user.setProfilePicture("https://cdn-icons-png.flaticon.com/512/149/149071.png");
			user.setEnabled(true);
			user.setRole("user");
			redir.addFlashAttribute("username", user.getUsername());
			userDAO.addUser(user);
			return "redirect:registerSuccess.do";
		}
		
	}
	
	@GetMapping(value="registerDuplicatedUser.do")
	public String registerDuplicatedUser() {
		return "User/RegisterDuplicatedUser";
	}
	
	@GetMapping(value="registerSuccess.do")
	public String registerSuccess() {
		return "User/RegisterSuccess";
	}
	
	// handle view profile for user and admin
	@GetMapping(value="viewProfile.do")
	public String showProfile(HttpSession session, Model model) {
		User currentUser = (User) session.getAttribute("loggedIn");
		model.addAttribute("user", currentUser);
		if(currentUser.getRole().equals("admin")) {
			return "User/ProfileAdmin";
		}else {
			return "User/ProfileUser";
		}
	}
	
	// handle view update profile (same for both user and admin)
	@GetMapping(value="updateProfile.do")
	public String updateProfile(HttpSession session, Model model) {
		User currentUser = (User) session.getAttribute("loggedIn");
		model.addAttribute("user", currentUser);
		return "User/ProfileUpdate";
	}
	
	// handle update confirm
	@PostMapping(value="updateProfileConfirm.do")
	public String updateProfileConfirmed(User user, HttpSession session) {
		User updatedUser= userDAO.findUserById(userDAO.updateUserByInfo(user));
		session.setAttribute("loggedIn", updatedUser);
		return "redirect:viewProfile.do";
	}
	
	// userSelfDeactivate.do
	@GetMapping(value="userSelfDeactivate.do")
	public String userSelfDeactivated() {
		return "User/UserSelfDeactivatedWarning";
	}
	
	// userSelfDeactivatedConfirmed.do
	@GetMapping(value="userSelfDeactivateConfirmed.do")
	public String userSelfDeactivatedConfirmed(HttpSession session) {
		User currentUser = (User) session.getAttribute("loggedIn");
		userDAO.deactivateUserById(currentUser.getId());
		session.removeAttribute("loggedIn");
		return "redirect:home.do";
	}
	

}
