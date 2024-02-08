package com.skilldistillery.gamequest.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.gamequest.data.UserDAO;
import com.skilldistillery.gamequest.entities.Game;
import com.skilldistillery.gamequest.entities.GameImage;
import com.skilldistillery.gamequest.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired
	private UserDAO userDAO;

//	@GetMapping(value = { "/", "home.do", "" })
//	public String home() {
//		return "home";
//	}

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

	@GetMapping(value = "loginNoUser.do")
	public String loginNoUser() {
		return "User/LoginNoUser";
	}

	@GetMapping(value = "deactivatedUser.do")
	public String deactivatedUser() {
		return "User/DeactivatedUser";
	}

	// handle logout.do
	@GetMapping(value = "logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loggedIn");
		return "home";
	}

	// userRegister.do - handle user register
	@PostMapping(value = "userRegister.do")
	public String userRegister(User user, HttpSession session, RedirectAttributes redir) {
		User currentUser = (User) session.getAttribute("loggedIn");
		if (currentUser != null) {
			session.removeAttribute("loggedIn");
			return "redirect:register.do";
		}
		if (userDAO.findUserByUsername(user.getUsername()) != null) {
			redir.addFlashAttribute("username", user.getUsername());
			return "redirect:registerDuplicatedUser.do";
		} else {
			user.setProfilePicture("https://cdn-icons-png.flaticon.com/512/149/149071.png");
			user.setEnabled(true);
			user.setRole("user");
			redir.addFlashAttribute("username", user.getUsername());
			userDAO.addUser(user);
			return "redirect:registerSuccess.do";
		}

	}

	@GetMapping(value = "registerDuplicatedUser.do")
	public String registerDuplicatedUser() {
		return "User/RegisterDuplicatedUser";
	}

	@GetMapping(value = "registerSuccess.do")
	public String registerSuccess() {
		return "User/RegisterSuccess";
	}

	// handle view profile for user and admin
	@GetMapping(value = "viewProfile.do")
	public String showProfile(HttpSession session, Model model) {
		User currentUser = (User) session.getAttribute("loggedIn");
		model.addAttribute("user", currentUser);
		if (currentUser.getRole().equals("admin")) {
			return "User/ProfileAdmin";
		} else {
			return "User/ProfileUser";
		}
	}

	// handle view update profile (same for both user and admin)
	@GetMapping(value = "updateProfile.do")
	public String updateProfile(HttpSession session, Model model) {
		User currentUser = (User) session.getAttribute("loggedIn");
		model.addAttribute("user", currentUser);
		return "User/ProfileUpdate";
	}

	// handle update confirm
	@PostMapping(value = "updateProfileConfirm.do")
	public String updateProfileConfirmed(User user, HttpSession session) {
		User updatedUser = userDAO.findUserById(userDAO.updateUserByInfo(user));
		session.setAttribute("loggedIn", updatedUser);
		return "redirect:viewProfile.do";
	}

	// userSelfDeactivate.do
	@GetMapping(value = "userSelfDeactivate.do")
	public String userSelfDeactivated() {
		return "User/UserSelfDeactivatedWarning";
	}

	// userSelfDeactivatedConfirmed.do
	@GetMapping(value = "userSelfDeactivateConfirmed.do")
	public String userSelfDeactivatedConfirmed(HttpSession session) {
		User currentUser = (User) session.getAttribute("loggedIn");
		userDAO.deactivateUserById(currentUser.getId());
		session.removeAttribute("loggedIn");
		return "redirect:home.do";
	}

	// admin- view all users
	@GetMapping(value = "viewAllUsers.do")
	public String adminViewAllUsers(Model model) {
		List<User> userList = userDAO.getAllUser();
		model.addAttribute("userList", userList);
		return "User/AdminViewAllUsers";
	}

	// admin - view single user profile
	@GetMapping(value = "viewSingleUser.do")
	public String adminViewSingleUser(Model model, @RequestParam("id") int id) {
		User user = userDAO.findUserById(id);
		model.addAttribute("user", user);
		return "User/AdminViewSingleUser";
	}

	// admin - activate user account
	@GetMapping(value = "adminActivateUser.do")
	public String adminActivateUser(Model model, @RequestParam("id") int id) {
		User user = userDAO.activateUserById(id);
		model.addAttribute("user", user);
		return "User/AdminViewSingleUser";
	}

	// admin - deactivate user account
	@GetMapping(value = "adminDeactivateUser.do")
	public String adminDeactivateUser(Model model, @RequestParam("id") int id) {
		User user = userDAO.deactivateUserById(id);
		model.addAttribute("user", user);
		return "User/AdminViewSingleUser";
	}

	// admin - search user by Id
	@GetMapping(value = "adminSearchUserById.do")
	public String adminSearchUserById(Model model, @RequestParam("searchId") int id) {
		List<User> userList = userDAO.getUsersByid(id);
		model.addAttribute("id", id);
		model.addAttribute("userList", userList);
		return "User/AdminSearchUserById";
	}

	// admin - search user by Name
	@GetMapping(value = "adminSearchUserByName.do")
	public String adminSearchUserByName(Model model, @RequestParam("searchName") String name) {
		List<User> userList = userDAO.getUsersByUsername(name);
		model.addAttribute("name", name);
		model.addAttribute("userList", userList);
		return "User/AdminSearchUserByName";
	}

	// user - view user game list
	@GetMapping(value = "viewUserGameList.do")
	public String viewUserGameList(Model model, HttpSession session) {
		User currentUser = (User) session.getAttribute("loggedIn");
		List<Game> userGameList = userDAO.getGameListByUserId(currentUser.getId());
		model.addAttribute("gameList", userGameList);
		return "User/UserGameList";
	}

	// user - remove game from user list
	@GetMapping(value = "removeGameFromUserList.do")
	public String removeGameFromUserList(Model model, HttpSession session, @RequestParam("id") int gameId) {
		User currentUser = (User) session.getAttribute("loggedIn");
		userDAO.removeGameFromUserList(gameId, currentUser.getId());
		return "redirect:viewUserGameList.do";
	}

	// user - add a new game by inputting title
	@GetMapping(value = "userAddGame.do")
	public String userAddGame(Model model, @RequestParam("gameTitle") String gameTitle) {
		List<Game> gameList = userDAO.getGameListByUserInputTitle(gameTitle);
		if (gameList.isEmpty()) {
			model.addAttribute("title", gameTitle);
			return "User/UserAddGameForm";
		} else {
			model.addAttribute("gameTitle", gameTitle);
			model.addAttribute("gameList", gameList);
			return "User/UserGameListByInputTitle";
		}
	}

	// user- proceed to add game from the returned game list with input title
	@GetMapping(value = "viewUserAddGameForm.do")
	public String viewUserAddGameForm(Model model, @RequestParam("title") String title) {
		model.addAttribute("title", title);
		return "User/UserAddGameForm";
	}

	// user- confirm adding new game userAddGameConfirm.do
	@PostMapping(value = "userAddGameConfirm.do")
	public String userAddGameConfirm(HttpSession session, Game game,
			@RequestParam(value = "screenshots[]") String[] screenshots) {
		User currentUser = (User) session.getAttribute("loggedIn");

		// process the youtube link
		String youtubeURL = game.getTrailerUrl();
		String youtubeID = youtubeURL.substring(youtubeURL.indexOf("=") + 1, youtubeURL.indexOf("&"));
		game.setTrailerUrl(youtubeID);
		// finish processing the youtube link

		int gameId = userDAO.userAddNewGame(currentUser.getId(), game, screenshots);
		String redirStr = "redirect:viewGameDetails.do?id=" + gameId;

		return redirStr;
	}

	// user - view game details viewGameDetails.do
	@GetMapping(value = "viewGameDetails.do")
	public String viewGameDetails(Model model, @RequestParam("id") int gameId, HttpSession session) {
		User currentUserTemp = (User) session.getAttribute("loggedIn");
		User currentUser = userDAO.findUserByIdJoinFetchGameList(currentUserTemp.getId());
		Game game = userDAO.getGameById(gameId);
		User postedUser = userDAO.findUserByIdJoinFetchGameList(game.getUserId());
		boolean allowGameDetailUpdate = false;
		boolean gameInCurrentUserList = false;
		boolean isOriginalPost = false;
		String originalAuthor = postedUser.getUsername();
		if (currentUser.getId() == game.getUserId()) {
			allowGameDetailUpdate = true;
			isOriginalPost = true;
		}
		if (currentUser.getUserGames().contains(game)) {
			gameInCurrentUserList = true;
		}
		model.addAttribute("isOriginalPost", isOriginalPost);
		model.addAttribute("originalAuthor", originalAuthor);
		model.addAttribute("gameInCurrentUserList", gameInCurrentUserList);
		model.addAttribute("screenshots", game.getGameImages());
		model.addAttribute("allowGameDetailUpdate", allowGameDetailUpdate);
		model.addAttribute("game", game);
		return "GameDetails";
	}

	// user - add game to user list
	@GetMapping(value = "addGameToUserList.do")
	public String addGameToUserList(Model model, @RequestParam("gameId") int gameId, HttpSession session) {
		User currentUser = (User) session.getAttribute("loggedIn");
		userDAO.addGametoUserList(gameId, currentUser.getId());
		String redirStr = "redirect:viewGameDetails.do?id=" + gameId;
		return redirStr;
	}

	// user - view modify game info 
	@GetMapping(value = "viewModifyGameInfoForm.do")
	public String userModifyGameInfo(Model model, @RequestParam("id") int gameId ) {
		Game game = userDAO.getGameById(gameId);
		List<GameImage> screenshotList=userDAO.getGameScreenshotList(gameId);
		int screenshotListSize=0;
		if(!screenshotList.isEmpty()) {
			screenshotListSize=screenshotList.size();
		}
		model.addAttribute("game", game);
		model.addAttribute("screenshotList", screenshotList);
		model.addAttribute("screenshotListSize", screenshotListSize);
		
		return "User/UserModifyGameForm";
	}
	
	// user - confirm modifying game confirm userModifyGameConfirm.do
		@PostMapping(value = "userModifyGameConfirm.do")
	public String userModifyGameConfirm(Game game, @RequestParam(value = "screenshots[]") String[] screenshots) {

		// process the youtube link
		String youtubeURL = game.getTrailerUrl();
		String youtubeID = youtubeURL.substring(youtubeURL.indexOf("=") + 1, youtubeURL.indexOf("&"));
		game.setTrailerUrl(youtubeID);
		// finish processing the youtube link

		int gameId = userDAO.userModifyGameFields(game);
		userDAO.userModifyGameScreenShots(gameId, screenshots);
		String redirStr = "redirect:viewGameDetails.do?id=" + gameId;
		return redirStr;
	}

	// ------------- END of UserController file ----------------\\
}
