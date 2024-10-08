Return-Path: <linux-rtc+bounces-2114-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE5A994323
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2024 11:00:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 423EA1F222D6
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2024 09:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486671DF240;
	Tue,  8 Oct 2024 08:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DcKNumer"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A89F1D0E03;
	Tue,  8 Oct 2024 08:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728377691; cv=none; b=VUfI/1H5sbcoPu2CWaDcz+qwp+udFI+poIaR5Jkl4nhPS8P50tqyJOhv37SZNrekZ+q+PW3v4mJIze7/PlEwutsQjYtsmq82yvgUrUMloL06uMPupNqt64jEh99KGG9ahz7/lHWdN/yGDJPBXWxsc26PqOwRCdzf1IIG3WqWPR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728377691; c=relaxed/simple;
	bh=JQkIN8TayZbr/lTiOwQgXiZiNKYnpSMdNAPtyLcRj8M=;
	h=Message-Id:From:Subject:Date:To:Cc; b=Ims+oWLxfkrIlhHbV5dfTb9ivEKKqnYfCHfBUIDb1k5Sor30SUvB80P8OHeh8dpsfSfpQY6+MljXWBcNx5daMYVkYmexSq2JpZ4+pHZFodoupPyDJrOJxYM+4W7/LAR5bcGuuffLADGGetgjKHKpg7qfGfUZw8/XCe4lv6oX4Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DcKNumer; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 7097013806CF;
	Tue,  8 Oct 2024 04:54:48 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 08 Oct 2024 04:54:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1728377688; x=1728464088; bh=9medauMNxWIqa
	8/HpyM1TF3FAfSfmRLq9EEaFHlyElY=; b=DcKNumerhTMp4ogxe4CqjwCXdirnK
	+4UxPquS+FeVN7gyZaWLjidvjOUfPepJsusOPfzY/ocnMs1whEJN1kHAs/VXcQRu
	YutxXdT7D0/u9W7V0gNJJaIWiZa5W3ppVgMiV7LBOf+qUhPHnqA+/lk8v1WUZNpB
	gbSJxEvj/6k8z/zHv4iYn2QF7HsyUCJBw/6D+FxJQpZqDyMW61iezdEFGMWh+83i
	XOJX549piFvHksTDUOgSLzApYOTrm6gLFSbXH7b4/ViT8qPWQ0qbh8H41vbX/EpI
	ZHVYpPGB85Wo4TwbuZv0NIhT7Zepumr0nvwwysVEFuCNS8uCLbzmzIvXA==
X-ME-Sender: <xms:VvMEZ7GiWtMdrrYENwe2nazaZBVxKMfse5gLvEhv0dQWRVsjZ-gCNA>
    <xme:VvMEZ4Vn5Cy5Kai57rcDYiSfdOwtASuMMv8oMYC2FIQKeGQIVshqeBqlNvRwCOdfq
    D6ma6aWkg4ESsz3Mg8>
X-ME-Received: <xmr:VvMEZ9LpPQ5JQJ6YoxZjpCQLkdUMVe3vcV1O4LUD4usGgFq9hsww6YpOB0aLBkPOA7ZK--n5s2dx1NM8FNNj7fExKI2Yshw9W7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefuddgtdelucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:VvMEZ5Gm6p5ezwuiNO0YjKJ1SLEkW1jzlzPM3utlM8eq-CNOrFR19w>
    <xmx:VvMEZxX2fgPafSDJgue4LMV3_SW6Da1n429UHWk2oelxNJGHUF8BqA>
    <xmx:VvMEZ0NBaCACObNjAZhQ7V3isUsSFj6FAbQmktjFWBTpvHpyQF43PA>
    <xmx:VvMEZw2NZy2EUla199aaqIwUmAswo15HaI1vo_oXKDQ13SygBBQ8kQ>
    <xmx:WPMEZ5SNqiUqMwmgxDejKy1TotN_aWGqm33_3k9oOzbnQoWRJ6_pL9Mo>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Oct 2024 04:54:44 -0400 (EDT)
Message-Id: <cover.1728377511.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v3 0/2] MVME: Adopt standard RTC driver
Date: Tue, 08 Oct 2024 19:51:51 +1100
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

Changed since v2:
 - Use an int for the year offset in struct m48t59_plat_data.


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


