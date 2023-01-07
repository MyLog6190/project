let isDarkMode = localStorage.getItem('darkMode');
if(isDarkMode == null) {
	localStorage.setItem('darkMode', 'light');
}

document.querySelector(".dark-mode-switch").onclick = () => {
	isDarkMode = localStorage.getItem('darkMode');
	if(isDarkMode === 'light') {
		document.querySelector("body").classList.remove(isDarkMode);
		localStorage.setItem('darkMode', 'dark');
		isDarkMode = localStorage.getItem('darkMode');
		document.querySelector("body").classList.add(isDarkMode);
	}else {
		document.querySelector("body").classList.remove(isDarkMode);
		localStorage.setItem('darkMode', 'light');
		isDarkMode = localStorage.getItem('darkMode');
		document.querySelector("body").classList.add(isDarkMode);
	}
	
};