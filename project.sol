// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Interface for ERC20 token, for rewards
interface IERC20 {
    function transfer(address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract LearnToEarn {
    address public owner;
    IERC20 public rewardToken;  // The ERC20 token used for rewards

    struct Lesson {
        uint256 lessonId;
        string lessonTitle;
        uint256 rewardAmount; // How much reward is given for completing the lesson
        bool isCompleted;
    }

    mapping(address => uint256[]) public userCompletedLessons; // Mapping to track lessons completed by each user
    mapping(uint256 => Lesson) public lessons; // Mapping for lessons by lessonId

    uint256 public nextLessonId = 1;

    event LessonCompleted(address indexed user, uint256 lessonId);
    event RewardIssued(address indexed user, uint256 rewardAmount);
    event NewLessonCreated(uint256 lessonId, string lessonTitle, uint256 rewardAmount);

    constructor(address _rewardToken) {
        owner = msg.sender;
        rewardToken = IERC20(_rewardToken);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    // Function to create a new lesson
    function createLesson(string memory _lessonTitle, uint256 _rewardAmount) public onlyOwner {
        uint256 lessonId = nextLessonId;
        lessons[lessonId] = Lesson({
            lessonId: lessonId,
            lessonTitle: _lessonTitle,
            rewardAmount: _rewardAmount,
            isCompleted: false
        });
        nextLessonId++;

        emit NewLessonCreated(lessonId, _lessonTitle, _rewardAmount);
    }

    // Function to complete a lesson and earn reward
    function completeLesson(uint256 _lessonId) public {
        Lesson storage lesson = lessons[_lessonId];
        require(!lesson.isCompleted, "Lesson already completed");
        
        // Mark the lesson as completed
        lesson.isCompleted = true;

        // Store the lesson in the user's completed lessons list
        userCompletedLessons[msg.sender].push(_lessonId);

        // Issue reward to the user
        uint256 rewardAmount = lesson.rewardAmount;
        require(rewardToken.transfer(msg.sender, rewardAmount), "Reward transfer failed");

        emit LessonCompleted(msg.sender, _lessonId);
        emit RewardIssued(msg.sender, rewardAmount);
    }

    // View function to get the lessons completed by a user
    function getCompletedLessons(address user) public view returns (uint256[] memory) {
        return userCompletedLessons[user];
    }

    // Function to withdraw rewards (only for the contract owner, e.g., admin)
    function withdrawTokens(uint256 amount) public onlyOwner {
        require(rewardToken.transfer(owner, amount), "Withdrawal failed");
    }

    // Function to get contract balance
    function getContractBalance() public view returns (uint256) {
        return rewardToken.balanceOf(address(this));
    }
}

