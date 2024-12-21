# Learn-to-Earn Platform

## Project Title
**Learn-to-Earn**

## Project Description
**Learn-to-Earn** is a decentralized platform that allows users to earn rewards for completing educational lessons. Built on Ethereum, the platform uses smart contracts to reward users with ERC-20 tokens once they complete lessons. Admins can create lessons, define rewards, and track progress, while users can learn and earn simultaneously. The goal is to create an engaging educational experience by incentivizing users to learn and participate actively.

## Contract Address
0xCAc046395C0C8dB36690A9e48EB7500a6b59E935
![image](https://github.com/user-attachments/assets/0ae4bf8e-294b-4cd7-a925-d6d8f8fa55f8)


## Project Vision
The vision of the **Learn-to-Earn** platform is to provide an incentivized learning environment where users can earn rewards for their educational efforts. It aims to:

1. **Incentivize Learning**: Offer financial rewards for completing lessons, making education engaging and motivating.
2. **Decentralize Education**: Empower creators and learners by removing intermediaries, making educational content globally accessible.
3. **Transparency**: Provide transparency and trust through blockchain technology, ensuring all interactions (lesson completion, rewards) are verifiable.
4. **Financial Inclusion**: Provide users with the opportunity to earn rewards in the form of ERC-20 tokens, which could have utility or be converted to other digital assets.

## Key Features

### 1. **Lesson Creation by Admin**
   - Admins can create lessons by specifying the title and reward amount (ERC-20 tokens) for each lesson.
   - Each lesson has a unique identifier (`lessonId`) to ensure easy tracking.

### 2. **Reward System**
   - Once a user completes a lesson, they earn ERC-20 tokens as a reward. The reward amount is determined when the lesson is created.

### 3. **Tracking Completed Lessons**
   - Users can view their completed lessons and track their learning progress with the `getCompletedLessons` function.
   
### 4. **Admin-Only Token Withdrawal**
   - The contract owner can withdraw tokens from the contract using the `withdrawTokens` function. This feature ensures that only authorized parties can manage the contract's funds.

### 5. **ERC-20 Token Integration**
   - The platform is compatible with any ERC-20 token. The contract owner specifies the ERC-20 token address during deployment.

### 6. **Contract Transparency**
   - All lesson creation, completion, and reward distribution are logged on the blockchain, ensuring transparency and accountability.
   - The `getContractBalance` function allows anyone to view the available balance of ERC-20 tokens in the contract.

## Future Enhancements

- **User Feedback & Ratings**: Implement a rating system for lessons, enabling users to provide feedback to improve content.
- **Course Bundles**: Group related lessons into bundles and offer additional rewards for completing a full course.
- **Leaderboards**: Introduce gamification with leaderboards, where the most active users can earn additional rewards.
- **Governance**: Enable decentralized governance, allowing token holders to vote on platform changes, such as reward adjustments or lesson creation rules.


