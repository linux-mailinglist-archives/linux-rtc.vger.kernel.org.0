Return-Path: <linux-rtc+bounces-2098-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCE8991444
	for <lists+linux-rtc@lfdr.de>; Sat,  5 Oct 2024 06:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A5721F23F08
	for <lists+linux-rtc@lfdr.de>; Sat,  5 Oct 2024 04:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA58B28371;
	Sat,  5 Oct 2024 04:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Wn9PiuAn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CBE22067;
	Sat,  5 Oct 2024 04:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728102208; cv=none; b=u2QLrrYMBnAqovO00u6mXPWygghVk3XWct87srGBAQtF63LudSJGTPWD9NfX7g2sgSlZI74ET3n37y/fN5QhanvxHDHblwHLgFIttT6CJD7DxxwFlJFh70ggDv5EEODEcRf5iNPfQyL4DsMQDSHDp88ShNPqwlq1qccOrMgDBMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728102208; c=relaxed/simple;
	bh=VAfiyok4ugjEw6q/iwc9bfeTDqFqka9uuOrMe40BkaA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ot2uRer8bXI5A220spYbmeO93YMNwIGCMATPjitZDj12IYEcrX4P/jVrcYFAzAztthnJ86C2ELHK/KtdGopCqpEeG+ZvY/BOFZZqQK4OGrz4mdEjreWn95EvCM0J6ZtStnY+aeUWCVTW+6Rprd5QZs7BoKIba9LWV9lya9GxG8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Wn9PiuAn; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E3C5A1140301;
	Sat,  5 Oct 2024 00:23:24 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Sat, 05 Oct 2024 00:23:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1728102204; x=1728188604; bh=MQ2TI9weLpwwO0u3vLYut9X87Z79
	bgN+EXOdenFrMyY=; b=Wn9PiuAnHaaB8CT77L5YyhFrW4ZHwJrBM4BwnFZspAkI
	/v/cASqPNhlxep4hrUJmo8o842nmeZkw+UfYbW9QhP5jSXo0yk0RsDMcBSNsNkX/
	AxsWOqIfQDKXpdilBE/9fBU7J2Y0IaRAPU8NBcIof5253ok65vqE/GvgOAUaOQyh
	fHJICRBWYtGoAEVUOsBYR8BnoL30aOV14TSmLytiNb1x0IQOgg26EHwhJJ8tEJE8
	SaSbClIjbK808DKA4z125mouu59OqNcIXTnBtnsjb2siB6YZWgCVXedqZC0/EqV8
	LkJQNhqVNgBXbRVIvekc4Z/gL+zTf5m7uM711bQe9A==
X-ME-Sender: <xms:O78AZ_awfMEVu-yh76vBTqQ60o9mN7VhJBtvy0jUbUN-e0Q7wxqSRg>
    <xme:O78AZ-Z40icowB7U3TbxMs7sC399Tq8Dj3XvyJEecXQnsMy30t_43Y4WtdvTyoJaz
    810hlTeba6li7LzjV8>
X-ME-Received: <xmr:O78AZx92pOwax0FBMaN-ZVp0r_w-i0_tA1E0rkzGNS1wFeFBQr6prvhdGcCXPDoKkVkukdzKJCkAYugtoXZ--cflDU-o1BGlxO0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvgedgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeff
    ffdtgfejveekgeefvdeuheeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggp
    rhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrlhgvgigrnh
    gurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepghgvvghr
    theslhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepuggrnhhivghlsedtgidtfh
    drtghomhdprhgtphhtthhopehprghvohhnvgesrhgvthhrohguvghvrdgtohhmpdhrtghp
    thhtoheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:O78AZ1qRnY9yDfsBoMBEGJBcqXYc2Inz8jY-yRMhqZqX01JXUTp_7w>
    <xmx:O78AZ6qD6f0WVqRwIv5cvNwt1Gfzn7prknyL2l79Hb52gz1RFxaIMg>
    <xmx:O78AZ7RnVjbOqLa2FRlVNXCShB9FmzvUlGkllmqdiG678yzeuz6xbg>
    <xmx:O78AZypxg-ih3-mLPd-qw9ApCD7VmiRhvI_MuzqMdAZGHovNDEoyPw>
    <xmx:PL8AZ7c_8DSccgMzH2tp1ED5hVn4KSXg-6Hu0y_4TjV4wx8CfMSzC2fJ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 5 Oct 2024 00:23:20 -0400 (EDT)
Date: Sat, 5 Oct 2024 14:23:28 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, Daniel Palmer <daniel@0x0f.com>, 
    Michael Pavone <pavone@retrodev.com>, linux-m68k@lists.linux-m68k.org, 
    linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: m48t59: Accommodate chips that lack a century
 bit
In-Reply-To: <20241003081015363ed024@mail.local>
Message-ID: <10bb949d-07f5-5cea-b658-8969b5bda6ae@linux-m68k.org>
References: <cover.1727925802.git.fthain@linux-m68k.org> <f9eedf61f64906006f57ac88bdc160e55bc40c8a.1727925802.git.fthain@linux-m68k.org> <20241003081015363ed024@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Thu, 3 Oct 2024, Alexandre Belloni wrote:

> 
> ... while you are it, can you use m48t59->rtc->start_secs and 
> m48t59->rtc->set_start_time in probe instead of offsetting tm_year in 
> read_time/set_time so we can later use device tree or any other 
> mechanism to extend the range?
> 

That didn't work out as I'd hoped. I booted a patched kernel (diff below) 
under qemu-system-sparc64:

~ # for yyyy in 1970 1971 1999 2000 2024 2025 2068 2069 ; do 
date 01010101$yyyy ; hwclock --systohc --utc && hwclock --utc ; echo ; done
Thu Jan  1 01:01:00 UTC 1970
Thu Jan  1 01:01:00 1970  0.000000 seconds

Fri Jan  1 01:01:00 UTC 1971
Tue Nov 24 18:32:44 1998  0.000000 seconds

Fri Jan  1 01:01:00 UTC 1999
Tue Nov 24 18:32:44 2026  0.000000 seconds

Sat Jan  1 01:01:00 UTC 2000
Sun Jan  2 23:29:16 2000  0.000000 seconds

Mon Jan  1 01:01:00 UTC 2024
Tue Jan  2 23:29:16 2024  0.000000 seconds

Wed Jan  1 01:01:00 UTC 2025
Thu Jan  2 23:29:16 2025  0.000000 seconds

Sun Jan  1 01:01:00 UTC 2068
hwclock: RTC_SET_TIME: Numerical result out of range

Tue Jan  1 01:01:00 UTC 2069
hwclock: RTC_SET_TIME: Numerical result out of range

~ # 

Here's the result from an unpatched kernel (v6.11):

~ # for yyyy in 1970 1971 1999 2000 2024 2025 2068 2069 ; do 
date 01010101$yyyy ; hwclock --systohc --utc && hwclock --utc ; echo ; done
Thu Jan  1 01:01:00 UTC 1970
Thu Jan  1 01:01:00 1970  0.000000 seconds

Fri Jan  1 01:01:00 UTC 1971
Fri Jan  1 01:01:00 1971  0.000000 seconds

Fri Jan  1 01:01:00 UTC 1999
Fri Jan  1 01:01:01 1999  0.000000 seconds

Sat Jan  1 01:01:00 UTC 2000
Sat Jan  1 01:01:00 2000  0.000000 seconds

Mon Jan  1 01:01:00 UTC 2024
Mon Jan  1 01:01:00 2024  0.000000 seconds

Wed Jan  1 01:01:00 UTC 2025
Wed Jan  1 01:01:00 2025  0.000000 seconds

Sun Jan  1 01:01:00 UTC 2068
hwclock: RTC_RD_TIME: Invalid argument

Tue Jan  1 01:01:00 UTC 2069
hwclock: RTC_RD_TIME: Invalid argument

~ # 


I'm afraid I don't see how we might avoid adding/subtracting in 
read_time/set_time given that we must avoid messing up the present date 
when users boot into an upgraded kernel.


diff --git a/arch/sparc/kernel/time_32.c b/arch/sparc/kernel/time_32.c
index 08bbdc458596..41ae3d1aa12e 100644
--- a/arch/sparc/kernel/time_32.c
+++ b/arch/sparc/kernel/time_32.c
@@ -255,6 +255,7 @@ static void mostek_write_byte(struct device *dev, u32 ofs, u8 val)
 static struct m48t59_plat_data m48t59_data = {
 	.read_byte = mostek_read_byte,
 	.write_byte = mostek_write_byte,
+	.start_year = 1968,
 };
 
 /* resource is set at runtime */
diff --git a/arch/sparc/kernel/time_64.c b/arch/sparc/kernel/time_64.c
index 60f1c8cc5363..eceb3fadb71a 100644
--- a/arch/sparc/kernel/time_64.c
+++ b/arch/sparc/kernel/time_64.c
@@ -544,6 +544,7 @@ static void mostek_write_byte(struct device *dev, u32 ofs, u8 val)
 static struct m48t59_plat_data m48t59_data = {
 	.read_byte	= mostek_read_byte,
 	.write_byte	= mostek_write_byte,
+	.start_year	= 1968,
 };
 
 static struct platform_device m48t59_rtc = {
diff --git a/drivers/rtc/rtc-m48t59.c b/drivers/rtc/rtc-m48t59.c
index f0f6b9b6daec..d7e1f79cd52b 100644
--- a/drivers/rtc/rtc-m48t59.c
+++ b/drivers/rtc/rtc-m48t59.c
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
@@ -108,11 +104,6 @@ static int m48t59_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	u8 val = 0;
 	int year = tm->tm_year;
 
-#ifdef CONFIG_SPARC
-	/* Sun SPARC machines count years since 1968 */
-	year -= 68;
-#endif
-
 	dev_dbg(dev, "RTC set time %04d-%02d-%02d %02d/%02d/%02d\n",
 		year + 1900, tm->tm_mon, tm->tm_mday,
 		tm->tm_hour, tm->tm_min, tm->tm_sec);
@@ -163,10 +154,7 @@ static int m48t59_rtc_readalarm(struct device *dev, struct rtc_wkalrm *alrm)
 	M48T59_SET_BITS(M48T59_CNTL_READ, M48T59_CNTL);
 
 	tm->tm_year = bcd2bin(M48T59_READ(M48T59_YEAR));
-#ifdef CONFIG_SPARC
-	/* Sun SPARC machines count years since 1968 */
-	tm->tm_year += 68;
-#endif
+
 	/* tm_mon is 0-11 */
 	tm->tm_mon = bcd2bin(M48T59_READ(M48T59_MONTH)) - 1;
 
@@ -199,11 +187,6 @@ static int m48t59_rtc_setalarm(struct device *dev, struct rtc_wkalrm *alrm)
 	unsigned long flags;
 	int year = tm->tm_year;
 
-#ifdef CONFIG_SPARC
-	/* Sun SPARC machines count years since 1968 */
-	year -= 68;
-#endif
-
 	/* If no irq, we don't support ALARM */
 	if (m48t59->irq == NO_IRQ)
 		return -EIO;
@@ -458,6 +441,10 @@ static int m48t59_rtc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, m48t59);
 
 	m48t59->rtc->ops = &m48t59_rtc_ops;
+	m48t59->rtc->range_min = mktime64(1900, 1, 1, 0, 0, 0);
+	m48t59->rtc->range_max = mktime64(1999, 12, 31, 23, 59, 59);
+	m48t59->rtc->start_secs = mktime64(pdata->start_year, 1, 1, 0, 0, 0);
+	m48t59->rtc->set_start_time = true;
 
 	nvmem_cfg.size = pdata->offset;
 	ret = devm_rtc_nvmem_register(m48t59->rtc, &nvmem_cfg);
diff --git a/include/linux/rtc/m48t59.h b/include/linux/rtc/m48t59.h
index 9465d5405fe2..b01c514d7079 100644
--- a/include/linux/rtc/m48t59.h
+++ b/include/linux/rtc/m48t59.h
@@ -56,6 +56,9 @@ struct m48t59_plat_data {
 	void __iomem *ioaddr;
 	/* offset to RTC registers, automatically set according to the type */
 	unsigned int offset;
+
+	/* value to be used to initialize rtc->start_secs */
+	time64_t start_year;
 };
 
 #endif /* _LINUX_RTC_M48T59_H_ */

