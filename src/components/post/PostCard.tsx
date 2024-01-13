import { VelogPost } from "../../models/VelogPost";

export default function PostCard(post: VelogPost) {
  return (
    <div>
      <img src={post.thumbnail_url} alt="" />
      <div>{post.title}</div>
      <div>{post.desc}</div>
      <div> {post.tag_list} </div>
    </div>
  );
}
