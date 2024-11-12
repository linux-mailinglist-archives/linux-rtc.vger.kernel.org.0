Return-Path: <linux-rtc+bounces-2540-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DC29C647B
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 23:51:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8944E285500
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Nov 2024 22:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A49021A710;
	Tue, 12 Nov 2024 22:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bzgu2Id6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D9F219E5C;
	Tue, 12 Nov 2024 22:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731451885; cv=none; b=TqHtU+6ylH4S9EPI7BpJUBh/W5we8AGY+IlxlTEFKhp0TN1Xo9unJLwMvPnWoIpTDkJChwv8Gma6VXZLMDif5XwN2Cwp96rb5qJL9vd7gpZYjQgLtwkbHBoEgqG6+Pe/0WfyhEpkhwN4OprCUyepaUI7KIEOT4I7qYHtA+nnFbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731451885; c=relaxed/simple;
	bh=qBKWleUs0rflmiKJyThoMQoinjTCZi5Qjr8qAyZ2ve4=;
	h=Message-ID:From:Subject:Date:To:Cc; b=SkTkEaw8XeDBeObxZCfe2gE0XJY+LCgKjDIHFvLHD2jDxxz7Rq6qnfSUyq4SIVX7F731HP+HWrjYaUbEjO0ImQWRkqLf2ElT69QPA4/r2+fZFPVaeF7xvhxBc+qKj9A8FCh1J9Nhp+IYW2KJGOkunfoBjufQIm/wsSu8+9cDUz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bzgu2Id6; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2C40A254014F;
	Tue, 12 Nov 2024 17:51:21 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Tue, 12 Nov 2024 17:51:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1731451881; x=1731538281; bh=mab7b9Xt6EjJAApXRK+nqzR/G6+2
	Y2fzyeEyjtLZLgs=; b=bzgu2Id6acgC2FGUFQCf5kSmVtYr6F+di1qEdNo11f+k
	itpBvGw92nilusILq1OLFPA3EXWrM8tokl0/f2fpNNlVm/2JcgWxZuuE8sX1hikY
	qRrIBKTNMzk3GVMwhcATqvvYiw4Sc4+3H440blIf537Li+RIkyVbXMVyQFlfDCUl
	/VehMJLsyQxHFrpDw9jMgs/S80zmyMPad2nniwzzwBAlJKJryUELa/T1xACqnbml
	SgBSbBjGxF9OQ6ZbAC4BJ26QLNoZl3nLQdkAimegVgKYZFftFQM0PYdWdtjmA12L
	gST7unY5SNvJQx8cdPTV1jOEQxrPjSJNCu9S9OYuwQ==
X-ME-Sender: <xms:59szZ8fDpfUziqBQWcBL_VyYpFSpizfHW7tS02QNnpXLuEQz5fO1QQ>
    <xme:59szZ-NB49rizbOC2vCeiZrvNH4VuFABEVOlew_bDacfc_I324iw1d_cfMjuy6BMK
    XKJhcizXhq6QLS-72M>
X-ME-Received: <xmr:59szZ9hXme7afYDtNHnFD2YVBKSnekyjYYQQGtwSkEht5ZD2VFxUe4Bwnzx4YnBkMODIp-BwaDqNWgF7NDizJE_mxRqefXVoBiI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehgddtfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefkhffufffvveestddtredttddttdenucfhrhhomhep
    hfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqne
    cuggftrfgrthhtvghrnhepheffudekteffudetvdffffehgedtteekkeefvefgieethfev
    vddtlefhuddutedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgspghrtghpthht
    ohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrlhgvgigrnhgurhgvrd
    gsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvggrshes
    ghgrihhslhgvrhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrd
    hnvghtpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtghp
    thhtohepuggrnhhivghlsedtgidtfhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvg
    hrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhm
    ieekkheslhhishhtshdrlhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghvohhn
    vgesrhgvthhrohguvghvrdgtohhm
X-ME-Proxy: <xmx:59szZx_jOewiCtLFR0sD5xRoewb-xJtvd1qSRI3nfMrq_2XKNTFDVg>
    <xmx:59szZ4tSixVc6_qZ5QufPJwpX3XIwAa85E-6aA-1yg_qMJLAZsf80Q>
    <xmx:59szZ4GjhXtJMQiLLN9NIP8cfuHxq-kblorU3ESK7mhK62iixE3Lfg>
    <xmx:59szZ3MVVrQxDqjQ6V8R3h-T-f6bodavTNnafEjhKIFLuCUUznUUZA>
    <xmx:6dszZ6IJmhUbiWnEg-dJygotmSbSi_GvPHd9O8WfCcSsMxqQZUIH1YWq>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Nov 2024 17:51:17 -0500 (EST)
Message-ID: <cover.1731450735.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v4 0/2] MVME: Adopt standard RTC driver
Date: Wed, 13 Nov 2024 09:32:15 +1100
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
    Andreas Larsson <andreas@gaisler.com>,
    "David S. Miller" <davem@davemloft.net>,
    Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>,
    linux-kernel@vger.kernel.org,
    linux-m68k@lists.linux-m68k.org,
    linux-rtc@vger.kernel.org,
    Michael Pavone <pavone@retrodev.com>,
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

Changed since v3:
 - Re-ordered m68k defconfig symbols.
 - Added reviewed-by tag from Geert.


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
2.44.2


