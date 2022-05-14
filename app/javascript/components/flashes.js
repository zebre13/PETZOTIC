class Flashes {
  constructor(attributes) {
    this.container = attributes.container
    this.startTimeOut()
    this.hasTimeOut = true
    this.setBehavior()
  }

  setBehavior() {
    this.container.addEventListener('mouseover', () => {
      this.stopTimeout()
    })
    this.container.addEventListener('mouseleave', () => {
      this.startTimeOut()
    })
  }

  stopTimeout() {
    this.hasTimeOut = false
    clearTimeout(this.timeout)
  }

  remove() {
    console.log('add class')
    this.container.classList.add('opacity-0')
    setTimeout(() => {
      this.container.remove()
    }, 1000);
  }

  startTimeOut() {
    if (this.hasTimeOut) { return }

    this.hasTimeOut = true
    this.timeout = setTimeout(() => {
      this.remove()
    }, 3000);
  }
}

const flashesFadeOut = () => {
  const flashesContainer = document.querySelector('.flashes-container')

  if (flashesContainer) {
    new Flashes({container: flashesContainer})
  }
};

export { flashesFadeOut };
