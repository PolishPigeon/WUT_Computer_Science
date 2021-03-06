import Blog from "../blog/blog";
import React from "react";
export default function Blogs({entries}) {
    return (
        <div class="d-flex flex-column align-items-center">
        {entries.map(entry=>(
            <Blog entry={entry} />
        ))}
        </div>
        )
}