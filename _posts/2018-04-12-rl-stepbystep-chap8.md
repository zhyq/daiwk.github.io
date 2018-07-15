---
layout: post
category: "rl"
title: "深入浅出强化学习-chap8 基于置信域策略搜索的强化学习方法"
tags: [深入浅出强化学习, DPG, DDPG, AC, A3C]
---

目录

<!-- TOC -->

- [1. 理论基础](#1-%E7%90%86%E8%AE%BA%E5%9F%BA%E7%A1%80)

<!-- /TOC -->


参考**《深入浅出强化学习》**

## 1. 理论基础

策略梯度方法的参数更新公式为：

`\[
\theta_{new}=\theta_{old}+\alpha \triangledown_{\theta}J
\]`

策略梯度方法最大的问题是步长的选取问题，如果步长太长，策略很容易发散；如果步长太短，收敛速度很慢。

合适的步长`\(\alpha\)`指的是当策略更新后，回报函数的值不能更差。因些TRPO要解决的就是如何找到新的策略，使得新的回报函数的值单调增长，或者单调不减。

用`\(\tau\)`表示一组状态行为序列`\(s_0,u_0,...,s_H,u_H\)`，强化学习的回报函数为：

`\[
\eta (\tilde{\pi})=E_{\tau|\tilde{\pi}}[\sum _{t=0}^{\infty }\gamma^t(r(s_t))]
\]`

其中，`\(\tilde{\pi}\)`表示策略。如何找到新策略，使回报函数单调不减呢？一个自然想法就是把新策略对应的回报函数分解成旧策略对应的回报函数，加上其他项。保证这个其他项大于等于0就行了。2002年Sham Kakade就提出了这么一个等式：

`\[
\eta (\tilde{\pi})=\eta (\pi)+E_{s_0,a_0,...\sim \tilde{\pi}}[\sum _{t=0}^{\infty }\gamma^t(A_{\pi}(s_t,a_t))]  
\]`

其中`\(\pi\)`表示旧策略，`\(\tilde(\pi)\)`表示新策略。其中的`\(A_{\pi}(s,a)\)`是优势函数。

`\[
A_{\pi}(s,a)=Q_\pi(s,a)-V_\pi(s)=E_{s'\sim P(s'|s,a)}[r(s)+\gamma V^{\pi}(s')-V^{\pi}(s)]
\]`

因为`\(V_\pi(s)=\sum _i\pi(a_i|s)Q_{\pi}(s,a_i)\)`，也就是说值函数`\(V(s)\)`可以理解为该状态`\(s\)`下，所有可能动作所对应的动作值函数`\(Q_{\pi}(s,a_i)\)`与采取该动作的概率`\(\pi(a_i|s)\)`的乘积之和，相当于是该状态下所有动作的值函数的平均。而`\(Q_{\pi}(s,a)\)`是单个动作所对应的值函数，所以所谓的优势就是当前动作值函数 对于平均值函数的优势。

然后。。好复杂
