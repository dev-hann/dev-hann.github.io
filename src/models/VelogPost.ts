export class VelogPost {
  constructor(
    id: string,
    title: string,
    desc: string,
    thumbnail_url: string,
    tag_list: Array<string>
  ) {
    this.id = id;
    this.title = title;
    this.desc = desc;
    this.thumbnail_url = thumbnail_url;
    this.tag_list = tag_list;
  }

  id: string = "";
  title: string = "";
  desc: string = "";
  thumbnail_url: string = "";
  tag_list: Array<string> = [];
}
