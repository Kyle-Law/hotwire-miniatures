import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ['entries','pagination']

  connect() {
    console.log("Hello Infinite Scroll!")
  }

  scroll(event){
    const next_page = this.paginationTarget.querySelector("a[rel='next']")
    if (next_page == null) { return }
    const url = `${next_page.href}.json`
    console.log(url)
    const body = document.body
    const html = document.documentElement

    const height = Math.max(body.scrollHeight,body.offsetHeight, html.clientHeight, html.offsetHeight)

    if (window.pageYOffset === height - window.innerHeight) {
      console.log('bottom')
      // this.loadMore(url)
    }
  }

  loadMore(url){
    console.log('loading more...')
    const data = fetch(url).then(res => res.json())
    console.log(data)
  }
}
