Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F923327587
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Mar 2021 01:17:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbhCAARW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 28 Feb 2021 19:17:22 -0500
Received: from mail2.directv.syn-alias.com ([69.168.106.50]:57157 "EHLO
        mail.directv.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbhCAARV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 28 Feb 2021 19:17:21 -0500
DKIM-Signature: v=1; a=rsa-sha1; d=wildblue.net; s=20170921; c=relaxed/simple;
        q=dns/txt; i=@wildblue.net; t=1614557800;
        h=From:Subject:Date:To:MIME-Version:Content-Type;
        bh=7yYjwReveVoRzIq2Gybu70sAvDk=;
        b=h00++U5jMKNPY7CiXYcLThVH+RsbV99SNFDlo/qeJIYQxA8EvEBWM5/Gy2kQLof4
        R3VqPT5tVf8vL1/EBy/Z+prxtIVEH7jQDHjRsTeNaVFWkjRMTzma5XUvyd+MGias
        BKXeHzU4YchMCMBG6GYe9Bm2+Tr24dEATxsP60TEhnwIW0X4FocM8QqhLFhoSieZ
        4plJT8BhNI/tqrtFByo0Jfro3fvU0rF18moGOFhttOoYP0EH4yLd6gp+WdIx2YOa
        DzoD/o2qlby4BOGEp0y6bRSFF2fzlQp52ABRMFqFALwef7paHQfFCVl3/MkE5dj1
        X5I0eobY6g1AI8qD0C2xJA==;
X_CMAE_Category: , ,
X-CNFS-Analysis: v=2.4 cv=Nf0ja0P4 c=1 sm=1 tr=0 ts=603c3267 cx=a_idp_x a=4yk97B3yQiU+fkK3asfMng==:117 a=9cW_t1CCXrUA:10 a=KGjhK52YXX0A:10 a=FKkrIqjQGGEA:10 a=DXKWVhTAvk4A:10 a=abzAvUUYLsoA:10 a=IkcTkHD0fZMA:10 a=qa6Q16uM49sA:10 a=A3tKBufkE8oA:10 a=_6YHSrkmuJwA:10 a=x7bEGLp0ZPQA:10 a=oTdODRIx186aHW-dcMcA:9 a=QEXdDO2ut3YA:10 a=xo5jKAKm-U-Zyk2_beg_:22 a=bp8DXupwIspzZ62Q3bmY:22 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-CM-Score: 0
X-Scanned-by: Cloudmark Authority Engine
X-Authed-Username: amFtZXNrbmlnaHRAd2lsZGJsdWUubmV0
Received: from [10.80.118.1] ([10.80.118.1:44186] helo=md06.jasper.bos.sync.lan)
        by mail2.directv.syn-alias.com (envelope-from <jamesknight@wildblue.net>)
        (ecelerity 3.6.25.56547 r(Core:3.6.25.0)) with ESMTP
        id 64/9A-18220-6623C306; Sun, 28 Feb 2021 19:16:39 -0500
Date:   Sun, 28 Feb 2021 19:16:38 -0500 (EST)
From:   Rowell <jamesknight@wildblue.net>
Reply-To: rowellhamb019@gmail.com
Message-ID: <1357653431.27457886.1614557798788.JavaMail.zimbra@wildblue.net>
Subject: 
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [193.148.19.3]
X-Mailer: Zimbra 8.7.6_GA_1776 (zclient/8.7.6_GA_1776)
Thread-Index: r+qeZjfM3dj7LPUmxX/dDsRpqx3paw==
Thread-Topic: 
X-Vade-Verditct: spam:high
X-Vade-Analysis: gggruggvucftvghtrhhoucdtuddrgeduledrleejgddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfujgfpteevqfftpdggkfetufetvfdpqfgfvfenuceurghilhhouhhtmecufedtudenucgohfhorhgsihguuggvnhfjughrucdlhedttddmnecujfgurhepfffhrhfkufggtgfgihfothesthejtgdtredtjeenucfhrhhomheptfhofigvlhhluccuoehjrghmvghskhhnihhghhhtseifihhluggslhhuvgdrnhgvtheqnecuggftrfgrthhtvghrnhepvdeiudffveeggeeuueffieefudejgfefjeelhffgtdeuvddugfelfedvgefhtddunecukfhppedutddrkedtrdduudekrddupdduleefrddugeekrdduledrfeenucfhohhrsghiugguvghnjfgurhepfffhrhfkufggtgfgihfothesthejtgdtredtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutddrkedtrdduudekrddunedpmhgrihhlfhhrohhmpehjrghmvghskhhnihhghhhtseifihhluggslhhuvgdrnhgvthenpdhrtghpthhtoheplhhiphgvnhhglhgvihduleelgedtgedtudeshhhothhmrghilhdrtghomhen
X-Vade-Client: VIASAT
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Do you get my previous mail.
