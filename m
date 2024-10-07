Return-Path: <linux-rtc+bounces-2107-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA733993A85
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2024 00:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEE921C2365C
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Oct 2024 22:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D606118D621;
	Mon,  7 Oct 2024 22:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mOPqG09u"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68BB18CBE3;
	Mon,  7 Oct 2024 22:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728341008; cv=none; b=N4CXyf9ihhiiDGNZbfJUpX3jNn4kxyLZq6rrRb1c0gq2Wj1T4wBezRNZ0hFdekIDccPIxGQblP92ZH5oN0NGGUNEEF7LvlLpCy4B0KCUTnye3lvyVqFr47m/QalV40xrNS1b4EOjz9r+fU5h4rCCBL5xk8SfxgbyY+wNsqC96kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728341008; c=relaxed/simple;
	bh=XV5YbZRRrsc8MmSBXAbVWjCukL5lMxgr/JIS1Dd0vuE=;
	h=To:Cc:Message-Id:In-Reply-To:References:From:Subject:Date; b=t8WQtUEKeGKtQnfXcQaqdwA5ZAsmAUfBLyon0N/B1K7pRm4KJK8uiH/pdpa07fODX/16pJwRvHFh/Z76ywHlqFBV4uh2vL8aEwuIas8oQ1+ktRmuk70UvrXfakI48P/WpJhiMYFPAp2x/acPtZ8X+qZ6a3FzMRIfAllWfehiOSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mOPqG09u; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id EBBE91380540;
	Mon,  7 Oct 2024 18:43:25 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 07 Oct 2024 18:43:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728341005; x=
	1728427405; bh=Sejz/rLOEMbCYCfBmFSejBAhf5tD9ye4Vs7WkeVOMVc=; b=m
	OPqG09ucUTsnU1v11hMb42ZqQOYVULntDQtXKN4kPWZIRkcFBWk1SMWjpjYs6ZDM
	CimJtpVtyhhvhxqp4P9tK3E5Ywfx8AqSi2xX+RbuX/rvHY9AK917HmD4CYG/HQXL
	DmIrqB0h2q0gitTbD8svzScMpPF+bHDAk/M8jOxvzdWYaYcZdXiTY1oMO9T5eMSR
	qEVzSVDZhCYzuH3hmhk8mtQ1A96uokIftUadfAPf13s0j5WpVkbHQTsJPIy9vtiU
	AR+ujjRaTe3UaO5/rEYSKQtk5jXJMdQoEs4/YRbl6qHm18O3Ds9NJ6C2Cem5c29+
	wuqWKIRgtMbRYqnv/xBIA==
X-ME-Sender: <xms:DWQEZ5GdrpHqBP1ahjCciWUjvTRsk0V5MIG5G81tdQ7xxTVBtDViUw>
    <xme:DWQEZ-V4izBjvfksnhIa6GfAS3FSB015b225cjYpu4c9hG6P0RWvnZuUsHqSUE0j-
    UORdj8sbLi64PJiH5w>
X-ME-Received: <xmr:DWQEZ7KPfPobWMyzJMXIGO18vwfITD0pdgEfMs60q3TOwW6zxp3w6PdYMU8c88R4n08dtOgIO4C4NCOSfofvNveXOfcI2FGlWnA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeftddgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepvfevkfgjfhfhufffsedttdertddttddtnecuhfhr
    ohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorh
    hgqeenucggtffrrghtthgvrhhnpeevgffgtdfhhfefveeuudfgtdeugfeftedtveekieeg
    gfduleetgeegueehgeffffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgt
    phhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghvvghmsegurg
    hvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvggrshesghgrihhslhgvrhdr
    tghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlih
    hnrdgtohhmpdhrtghpthhtohepuggrnhhivghlsedtgidtfhdrtghomhdprhgtphhtthho
    pehprghvohhnvgesrhgvthhrohguvghvrdgtohhmpdhrtghpthhtoheplhhinhhugidqmh
    eikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhprghrtg
    hlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidq
    khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:DWQEZ_GGHqkKU1vwEccZz2nsYsiM4QgEApWH2xd9C57KgSmx7NSzpg>
    <xmx:DWQEZ_W-qw-l_t2dw2ZeS1C88epoRR0EepsCAqv8t1T0q395DFLyRg>
    <xmx:DWQEZ6MIc_ohmKxzXyTgcJMl-fN1rph3qarjvB2k76UGKF2PTzUz2w>
    <xmx:DWQEZ-2wnr8WHhDJTp6kLwzOSl9PlDiDz4gxdSkf5chnOkhPy777TQ>
    <xmx:DWQEZ7rIFqfV1SrDj9wlcAfiOJnEgToat9siR4-xy98E7wkFD-3KjyLT>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Oct 2024 18:43:22 -0400 (EDT)
To: "David S. Miller" <davem@davemloft.net>,
    Andreas Larsson <andreas@gaisler.com>,
    Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Daniel Palmer <daniel@0x0f.com>,
    Michael Pavone <pavone@retrodev.com>,
    linux-m68k@lists.linux-m68k.org,
    linux-rtc@vger.kernel.org,
    sparclinux@vger.kernel.org,
    linux-kernel@vger.kernel.org
Message-Id: <fb25eb97521363ab8a18d2fd499cb4c76209cebf.1728340717.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1728340717.git.fthain@linux-m68k.org>
References: <cover.1728340717.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v2 1/2] rtc: m48t59: Use platform_data struct for year offset
 value
Date: Tue, 08 Oct 2024 09:38:37 +1100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

Instead of hard-coded values and ifdefs, store the year offset in the
platform_data struct.

Tested-by: Daniel Palmer <daniel@0x0f.com>
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
I tested this for regressions using qemu-system-sparc64.
Also, Daniel tested the RTC functionality on his MVME147 system.
---
 arch/sparc/kernel/time_32.c |  1 +
 arch/sparc/kernel/time_64.c |  1 +
 drivers/rtc/rtc-m48t59.c    | 26 ++++----------------------
 include/linux/rtc/m48t59.h  |  3 +++
 4 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/arch/sparc/kernel/time_32.c b/arch/sparc/kernel/time_32.c
index 08bbdc458596..578fd0d49f30 100644
--- a/arch/sparc/kernel/time_32.c
+++ b/arch/sparc/kernel/time_32.c
@@ -255,6 +255,7 @@ static void mostek_write_byte(struct device *dev, u32 ofs, u8 val)
 static struct m48t59_plat_data m48t59_data = {
 	.read_byte = mostek_read_byte,
 	.write_byte = mostek_write_byte,
+	.yy_offset = 68,
 };
 
 /* resource is set at runtime */
diff --git a/arch/sparc/kernel/time_64.c b/arch/sparc/kernel/time_64.c
index 60f1c8cc5363..b32f27f929d1 100644
--- a/arch/sparc/kernel/time_64.c
+++ b/arch/sparc/kernel/time_64.c
@@ -544,6 +544,7 @@ static void mostek_write_byte(struct device *dev, u32 ofs, u8 val)
 static struct m48t59_plat_data m48t59_data = {
 	.read_byte	= mostek_read_byte,
 	.write_byte	= mostek_write_byte,
+	.yy_offset	= 68,
 };
 
 static struct platform_device m48t59_rtc = {
diff --git a/drivers/rtc/rtc-m48t59.c b/drivers/rtc/rtc-m48t59.c
index f0f6b9b6daec..4c339fb45b5c 100644
--- a/drivers/rtc/rtc-m48t59.c
+++ b/drivers/rtc/rtc-m48t59.c
@@ -71,7 +71,7 @@ static int m48t59_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	/* Issue the READ command */
 	M48T59_SET_BITS(M48T59_CNTL_READ, M48T59_CNTL);
 
-	tm->tm_year	= bcd2bin(M48T59_READ(M48T59_YEAR));
+	tm->tm_year	= bcd2bin(M48T59_READ(M48T59_YEAR)) + pdata->yy_offset;
 	/* tm_mon is 0-11 */
 	tm->tm_mon	= bcd2bin(M48T59_READ(M48T59_MONTH)) - 1;
 	tm->tm_mday	= bcd2bin(M48T59_READ(M48T59_MDAY));
@@ -82,10 +82,6 @@ static int m48t59_rtc_read_time(struct device *dev, struct rtc_time *tm)
 		dev_dbg(dev, "Century bit is enabled\n");
 		tm->tm_year += 100;	/* one century */
 	}
-#ifdef CONFIG_SPARC
-	/* Sun SPARC machines count years since 1968 */
-	tm->tm_year += 68;
-#endif
 
 	tm->tm_wday	= bcd2bin(val & 0x07);
 	tm->tm_hour	= bcd2bin(M48T59_READ(M48T59_HOUR) & 0x3F);
@@ -106,12 +102,7 @@ static int m48t59_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	struct m48t59_private *m48t59 = dev_get_drvdata(dev);
 	unsigned long flags;
 	u8 val = 0;
-	int year = tm->tm_year;
-
-#ifdef CONFIG_SPARC
-	/* Sun SPARC machines count years since 1968 */
-	year -= 68;
-#endif
+	int year = tm->tm_year - pdata->yy_offset;
 
 	dev_dbg(dev, "RTC set time %04d-%02d-%02d %02d/%02d/%02d\n",
 		year + 1900, tm->tm_mon, tm->tm_mday,
@@ -162,11 +153,7 @@ static int m48t59_rtc_readalarm(struct device *dev, struct rtc_wkalrm *alrm)
 	/* Issue the READ command */
 	M48T59_SET_BITS(M48T59_CNTL_READ, M48T59_CNTL);
 
-	tm->tm_year = bcd2bin(M48T59_READ(M48T59_YEAR));
-#ifdef CONFIG_SPARC
-	/* Sun SPARC machines count years since 1968 */
-	tm->tm_year += 68;
-#endif
+	tm->tm_year = bcd2bin(M48T59_READ(M48T59_YEAR)) + pdata->yy_offset;
 	/* tm_mon is 0-11 */
 	tm->tm_mon = bcd2bin(M48T59_READ(M48T59_MONTH)) - 1;
 
@@ -197,12 +184,7 @@ static int m48t59_rtc_setalarm(struct device *dev, struct rtc_wkalrm *alrm)
 	struct rtc_time *tm = &alrm->time;
 	u8 mday, hour, min, sec;
 	unsigned long flags;
-	int year = tm->tm_year;
-
-#ifdef CONFIG_SPARC
-	/* Sun SPARC machines count years since 1968 */
-	year -= 68;
-#endif
+	int year = tm->tm_year - pdata->yy_offset;
 
 	/* If no irq, we don't support ALARM */
 	if (m48t59->irq == NO_IRQ)
diff --git a/include/linux/rtc/m48t59.h b/include/linux/rtc/m48t59.h
index 9465d5405fe2..6ac1eb2cbeac 100644
--- a/include/linux/rtc/m48t59.h
+++ b/include/linux/rtc/m48t59.h
@@ -56,6 +56,9 @@ struct m48t59_plat_data {
 	void __iomem *ioaddr;
 	/* offset to RTC registers, automatically set according to the type */
 	unsigned int offset;
+
+	/* YY digits (in RTC) are offset, i.e. year is 1900 + yy_offset + YY */
+	time64_t yy_offset;
 };
 
 #endif /* _LINUX_RTC_M48T59_H_ */
-- 
2.39.5


