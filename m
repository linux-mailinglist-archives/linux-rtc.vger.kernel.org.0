Return-Path: <linux-rtc+bounces-2092-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7918E98E8D1
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2024 05:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37DA0288943
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2024 03:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB171EA80;
	Thu,  3 Oct 2024 03:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eYqEwAeT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAEC38DE0;
	Thu,  3 Oct 2024 03:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727926071; cv=none; b=sT809dyu6QZSGjF75CHRVdsq/AOzz81SwxbtBWRgkHoLx+xdWjnBpq3+y6p3NL7DM6/scGIyNO1h4jroXs1radOm1l0mAnOQMdnr7Y954Q8YA3FgKhhuYhAZHE2CDIqBpi1ZCS/Gz0xfkDp9WAAhszHFloWAkdjuNTzM8DVNUpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727926071; c=relaxed/simple;
	bh=VxZlrtAqFv9j/uHtY1BhROEG/+3JnklZMvpNVUxPEJw=;
	h=To:Cc:Message-Id:In-Reply-To:References:From:Subject:Date; b=H75j1RwDGRtla48EKlcWrp+KIJpWPlbLX5uaXcm+SXuDe/99wHxD1D61eaqx0WL9Q1LNoUwnkk31YYj7tmcofyCcde2HcmPhJ3xtXgFf+awBILlScA9uAfP40E/HOAwNpKoL2x065jb7twZEt35gnnQpzuEYBOKVY3lbXlWpFAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eYqEwAeT; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 0488F13804B7;
	Wed,  2 Oct 2024 23:27:49 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Wed, 02 Oct 2024 23:27:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727926069; x=
	1728012469; bh=RXdzWn7PA5l/DmEXkF+W4h++S2gHqll77LPZsh02hLA=; b=e
	YqEwAeTaGrXdaqqquahNRMZAa5y8ckbKD62mg3Zrf3x+1NcEQ8spevrZAehPY4Gx
	IdXKRqfbglKj/LSCncMdXewKIlHkQ1nBAMGATM2WtNTtFaSXxeH6QPr9M3JiTGZQ
	jnakK0i43ij0yQgvwLDik1t3PIk5R+21xhr9DCATntBv2Yri/rCPwTfSXxT9ANl7
	lEZZ/PdcubIMk7mJxNgS2Cx8PnYe05R8hvup4RK536NZRiAJsELd2jwBYP4pbSas
	m+09sagZ56ukZUGx14qvkyPP3rcIge1WFPcfmC1AdlifLOFb8DirRPdMG2vtwHqk
	vhzUzZUCUqDZ+Np058AjA==
X-ME-Sender: <xms:NA_-ZpgMClRvJV_civMG1xATa1LYBUA0agClzLwh1WvYgmz-AAJB4g>
    <xme:NA_-ZuAIroN9IS-BOHa9fouMxPcpYVfmFEXw5dxZ9cSA0Hd0FpDbGfUnZgLyLOd-f
    Dp2z6EY9RsGPKeQ2iI>
X-ME-Received: <xmr:NA_-ZpFf89KTROxQZuSNg2SCHcu_l7syccNFGdKuWhRaPs4zaifASTXb6XSwMeeZR-ojxgzr7IP9CNxTC5LULSHeUww1tG8ycT0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvtddgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepvfevkfgjfhfhufffsedttdertddttddtnecuhfhr
    ohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorh
    hgqeenucggtffrrghtthgvrhhnpeevgffgtdfhhfefveeuudfgtdeugfeftedtveekieeg
    gfduleetgeegueehgeffffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgt
    phhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrlhgvgigrnhgurh
    gvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepghgvvghrthes
    lhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepuggrnhhivghlsedtgidtfhdrtg
    homhdprhgtphhtthhopehprghvohhnvgesrhgvthhrohguvghvrdgtohhmpdhrtghpthht
    oheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:NA_-ZuRiC5bkP3QyzReOsrvaKdbL4MdrGpNREVtUZQlIrqR4wK4Uxg>
    <xmx:NA_-Zmy3JTyqZMlV7GZSMVnqYhq54NUZNBEsFIFbkglhQgdKDIAv8A>
    <xmx:NA_-Zk69UL8uWm9QqZN1BAciJ2P0DIyA_UBY3NFsQloTJbXbwuSlng>
    <xmx:NA_-Zrw_-pnJe19_0ZZe2FrhhjBwhQiMXs6BUm2_sJL0Q3ka2oTp-A>
    <xmx:NA_-ZtnH88qGQU2-WjC3VYkoLxeRZlIMmn4wuNfvC4Pl0qXhdmdSJALR>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 23:27:46 -0400 (EDT)
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
    Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>,
    Michael Pavone <pavone@retrodev.com>,
    linux-m68k@lists.linux-m68k.org,
    linux-rtc@vger.kernel.org,
    linux-kernel@vger.kernel.org
Message-Id: <f9eedf61f64906006f57ac88bdc160e55bc40c8a.1727925802.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1727925802.git.fthain@linux-m68k.org>
References: <cover.1727925802.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH 1/2] rtc: m48t59: Accommodate chips that lack a century bit
Date: Thu, 03 Oct 2024 13:23:22 +1000
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

The m48t59 driver is needed by both SPARC and MVME systems. Linux on
MVME uses 1970 as "year zero" rather than 1968 that's used on SPARC.
Add support for the MVME convention. Otherwise, the RTC on non-SPARC
systems can only read and write dates between 1900 and 1999.

Tested-by: Daniel Palmer <daniel@0x0f.com>
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
 drivers/rtc/rtc-m48t59.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/rtc/rtc-m48t59.c b/drivers/rtc/rtc-m48t59.c
index f0f6b9b6daec..e2d882ea5c2f 100644
--- a/drivers/rtc/rtc-m48t59.c
+++ b/drivers/rtc/rtc-m48t59.c
@@ -57,6 +57,17 @@ m48t59_mem_readb(struct device *dev, u32 ofs)
 	return readb(m48t59->ioaddr+ofs);
 }
 
+/*
+ * Sun SPARC machines count years since 1968. MVME machines running Linux
+ * count years since 1970.
+ */
+
+#ifdef CONFIG_SPARC
+#define YEAR0 68
+#else
+#define YEAR0 70
+#endif
+
 /*
  * NOTE: M48T59 only uses BCD mode
  */
@@ -82,10 +93,7 @@ static int m48t59_rtc_read_time(struct device *dev, struct rtc_time *tm)
 		dev_dbg(dev, "Century bit is enabled\n");
 		tm->tm_year += 100;	/* one century */
 	}
-#ifdef CONFIG_SPARC
-	/* Sun SPARC machines count years since 1968 */
-	tm->tm_year += 68;
-#endif
+	tm->tm_year += YEAR0;
 
 	tm->tm_wday	= bcd2bin(val & 0x07);
 	tm->tm_hour	= bcd2bin(M48T59_READ(M48T59_HOUR) & 0x3F);
@@ -108,10 +116,7 @@ static int m48t59_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	u8 val = 0;
 	int year = tm->tm_year;
 
-#ifdef CONFIG_SPARC
-	/* Sun SPARC machines count years since 1968 */
-	year -= 68;
-#endif
+	year -= YEAR0;
 
 	dev_dbg(dev, "RTC set time %04d-%02d-%02d %02d/%02d/%02d\n",
 		year + 1900, tm->tm_mon, tm->tm_mday,
@@ -163,10 +168,7 @@ static int m48t59_rtc_readalarm(struct device *dev, struct rtc_wkalrm *alrm)
 	M48T59_SET_BITS(M48T59_CNTL_READ, M48T59_CNTL);
 
 	tm->tm_year = bcd2bin(M48T59_READ(M48T59_YEAR));
-#ifdef CONFIG_SPARC
-	/* Sun SPARC machines count years since 1968 */
-	tm->tm_year += 68;
-#endif
+	tm->tm_year += YEAR0;
 	/* tm_mon is 0-11 */
 	tm->tm_mon = bcd2bin(M48T59_READ(M48T59_MONTH)) - 1;
 
@@ -199,10 +201,7 @@ static int m48t59_rtc_setalarm(struct device *dev, struct rtc_wkalrm *alrm)
 	unsigned long flags;
 	int year = tm->tm_year;
 
-#ifdef CONFIG_SPARC
-	/* Sun SPARC machines count years since 1968 */
-	year -= 68;
-#endif
+	year -= YEAR0;
 
 	/* If no irq, we don't support ALARM */
 	if (m48t59->irq == NO_IRQ)
-- 
2.39.5


