Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 702D2314541
	for <lists+linux-rtc@lfdr.de>; Tue,  9 Feb 2021 02:08:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbhBIBHY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 8 Feb 2021 20:07:24 -0500
Received: from mail2.directv.syn-alias.com ([69.168.106.50]:29832 "EHLO
        mail.directv.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbhBIBHX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 8 Feb 2021 20:07:23 -0500
DKIM-Signature: v=1; a=rsa-sha1; d=wildblue.net; s=20170921; c=relaxed/simple;
        q=dns/txt; i=@wildblue.net; t=1612832801;
        h=From:Subject:Date:To:MIME-Version:Content-Type;
        bh=e50BNIa8q6E9T9tu5BM00rccoE8=;
        b=qpslmyh3JGZskvlw4QuxV0Eq0v0gxK9jbnRbnDyjflada2pjBPTJa5GBUi6leQJx
        RoPGlCC5CN3YxKEnWljlRYXun5AGPUKzbffGivDzidHDUxYB/wrcfw/5kfpzbD/Y
        a8kBM3qpy3fQB0RDWPVSu35mLIAThOM6K1A6yhUdlCP4cL4AhxyCbc+sXq68czW2
        vzb2VWBwY1JZLJR1Tmk+I1jbr+wUPy/1ila7MOnf1YuHhqoGAd+wVboQMN2cy9nu
        LxJ/N94If0YdAm41qq2gAlGhPYMS9JsxvWTSfzwkMRKH1hMzZvvK2aidn3IfDkeB
        EH4qvCkV0eYDpSxms2tRZw==;
X_CMAE_Category: , ,
X-CNFS-Analysis: v=2.4 cv=LKuj/La9 c=1 sm=1 tr=0 ts=6021e020 cx=a_idp_x a=B6W95MITV0ByR2FQuuDIMQ==:117 a=9cW_t1CCXrUA:10 a=KGjhK52YXX0A:10 a=FKkrIqjQGGEA:10 a=OGxnvhSY1EUA:10 a=r5oH8Fgm9fIA:10 a=IkcTkHD0fZMA:10 a=qa6Q16uM49sA:10 a=IbQgVbBq4bcA:10 a=4cdET6WwprQA:10 a=x7bEGLp0ZPQA:10 a=-xSE0sSnTIhhw0HgHx8A:9 a=QEXdDO2ut3YA:10 a=xo5jKAKm-U-Zyk2_beg_:22 a=kHmCYliWHlBROp4ktEDo:22 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-CM-Score: 0
X-Scanned-by: Cloudmark Authority Engine
X-Authed-Username: cG9tZXJveTI2QHdpbGRibHVlLm5ldA==
Received: from [10.80.118.8] ([10.80.118.8:49932] helo=md05.jasper.bos.sync.lan)
        by mail2.directv.syn-alias.com (envelope-from <pomeroy26@wildblue.net>)
        (ecelerity 3.6.25.56547 r(Core:3.6.25.0)) with ESMTP
        id 85/00-19783-020E1206; Mon, 08 Feb 2021 20:06:40 -0500
Date:   Mon, 8 Feb 2021 20:06:40 -0500 (EST)
From:   Rowell Hambrick <pomeroy26@wildblue.net>
Reply-To: rowellhambrick1@gmail.com
Message-ID: <449626739.15845919.1612832800410.JavaMail.zimbra@wildblue.net>
Subject: 
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.142.122.22]
X-Mailer: Zimbra 8.7.6_GA_1776 (zclient/8.7.6_GA_1776)
Thread-Index: 2KaYM2TiZfXYCrUiV04r/1Gxp0vllA==
Thread-Topic: 
X-Vade-Verditct: spam:high
X-Vade-Analysis: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdefudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfujgfpteevqfftnfgvrghrnhhinhhgpdggkfetufetvfdpqfgfvfenuceurghilhhouhhtmecufedtudenucgohfhorhgsihguuggvnhfjughrucdlhedttddmnecujfgurhepfffhrhfkufggtgfgihfothesthejtgdtredtjeenucfhrhhomheptfhofigvlhhlucfjrghmsghrihgtkhcuoehpohhmvghrohihvdeiseifihhluggslhhuvgdrnhgvtheqnecuggftrfgrthhtvghrnhepueeuuefhieeuuefhjeejteejfeefueelueeuheeuvefhvdegfefhheelteegvdeknecukfhppedutddrkedtrdduudekrdekpdelhedrudegvddruddvvddrvddvnecuhfhorhgsihguuggvnhfjughrpeffhfhrkffugggtgfhiofhtsehtjegttdertdejnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehinhgvthepuddtrdektddruddukedrkeenpdhmrghilhhfrhhomhepphhomhgvrhhohidvieesfihilhgusghluhgvrdhnvghtnedprhgtphhtthhopehlihhujhhirghnthgrohesvhhiphdrudeifedrtghomhen
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Do you get my email
