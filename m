Return-Path: <linux-rtc+bounces-5398-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCBDC67A8B
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Nov 2025 07:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DE341364380
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Nov 2025 06:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB962DCBF8;
	Tue, 18 Nov 2025 06:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="KQyn/yF6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC07C2D97BF;
	Tue, 18 Nov 2025 06:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763446107; cv=none; b=aaY1J+ZcYt1YGZK4Qx/HYEVjfZHnBIF0AYY2UG6czVhdLi+15tYN+MnBrNrJhIN4VMG8BVVjqrsgv/SE3ojQ33dMgT+llQxU3dDYfS4xij8bVIc5nLXNh5MeSXVmDKH9znKVJHX2Vy/zo8NfL2b34kfmYxAmGpxgFAwI6VC64sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763446107; c=relaxed/simple;
	bh=O0ET+73GNcMNM8GQ0vp3eFlX8NnqDIXFIkI/j57BfWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SpqdOEloP4cQV5e6xjQhjC3djIZS8yRRdo09OIRTppVGsYJaJTMiYwPHsPgGXqTQr6nQhPswxCrQ+b84WW7O7XhkmphnWN94PohqKBBiqiWKVeDrXa+UNOSk9bqL6EKiDDFpxsiMW1yjMz5ypLQMfZnsOEjeJghypeEKFvrfgKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=KQyn/yF6; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763446100;
	bh=JJKnbCzCyE56DvqtMiAuAzvsyxWj4Xmfmgz9svZYVl4=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=KQyn/yF6cWq9fag7e+i1IrnHgR9ZXKeb35IFTKgAdmcYMlVtfTf2wwGDfNmWYi3+M
	 +JouLoJqnemU2Uqg+9bJ70NnTVbLFyS7Z/8Q4twLpfQKM5ajsgbjUhn+oHScGEJQAH
	 uhmkFbQfEhaLB/uMzWX9ibd/z+mWLu95jckhHUxg=
X-QQ-mid: zesmtpsz7t1763446097tc170ed18
X-QQ-Originating-IP: +LNcdJjd9qMKIjgg15SU0g3IP6WZkqv8aPItSsa9TDo=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Nov 2025 14:08:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13402662488646973170
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 18 Nov 2025 14:08:06 +0800
Subject: [PATCH v3 2/4] rtc: spacemit: MFD_SPACEMIT_P1 as dependencies
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-p1-kconfig-fix-v3-2-8839c5ac5db3@linux.spacemit.com>
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
In-Reply-To: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763446086; l=1318;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=O0ET+73GNcMNM8GQ0vp3eFlX8NnqDIXFIkI/j57BfWg=;
 b=8TEiAdqEhKkZALZLUbMI/ZvkEHwHrPeyfyMYKZDiS5r2HzeKYowHaOrTl+gWievKRuNoS24WU
 enNBKW94GzLBQtnqIVyyDffebqQOWxnQgKLUPEoazPiHoQkJ6tuWtuP
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NuGHm3DxUDaEqXUNtUz4jWsjOXPYt/cWCcQ9JbgEZsMKEqv5jOHGR/A3
	DK2FEANFXWYLqU5IlL50YosnOu3ny7PEJraaeIIfaxGyfI+3eOmMYLz4GiO/7NZh8x2wKM1
	Jb+CQ6p2PVxb0y82GUGR8O56ra4PlhZVGICLVTLkQrO7RJpGCWLhd4n3UjInDJ0kA4fI+Wr
	LaEHzQ0ya+peaFu4bJQlTtrBK83Jn6Qr4EjSyj3DfRoipjU1xVMF6FTyWPWbgLxKOFoZFUy
	8t5SnrXj2wU/5AvCtXqwKaLjgm7sKfRcqKFjG9Fb+Y/rSZRBEESFeRv4WuBsaR18NsD8/nQ
	X3dOfjqcuLbScNjR74Z8RkVJiF6wFEAUYsg6KT62AMOvabrzg7585UnSqMyNtolDy5ASEoh
	Do22kjIUaZ1heSauShLYqIV3Du6ViLITsTR+uTKDanoLmlSQC6hyHXOvT5v467kWjVGES1Y
	sXZ3oviGJfLp2o6le406cw18uyQ5FnWtyxWVfLVaYmFMSYa9UnQl+ekBn3RV+gOSkH4YAP6
	RrM1ZKEGvqnL9dHgxtrILCcdWLsIq8xLCAACbUCV2+WItXJ9bIBN1UcpDFI/D/FgHqh0Yfx
	C01qQSw62B7RMq1lXbgdPhsGlir2sMFBsoCtjp5cJNaU57KlOrdDQh7EMK4Z4X2wDRbMeGI
	JeAT9I5jUBt8S7tTyWCKJOS5KfBAy3Gxljq9o23j+L4l52E1LHC1KPDvY1PTYPobpg2/RhB
	5U7VCfsXJZFez+742hdeuJm8a4zisOsCwBXNJWLzJeKMoE3CNgeW4kYaOuED2nLxU4qfIBF
	3OFxWp8LrbQgzKQZXCPuMPhSlkHgfZkRhDRqcmf8206hQe6dznZ6YXD6C5ZFp5HtYLRhg6g
	JlzOBE8E3PxmOU1rBKEroNA39825jBctYSve0+glv0N7Uue/+HgTbRKUbe9LiEH7i/iLCAm
	0bzyyIILwjVo5zMj3vc++sRvi4ZFXA4FvVbXkOhXERACPRsa16PILE+6nnOyad6rf0U9iLh
	BG2DUTgCCvexmicN7K30SkCD5dovVNFpi1b4MIFWRoGL7j2oJOhDbfpUNiTX58lbNpJv4VO
	djdBlcE8fRvaYQBQ64HC2rEQvbvMVxmqdGKE1UQN2vuF0Sop1g8PM1iRPY1+i0i51hGVSLo
	lOZKUnSo805uStY=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

RTC_DRV_SPACEMIT_P1 is a subdevice of P1 and should depend on
MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
does not always respect the parent's dependencies, so 'depends on'
is the safer and more correct choice.

Additionally, the default value depends on MFD_SPACEMIT_P1 rather
than ARCH_SPACEMIT.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changelog in v3:
- modify commit message
- change default value from ARCH_SPACEMIT to MFD_SPACEMIT_P1
- Link to v2: https://lore.kernel.org/all/20251027-p1-kconfig-fix-v2-3-49688f30bae8@linux.spacemit.com/
---
 drivers/rtc/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 2933c41c77c88e60df721fe65b9c8afb995ae51e..b392e6d096ed077e841a2e68b70d8b80d9ad1cde 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -409,8 +409,8 @@ config RTC_DRV_MAX77686
 config RTC_DRV_SPACEMIT_P1
 	tristate "SpacemiT P1 RTC"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
-	select MFD_SPACEMIT_P1
-	default ARCH_SPACEMIT
+	depends on MFD_SPACEMIT_P1
+	default MFD_SPACEMIT_P1
 	help
 	  Enable support for the RTC function in the SpacemiT P1 PMIC.
 	  This driver can also be built as a module, which will be called

-- 
2.51.2


