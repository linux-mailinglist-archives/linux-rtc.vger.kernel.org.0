Return-Path: <linux-rtc+bounces-5617-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D22CDD784
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Dec 2025 08:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB66D3035A6C
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Dec 2025 07:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4821C2FDC29;
	Thu, 25 Dec 2025 07:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="xkiMh2dh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B733C2727E2;
	Thu, 25 Dec 2025 07:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766648937; cv=none; b=W9hiVVecTejFJxaY53gl4LvFeKX5txd8NIb8AnwBc0OqJhB875EBj+QLxthAHznzLZZBOLRc2pzHzdZ8QA+mMUTonDdo9/FK8bRp+mbKixPtY6SpIs4mipjpF5lzZTW9Xuwr/mwBu2qwDjV1n+rxAzDeOwVzSkGqoeF5yZb33XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766648937; c=relaxed/simple;
	bh=tbbmEGblJd70gj9mVMO6LikHfMNdKYXKtiUuTq3LKZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U797iVbVhXuQ17wSuvwSjdltxRlDu28l/4hNSvb1NwcCiqJgtughsQfYFpIeQWQh2uRGrC/vXipkLKsVPB5Ks/QnfYqqwcz3TCszjhOHkvqDSV/H5QA+qYngXm8ojp4k++Y3ktCSmV0QvX3gZlezQdfbmJOtV2kz6drq3NOSxqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=xkiMh2dh; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766648924;
	bh=ld7avvFlqBh+Ra3zRZdP1viy+VmWyIrA/gK4Yj0CcDc=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=xkiMh2dhxim9T0IwAtr6erjj6p1zS3gmRNOdhKtRQsRDT2KQrSjG+1vCKVp1yrQgf
	 LpT7ij8mYW93f4Pn9MvXMgn3A6Wfl98Mj45ZOt6/m5CB8/ZKuMfgIR5Ic2xPPjo3gX
	 s6SZ6rB8XcL1dimByxmOwhJW90x2Lk3xBdNcO46w=
X-QQ-mid: esmtpsz10t1766648920t8f7ef5b4
X-QQ-Originating-IP: pntZV3xKJChw+zzDHE8O8xkD22p47KAnde+hzxhEzB8=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Dec 2025 15:48:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5483703246839209584
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 25 Dec 2025 15:46:33 +0800
Subject: [PATCH v4 3/3] rtc: spacemit: default module when MFD_SPACEMIT_P1
 is enabled
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com>
References: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
In-Reply-To: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766648906; l=993;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=tbbmEGblJd70gj9mVMO6LikHfMNdKYXKtiUuTq3LKZs=;
 b=v/CslR99FmS5Mu4A6LShyctnZdoqPZ7rApYqBGfTMp/mjWlTQqJjtyZ10dT6/qSCL5+iMtk4j
 S71svKcNp2ECoaFGrJdoS3CNWxzGQQW+RUHhLPNne4MhlX3WvAlwZPe
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NSSdk1DMx7alQvpAS/3LAiLD7ykB8SsSnXw8LsycMbizdxhGOlUpQjuP
	h6e9tmMjvS73rG/w3dAN/w8spai9Mc5saCdLRowGyDlzn+0Cy6kYSQg1OZU6dCdUnw0dyrr
	BPAv7l1NeMiKv8AnlLsvRjydz+sDjGOno3dxAoL3QGLaGbTAqNxIOR0Zu3wJ+nQ9EL6Feqi
	evpw7XGBgTTEIjwtWsCLNUlZtC5imFVN6Lb4dIfTR6ItQ5Lkh+wryCEVNgQwxJZm8P067s8
	zcf6eaPs05rLqzQ39R/KVUozMBvyO17W0t8JxXwVDJ1Rj7RFk0Z2MKVlgSBe5lmDjkwOy3z
	GgULIypwb5lijfoUJSSQb88RyDLyqR6S2h4UDqoSpQk+z/KwjJ2m2vkoDEqLNCG0/SuHPcJ
	PCwf/7MvADhKXNITy81vdcs96eFgSqs7OjxjVqr78V/VKK9ehFbEqXKkRN3CWVe6Ul5LmkI
	i6kLksIGlhnOCwoDLgnHHgZfERDhr9pLxKv2I+qIX+1b30Qjhjwer2+wvdjT3oOsfPq4/cg
	9u0+0rTFeoj/JPFxD4tifDWaZq05nDL0Xmh6kiwJdpSz1qA38vZbjrEhhrQMMMO5Tc/skeP
	pDkTuz+8RjZABFZrpX6J865vS13pbByR7RmgP4LGZEJHh8b78J2PDJTdwN5AEMFCK5DcnmI
	N2rhWTaVDs1YlwLubyrO4dXZ6vASg2A9PeXPcMILuQiZBzyTwM2VSVAMRMm4pRHAVKBwh3b
	2/ir4k2HYL7bzZAvDmPzZSUypuo9sq30vCu19kDELlw3dBe6QsTJJ4u0bxgmqFhws7N4Xje
	vg7wcFPdodIhbm/Av55haOgJkt2UXFXdDV3cYySbm/tn8UhYj3rgqvC/M+rQBDPxpLKwMde
	ZjiMo73tuFDJjA3Suo049tgS1iNLR5TuYAWNB8SYkDTfRTC6eFeSGHvtsAaFyNJMyLz0i9W
	NlOwhvQVoKht6IQPGrcPVcMvVbbyCsDwdYlqKKaV0/Zacjqho33th7gHfAyc+hz7JoguTyn
	5yzDFhRxwjyfZme5auL9luSczvitcwqJBTBqoFOypy8MlViARw9P1kRJIXu0BRc+rsR1NQe
	qtqnaZ2tx2UD7jy5XWKcVJ/YRb9nYMzsZUkDwNAKaQXUb6eLSJT1CUt9LdFgzI/3y6PmP1T
	IYrQ
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

The RTC driver defaulted to the same value as MFD_SPACEMIT_P1, which
caused it to be built-in automatically whenever the PMIC support was
set to y.

This is not always desirable, as the RTC function is not required on
all platforms using the SpacemiT P1 PMIC.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/rtc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 50dc779f7f983074df7882200c90f0df21d142f2..53866493e9bbaf35ff0de85cbfe43e8343eadc1e 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -410,7 +410,7 @@ config RTC_DRV_SPACEMIT_P1
 	tristate "SpacemiT P1 RTC"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
 	depends on MFD_SPACEMIT_P1
-	default MFD_SPACEMIT_P1
+	default m if MFD_SPACEMIT_P1
 	help
 	  Enable support for the RTC function in the SpacemiT P1 PMIC.
 	  This driver can also be built as a module, which will be called

-- 
2.52.0


