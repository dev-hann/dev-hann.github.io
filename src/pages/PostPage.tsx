import { useEffect, useState } from "react";
import { VerlogPostService } from "../services/VelogPostService";
import { VelogPost } from "../models/VelogPost";
import PostCard from "../components/post/PostCard";
export default function PostPage() {
  const [data, setData] = useState(Array<VelogPost>());
  useEffect(() => {
    // 컴포넌트가 마운트되면 fetchData를 호출하여 데이터를 가져옴
    const fetchDataFromServer = async () => {
      try {
        const result = await VerlogPostService.getPostList();
        setData(result);
      } catch (error) {
        // 에러 처리
      }
    };

    fetchDataFromServer();
  }); // 빈 배열을 전달하여 한 번만 실행되도록 설정

  return (
    <div>
      <h1>Server Data:</h1>
      {data ? <ul>{data.map((post) => PostCard(post))}</ul> : <p>Loading...</p>}
    </div>
  );
}
