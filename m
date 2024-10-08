Return-Path: <linux-rtc+bounces-2115-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DBC994327
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2024 11:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1302E1C24883
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2024 09:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D351667DA;
	Tue,  8 Oct 2024 08:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kv7u1oob"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B4B18BBA5;
	Tue,  8 Oct 2024 08:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728377700; cv=none; b=KIPLarXhiDYk2eSTnWPVD9NPHL9/83v3Q+myZeZXyXFj3NajQJU7xPIR6eY4KyfQdEeUB0owj5iYyM1GY+k+AX6kK+lUevkWWavpP3lcNBjkfEeYfYtHE+MGFh0Dt0fiLUhCCPtEiM4F6lGl0htCQc51eQZYqhKpbBvTVdclcQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728377700; c=relaxed/simple;
	bh=gUbDqpB8Cus8nZqB0o/9ZyNR+emBAsI9l8vRtuoHM2c=;
	h=To:Cc:Message-Id:In-Reply-To:References:From:Subject:Date; b=IgFCb0IzN30jbl3sQsZmwrE68htZ1VBvyzPi2hWaNc3bzpukclP0rwYN58T3Rrvrr0bcV5w3aiCE2wnm7mTLT8r4ngJTa6SgmnPTkEQQkI1+pqqqoMbM+5jsEwVUSHrGwKkytO38ToefdqXEgzE/H6D49UkJJo+ekg3bciPJEsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kv7u1oob; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EAD86114005D;
	Tue,  8 Oct 2024 04:54:57 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Tue, 08 Oct 2024 04:54:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728377697; x=
	1728464097; bh=oqL0s3V+ndmvIvwbSBY0P2n5NEr27DGG36gxIQI+AuI=; b=k
	v7u1oob3EQRanKAfgC6YYu7kHY/CPK209ecL3CsH4ZfL0tmC4purHd7phbeho6Nb
	Z4S3CqKL5MZ2gVbGxZeIxBNx6dY+jAdwyg6DcRTorbPWtQR36IwSuGWsEVZht7Tn
	Vas+qLifd06+ROThhv/LlUJq9Dd1si+pUxmyLtpoZg2qzxIBQe7N8yqmr+toSgRs
	QSk9JWi7zK8NsShh3PcT6fI7vBXKpG+/Hqah95U/kALm3HBAQySLLhbxXuR1D1UT
	z7IrryCrZoTCgGJlocmfhuBGYN3Xpr0Yv3KOUUWwo2neALGaeDSBJlbDexlMTUq+
	PPOLOvO+E0kajFsB8ViSQ==
X-ME-Sender: <xms:YfMEZ3l5-IGuBNVZ2-jlQrwSNsXyMosIUD1WV0loGq4Xbbt4ybsgfA>
    <xme:YfMEZ62KcMXaH5XBj2H1UMhcWIKxV8mr1xETgU19GYt6paSJUrdO20MbCOES-lL3P
    HZ-Ivnv8wTGZY5gRRI>
X-ME-Received: <xmr:YfMEZ9rRXgJ1SFmsarK0AqeW3cj0Ig2YUUuqN4yYs-lJ8yUwrbJKRDuU6ydPktKgIDey7r_KrMQdh6RtpybqbgoN9OwVWzlsZYc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefuddguddtucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:YfMEZ_mhxPhz6ecxund5u4TttuaE3lxI7YVecJdRIW5j-xRz8AqcIA>
    <xmx:YfMEZ11xDhEC62UCODl4oFFXR_609rrRwhgmjogRZRe73DOwaiE7_w>
    <xmx:YfMEZ-tuouV-J8aNDkvnat0Hxu4WC6KpCR2Uz3R09iWwdN2-tiWKXA>
    <xmx:YfMEZ5XtETNiMqpQp8xzcxNJBgV6Qx7L6OF8-vrGo_ywJ1ZJ3KQhNg>
    <xmx:YfMEZ-LkLWYttfa300vsi0zN6n2_6lmsCAPJLocZPu0lE4ewW32Jn7P4>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Oct 2024 04:54:54 -0400 (EDT)
To: "David S. Miller" <davem@davemloft.net>,
    Andreas Larsson <andreas@gaisler.com>,
    Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Daniel Palmer <daniel@0x0f.com>,
    Michael Pavone <pavone@retrodev.com>,
    linux-m68k@lists.linux-m68k.org,
    linux-rtc@vger.kernel.org,
    sparclinux@vger.kernel.org,
    linux-kernel@vger.kernel.org
Message-Id: <41e9f3f320a70b4d0946f7e0c3622f1dd1e8791c.1728377511.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1728377511.git.fthain@linux-m68k.org>
References: <cover.1728377511.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v3 1/2] rtc: m48t59: Use platform_data struct for year offset
 value
Date: Tue, 08 Oct 2024 19:51:51 +1100
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

Changed since v2:
 - Use an int for the year offset in struct m48t59_plat_data.
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
index 9465d5405fe2..373ba77071c6 100644
--- a/include/linux/rtc/m48t59.h
+++ b/include/linux/rtc/m48t59.h
@@ -56,6 +56,9 @@ struct m48t59_plat_data {
 	void __iomem *ioaddr;
 	/* offset to RTC registers, automatically set according to the type */
 	unsigned int offset;
+
+	/* YY digits (in RTC) are offset, i.e. year is 1900 + yy_offset + YY */
+	int yy_offset;
 };
 
 #endif /* _LINUX_RTC_M48T59_H_ */
-- 
2.39.5


