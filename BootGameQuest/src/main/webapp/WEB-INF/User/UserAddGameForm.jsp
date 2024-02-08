<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <title>Add new game</title>
    <style>
      .game-form {
        max-width: 600px;
        margin-top: 54px;
      }
      .btn-muted {
        background-color: lightgray;
      }
    </style>
  </head>
  <body>
  		<header>
			<jsp:include page="../nav.jsp" />
		</header>
    <main>
      <div class="container game-form">
        <form action="userAddGameConfirm.do" method="POST">
          <div class="row my-2">
            <div class="col text-center">
              <h1>Adding a new game</h1>
            </div>
          </div>

          <hr />

          <div class="row mb-2">
            <div class="col-1"></div>
            <div class="col-10 text-center">
              <div>
                <h3 id="game-title-display">${title}</h3>
              </div>
              <div>
                <img src="" height="300px" id="game-avatar-image" />
              </div>

              <div>
                <label for="game-avatar-url" class="form-label"
                  >Game title</label
                >
                <input
                  type="text"
                  class="form-control text-center"
                  id="game-title-input"
                  name="title"
                  value="${title}"
                  required
                />
              </div>

              <div>
                <label for="game-avatar-image-url" class="form-label"
                  >Game avatar</label
                >
                <input
                  type="text"
                  class="form-control text-center"
                  id="game-avatar-image-url"
                  name="avatarUrl"
                  required
                />
              </div>
            </div>
            <div class="col-1"></div>
          </div>

          <hr />

          <div class="row mb-2">
            <div class="col-1"></div>
            <div class="col-10 text-center">
              <div>
                <label class="form-label">Trailer</label>
                <input
                  type="text"
                  class="form-control text-center"
                  name="trailerUrl"
                  required
                />
              </div>

              <div>
                <label class="form-label">Description</label>

                <textarea
                  class="form-control"
                  name="description"
                  rows="5"
                  required
                >
                </textarea>
              </div>
            </div>
            <div class="col-1"></div>
          </div>

          <hr />
          
           <div class="row my-2">
            <div class="col text-center">
              <h5>Game screenshots</h5>
            </div>
          </div>

          <!-- Screenshots -->
          <div id="screenshots">
            <article>
              <div class="row my-2 single-screenshot">
                <div class="col-1"></div>
                <div class="col-3">
                  <img
                    src="https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg"
                    class="single-screenshot-image"
                    width="100px"
                    height="100px"
                  />
                </div>
                <div class="col-7">
                  <label for="game-avatar-url" class="form-label"
                    >Screenshot URL</label
                  >
                  <input
                    type="text"
                    class="form-control single-screenshot-input"
                    name="screenshots[]"
                    required
                  />
                </div>

                <div class="col-1"></div>
              </div>
            </article>
          </div>
          <!-- Screenshots -->

          <!-- Screenshot control button -->
          <div class="row my-2">
            <div class="col-1"></div>
            <div class="col-5 text-start">
              <p class="btn btn-success" id="add-screenshot">
                (+)Add Screenshot
              </p>
            </div>
            <div class="col-5 text-end">
              <p class="btn btn-muted" id="remove-screenshot">
                (-)Remove Screenshot
              </p>
            </div>
            <div class="col-1"></div>
          </div>
          <!-- Screenshot control button -->

          <hr />

          <!-- Form submisison/cancel buttons -->
          <div class="row my-2">
            <div class="col-6 text-start">
              <button type="submit" class="btn btn-primary">Confirm</button>
            </div>
            <div class="col-6 text-end">
              <a href="viewUserGameList.do" class="btn btn-primary">Cancel</a>
            </div>
          </div>
        </form>
      </div>
    </main>

    <script>
      // controlling game avatar and images
      const titleInput = document.getElementById("game-title-input");
      const titleDisplay = document.getElementById("game-title-display");
      titleInput.addEventListener("input", (e) => {
        titleDisplay.innerText = e.target.value;
      });

      const gameImageURL = document.getElementById("game-avatar-image-url");
      const gameImage = document.getElementById("game-avatar-image");
      if (gameImage.getAttribute("src") == "") {
        gameImage.setAttribute(
          "src",
          "https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg"
        );
      }
      gameImageURL.addEventListener("input", (e) => {
        gameImage.setAttribute("src", e.target.value);
        if (gameImage.getAttribute("src") == "") {
          gameImage.setAttribute(
            "src",
            "https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg"
          );
        }
      });

      // controlling the gamescreenshots
      const screenshotDiv = document.getElementById("screenshots");
      const addScreenshotBtn = document.getElementById("add-screenshot");
      const removeScreenshotBtn = document.getElementById("remove-screenshot");
      addScreenshotBtn.addEventListener("click", addScreenshot);
      removeScreenshotBtn.addEventListener("click", removeScreenshot);

      // initial setup
      let screenshotImage = document.getElementsByClassName(
        "single-screenshot-image"
      );
      let screenshotInput = document.getElementsByClassName(
        "single-screenshot-input"
      );

      for (let i = 0; i < screenshotImage.length; i++) {
        screenshotInput[i].addEventListener("input", (e) => {
          screenshotImage[i].setAttribute("src", e.target.value);
          if (screenshotImage[i].getAttribute("src") == "") {
            screenshotImage[i].setAttribute(
              "src",
              "https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg"
            );
          }
        });
      }

      // controlling game screenshot function
      function addScreenshot() {
        let newArticle = document.createElement("article");
        const elementContent = `<div class="row my-2 single-screenshot">
                <div class="col-1"></div>
                <div class="col-3">
                  <img
                    src="https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg"
                    class="single-screenshot-image"
                    width="100px"
                    height="100px"
                  />
                </div>
                <div class="col-7">
                  <label for="game-avatar-url" class="form-label"
                    >Screenshot URL</label
                  >
                  <input
                    type="text"
                    class="form-control single-screenshot-input"
                    name="screenshots[]"
                    required
                  />
                </div>

                <div class="col-1"></div>
              </div>`;
        newArticle.insertAdjacentHTML("beforeend", elementContent);
        screenshotDiv.append(newArticle);
        // change color of the remove screenshot button
        removeScreenshotBtn.classList.remove("btn-muted");
        removeScreenshotBtn.classList.add("btn-success");

        // requery all screenschot inputs and images
        screenshotImage = document.getElementsByClassName(
          "single-screenshot-image"
        );
        screenshotInput = document.getElementsByClassName(
          "single-screenshot-input"
        );

        for (let i = 0; i < screenshotImage.length; i++) {
          screenshotInput[i].addEventListener("input", (e) => {
            screenshotImage[i].setAttribute("src", e.target.value);
            if (screenshotImage[i].getAttribute("src") == "") {
              screenshotImage[i].setAttribute(
                "src",
                "https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg"
              );
            }
          });
        }
      }
      function removeScreenshot() {
        let screenshotArticles = screenshotDiv.getElementsByTagName("article");
        if (screenshotArticles.length > 1) {
          screenshotDiv.removeChild(
            screenshotArticles[screenshotArticles.length - 1]
          );
        }
        if (screenshotArticles.length == 1) {
          removeScreenshotBtn.classList.remove("btn-success");
          removeScreenshotBtn.classList.add("btn-muted");
        }
      }
    </script>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
