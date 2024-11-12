Return-Path: <linux-rtc+bounces-2541-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 671D69C647E
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 23:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E95F91F25B1E
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 22:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A050321A717;
	Tue, 12 Nov 2024 22:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Aov74ftC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C383C21A4D2;
	Tue, 12 Nov 2024 22:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731451897; cv=none; b=d7ue7hGsTtz8T5Y9vmuT8EgZoR10pAuc76HNuP7IbYMRGtnvFN9ykH2uGVJgWWm2B9V2WxiWX1+nk4/CTW+MW/c0LVz33Yu/KKB1E/0jis2BGqQKM1VaTOcuEDJtCRjCVB5gSo0tI5yRG3mWERUlRtJ2il65Hyp5g1LRiKmSADs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731451897; c=relaxed/simple;
	bh=QajtEB44mhyLS6FjbLPKMtsneetJ+c5gABviaueFzok=;
	h=To:Cc:Message-ID:In-Reply-To:References:From:Subject:Date; b=LBcQkfsYnYKTxj4GMuJ/d9fW7GIGbPau2wTs7CJzGPtqUjksBPTYzfZuNxPqpo8+bJEkxemLaUhG6JR7qeGMAbC+cmquHaX94IVtVfPIc+p/7H8fqBmpKEDrusln+yIgVGUxDUylCt1bUd0mtgDCjyo/DEUKBhIdkVGIWrYrYwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Aov74ftC; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id D9687114016F;
	Tue, 12 Nov 2024 17:51:33 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 12 Nov 2024 17:51:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1731451893; x=
	1731538293; bh=NPKMxmdPHehOLsrHZb8pjHSFY9MYLh8eXEj1wSClsKs=; b=A
	ov74ftCnM2dNJ2N7wLWy6/rHsZNnZCauXceeAHY1KOaVZZcrWP8IrJkjeWV0/nXt
	wP1vOPOAEwpUXnyLcPHuJiMh1TjsKSCFimZOfqAQXOQD/V2IAZnbPgYcBQj1XFDx
	4B5K9HelE9CtPwzz5B+cKxp4TtRup6hnm0jQCzvBRLR4LREepy06TaBjoyhxjmUs
	MmbSN61N5NHvtFdfHcXrb86Gfci9aQFMyA1nmb4nqDUHaBaZkgaYO7EnKheKOPRm
	k5UMWIegaBNhvxhk4O/iGrmGh71S/4NqvSxo6rHa51BN/z3DmsRsbcqGksrr06+g
	6Ye4cSPXs5wguZFilBItw==
X-ME-Sender: <xms:9dszZxDW2YIoPZGWxKy1o9E8ke-bAq-ix0BVVxglqo0CyrWFfctOLA>
    <xme:9dszZ_igyOupJXTBJ3q8KtwUaSg7JLuy3PbmUamawdVtNR5zVpJZLeSefSwpZ7h60
    T6fUgYKvQ-E4XnGVGw>
X-ME-Received: <xmr:9dszZ8mxCxFd0tVJ94Ek5Wr2tVnYVptWuyhybFCdhq7y8hho-h1Gj3jfXvNRX-u2RKwj9V3G46HrDebvm8JxVxrOZwXYTIsP_DM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehgddtfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefvvefkjghfhffuffestddtredttddttdenucfhrhho
    mhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
    eqnecuggftrfgrthhtvghrnhepvefggfdthffhfeevuedugfdtuefgfeettdevkeeigefg
    udelteeggeeuheegffffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgspghrtghp
    thhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggrvhgvmhesuggrvh
    gvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvrghssehgrghishhlvghrrdgt
    ohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinh
    drtghomhdprhgtphhtthhopegurghnihgvlhestdigtdhfrdgtohhmpdhrtghpthhtohep
    phgrvhhonhgvsehrvghtrhhouggvvhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmie
    ekkheslhhishhtshdrlhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsphgrrhgtlh
    hinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:9dszZ7y05DsYnWrT2yJlHZEKB9LZiv8AKsbzApq_RRQUbQDmCnnkdg>
    <xmx:9dszZ2SgVdxXtGFcoAS1oOuvxitSCNuFq83oTiEYrWlyJlhSE1PLvQ>
    <xmx:9dszZ-a-pdOBHDkN90qN7CBl6Xk9MyOR0hV8an_jovJIgOX5zuNXzg>
    <xmx:9dszZ3R9uulPlgesnUDyXOe6xJNPCch_J7Dg5OJmh3ZUYqFA9gyX-A>
    <xmx:9dszZ5GeHpJt6ACNIngO0_kAVzGRK12a5jv4cFXklO9ifT57cN-RUXtX>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Nov 2024 17:51:30 -0500 (EST)
To: "David S. Miller" <davem@davemloft.net>,
    Andreas Larsson <andreas@gaisler.com>,
    Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Daniel Palmer <daniel@0x0f.com>,
    Michael Pavone <pavone@retrodev.com>,
    linux-m68k@lists.linux-m68k.org,
    linux-rtc@vger.kernel.org,
    sparclinux@vger.kernel.org,
    linux-kernel@vger.kernel.org
Message-ID: <665c3526184a8d0c4a6373297d8e7d9a12591d8b.1731450735.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1731450735.git.fthain@linux-m68k.org>
References: <cover.1731450735.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v4 1/2] rtc: m48t59: Use platform_data struct for year offset
 value
Date: Wed, 13 Nov 2024 09:32:15 +1100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

Instead of hard-coded values and ifdefs, store the year offset in the
platform_data struct.

Tested-by: Daniel Palmer <daniel@0x0f.com>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
David, Andreas - with your acknowledgement, I will ask Alexandre to merge
this.
---
I tested this for regressions using qemu-system-sparc64.
Also, Daniel tested the RTC functionality on his MVME147 system.

Changed since v2:
 - Use an int for the year offset in struct m48t59_plat_data.

Changed since v3:
 - Added reviewed-by tag from Geert.
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
index 5d30ce8e13ca..4e608bc8bbd3 100644
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
2.44.2


