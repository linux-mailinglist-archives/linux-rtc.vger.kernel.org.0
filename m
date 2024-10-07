Return-Path: <linux-rtc+bounces-2106-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C76993A82
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2024 00:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54BC51C23284
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Oct 2024 22:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807D318CC12;
	Mon,  7 Oct 2024 22:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eWPIclJ7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4FF17279E;
	Mon,  7 Oct 2024 22:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728341000; cv=none; b=iQXpnrv7UNBnlwvNSONdFBqz4u8U6sTFxIKfGiXtx79qOQXVy9gqthV3zxmvP4EZHlHRgraOCmpDpM5DhWzlDu5+c2zf+HD8i0sMQNsCBeWFy9z6b5LnQ+K3kxxEOePk86mvi+JDoAmEa1Z94qP0ADgw2/zGBgIC+l3PxwmfLZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728341000; c=relaxed/simple;
	bh=ULJNkUi3nWPA/nIXK1IrKcjvPDnqlFUo5yXcBFj4uAQ=;
	h=Message-Id:From:Subject:Date:To:Cc; b=uGahLYLD617M25k+m8tjM1kVNyhL7Jw/BChaW8ZdqH/EaJIGqqNWeyFKBLgvnLJ0EjebY+fi9VzyrBg7oW89EVMSbfPyt0Y6Uq7eAfIBGtUx24m2UWm5jIOvEwEsvSIyIao55CVVKo0PQs/LB7GZL39woEHUcHPSE7R0tnN2I64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eWPIclJ7; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4E4101140155;
	Mon,  7 Oct 2024 18:43:17 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 07 Oct 2024 18:43:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1728340997; x=1728427397; bh=PSbighUzhdllJ
	PAPWW22AFgW90piD0NXx5zzmIwwePY=; b=eWPIclJ7vq+6uXi9K7peN0wrGAxgh
	O5m/lE7mtm6yMe1oUpOnF6CA3g9acrcJVyRyC/NgmnMbZlISRXyEZvBVzqipP9MA
	Iic5K3jLaMsJXmAhWVAm42Q5gLJR5hKx9Wpm7CZtxoJYlc7/S7hHPx6EVuyMcMBG
	iJh8oWLpH6fiD9bgsfRNvDHUleIECChAHjNj2b4Qg4VxNa3mLnp+Yzy6judtxY7D
	grYc3w3wzgyXkEzLzMRLkRm4sZqTcZ7tOsrXfwjtT7gzC2947DReOpk5exk2HA/x
	PXApqm1AIaYsooTj8cZ/X8B/aZQP9C7w6yYahOI9IppDVG3RbDEXgHlWQ==
X-ME-Sender: <xms:BGQEZ3DvCztAM_Winef_PRp8riKn1UvE15cL8nWOuMckpv4VbTyVsw>
    <xme:BGQEZ9iuaQD1FTDX1KnSRAKHcLSCWCjysKUXqjVr2YeHNtsVLZKQQqZn3iAIjb0VE
    KJGXvHTbUBDAaqCswo>
X-ME-Received: <xmr:BGQEZynalZZ8Rv6_SmyHF0gGKKD0R3baHk7UyaEedeljQ_aKGCRtJme5EqfwYTo2z9Bb58k2v8peNUKrVAqmv8py9RdOIqxHqPU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeftddgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepkffhufffvfevsedttdertddttddtnecuhfhrohhm
    pefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqe
    enucggtffrrghtthgvrhhnpeehffdukeetffdutedvffffheegtdetkeekfeevgfeitefh
    vedvtdelhfduudettdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphht
    thhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlvgigrghnughrvg
    drsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvrghs
    sehgrghishhlvghrrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfth
    drnhgvthdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgt
    phhtthhopegurghnihgvlhestdigtdhfrdgtohhmpdhrtghpthhtohepphgrvhhonhgvse
    hrvghtrhhouggvvhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkheslhhish
    htshdrlhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhttges
    vhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:BGQEZ5wlfrA9yetGxYaygMmOiLsmjnRKywrptNSZquqnSMC41RmF9A>
    <xmx:BGQEZ8Tvk6s1Z_kWuCLVCyoAZcNlVyf6V3LW2kGw7V6DaWq-v7JCpw>
    <xmx:BGQEZ8bK_Xgx9lCEzr5NLMYfl2rKsYaH5xChjw5XH0pk3K_BoRICvg>
    <xmx:BGQEZ9TLYp38ZENRM59shdG6lSkyBcD0m8bn3ppbVhwZkodRlQswqA>
    <xmx:BWQEZ1_lF3QKNqDAYPy6NVEh-n451HIxisdgDAD4rukNHSX8bMYCE6bf>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Oct 2024 18:43:13 -0400 (EDT)
Message-Id: <cover.1728340717.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v2 0/2] MVME: Adopt standard RTC driver
Date: Tue, 08 Oct 2024 09:38:37 +1100
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
    Andreas Larsson <andreas@gaisler.com>,
    "David S. Miller" <davem@davemloft.net>,
    Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>,
    Michael Pavone <pavone@retrodev.com>,
    linux-kernel@vger.kernel.org,
    linux-m68k@lists.linux-m68k.org,
    linux-rtc@vger.kernel.org,
    sparclinux@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

This series removes some duplicated RTC driver code.
First rtc-m48t59 is tweaked to bring it into equivalence with the RTC
drivers in arch/m68k/mvme*. Then platform devices are added for the
former driver and the latter drivers are removed.

---
Changed since v1:
 - Instead of adding ifdefs to the portable driver, store the year offset
   in struct m48t59_plat_data.


Finn Thain (2):
  rtc: m48t59: Use platform_data struct for year offset value
  m68k: mvme147, mvme16x: Adopt rtc-m48t59 platform driver

 arch/m68k/configs/multi_defconfig   |   1 +
 arch/m68k/configs/mvme147_defconfig |   1 +
 arch/m68k/configs/mvme16x_defconfig |   1 +
 arch/m68k/include/asm/mvme147hw.h   |  19 +---
 arch/m68k/include/asm/mvme16xhw.h   |  18 +--
 arch/m68k/mvme147/config.c          |  55 ++++------
 arch/m68k/mvme16x/Makefile          |   2 +-
 arch/m68k/mvme16x/config.c          |  57 ++++------
 arch/m68k/mvme16x/rtc.c             | 165 ----------------------------
 arch/sparc/kernel/time_32.c         |   1 +
 arch/sparc/kernel/time_64.c         |   1 +
 drivers/rtc/rtc-m48t59.c            |  26 +----
 include/linux/rtc/m48t59.h          |   3 +
 13 files changed, 63 insertions(+), 287 deletions(-)
 delete mode 100644 arch/m68k/mvme16x/rtc.c

-- 
2.39.5


