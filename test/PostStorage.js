const { expect } = require("chai");

describe("PostStorage", function () {
  let PostStorage, postStorage, user;

  beforeEach(async function () {
    [user] = await ethers.getSigners();
    PostStorage = await ethers.getContractFactory("PostStorage");
    postStorage = await PostStorage.deploy();
    await postStorage.deployed();
  });

  it("should create a post", async function () {
    await postStorage.connect(user).createPost("Hello DecentraPost!");
    const post = await postStorage.posts(1);
    expect(post.content).to.equal("Hello DecentraPost!");
  });

  it("should like a post", async function () {
    await postStorage.createPost("Web3 is future");
    await postStorage.likePost(1);
    const post = await postStorage.posts(1);
    expect(post.likes).to.equal(1);
  });
});
