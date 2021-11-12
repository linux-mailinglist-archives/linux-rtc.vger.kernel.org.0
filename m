Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34FC244EE03
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Nov 2021 21:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235616AbhKLUpF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 12 Nov 2021 15:45:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:52660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235620AbhKLUpE (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 12 Nov 2021 15:45:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 50D3D604D7;
        Fri, 12 Nov 2021 20:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636749733;
        bh=7n6+6LAMHvjNzoeN5EGCUejmgr+h38crSQIm2ehEyiw=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=u+rYc4d+jRXs3vyPOq01CDYL/AWhOtPuTgXnydTE9E9b1KrFxPq3QvTR5+b8Gy0Rb
         /GPRhVD105JT6EIfnHKPPmeFzNzdfKeR/vJE9iYS2Rd/IVYd66iQL/xUjZWzdMJWAd
         kibmYBAFWjXGdvw1DYO2KwCx8ZFCxy635H3jt9hbKkE30H5F8nOZioEEP4kWyQuILQ
         oXeilNxe5ss2xLxr9UYNLJWoWZJmafiHBAzYXmokxQVlkhL1W8juaS+bfdaHHD0urD
         zKU0U8CKAX64DlcDlho0A112gEnXnzIMwAtgm2j09O+DfUKhnFa5bcVV8fXzqaO+yF
         F1bzRHmLtdNhA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4A007608FE;
        Fri, 12 Nov 2021 20:42:13 +0000 (UTC)
Subject: Re: [GIT PULL] RTC for 5.16
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YY2fDo+B4GfFWjn5@piout.net>
References: <YY2fDo+B4GfFWjn5@piout.net>
X-PR-Tracked-List-Id: <linux-rtc.vger.kernel.org>
X-PR-Tracked-Message-Id: <YY2fDo+B4GfFWjn5@piout.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.16
X-PR-Tracked-Commit-Id: b476266f063e680039be1541cfde5f5cee400da3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3b81bf78b7338bcc66581593e604e95addc546cc
Message-Id: <163674973329.4802.11686374602155650762.pr-tracker-bot@kernel.org>
Date:   Fri, 12 Nov 2021 20:42:13 +0000
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The pull request you sent on Thu, 11 Nov 2021 23:54:06 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3b81bf78b7338bcc66581593e604e95addc546cc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
