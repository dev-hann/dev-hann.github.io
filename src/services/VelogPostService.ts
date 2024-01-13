import axios from "axios";
import { VelogPost } from "../models/VelogPost";

const velog_url = "https://v2cdn.velog.io/graphql";

export const VerlogPostService = {
  async getPostList(): Promise<Array<VelogPost>> {
    try {
      const response = await axios.post(velog_url, {
        operationName: "Posts",
        variables: { username: "dev-hann", tag: null },
        query:
          "query Posts($cursor: ID, $username: String, $temp_only: Boolean, $tag: String, $limit: Int) {\n  posts(cursor: $cursor, username: $username, temp_only: $temp_only, tag: $tag, limit: $limit) {\n    id\n    title\n    short_description\n    thumbnail\n    user {\n      id\n      username\n      profile {\n        id\n        thumbnail\n        __typename\n      }\n      __typename\n    }\n    url_slug\n    released_at\n    updated_at\n    comments_count\n    tags\n    is_private\n    likes\n    __typename\n  }\n}\n",
      });
      var dataList = Array.from<any>(response.data["data"]["posts"]);
      return dataList.map((post) => {
        return new VelogPost(
          post.id,
          post.title,
          post.short_description,
          post.thumbnail,
          post.tags
        );
      });
    } catch (error) {
      console.error("Error fetching data:", error);
      throw error;
    }
  },
};
