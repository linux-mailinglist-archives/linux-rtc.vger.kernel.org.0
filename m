Return-Path: <linux-rtc+bounces-5168-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD80CC0BDB6
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Oct 2025 06:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B95D44E9E94
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Oct 2025 05:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F412D7812;
	Mon, 27 Oct 2025 05:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Wm/RhQUo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1F1200BAE;
	Mon, 27 Oct 2025 05:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761544118; cv=none; b=ei2v9x8+7HWz0wk7hvq18R1gt5tt1hZO7rEwh+ZAJ14H2tth7PA1V2fSnAYOIz9skjxHMB9IcjmtbdT3yjph/Ty4glyRW0J4s/NGNUGCK/It5IjR+Ss7wMfArvxgpI95+tMH1uTn3BryI4nCxO1dfem6oGDFiYlkQEkalFGFreI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761544118; c=relaxed/simple;
	bh=MdOH9hjjxGZsKypHF4E37v9P1dlEBgH3N1GF9QnLQ1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HQy+06VxIXUd7VkDm9WiCtI8HbE1G0FeaVIrpcmPF6i9dh/8saUttwpaxBzabfh9WXTErdfxHso2SuxhPbzgdo8E/jGse94l7baPE3nhF4eS9RsXGp/1ZIEi9uIcXpbb7pRqt8W64JgfzNAtzDxsyW+bGdB4TFHh5/c/00lqtDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Wm/RhQUo; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761544106;
	bh=eaKj1HRL8X/NaEJQudAmylwIeVJyeI2KOmMcJICZMgA=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Wm/RhQUoGcG8PO/QByJo6fhIhuwJXpgF6DzEnIha/vZ2x+ulJCLrYrVvOeWcbw6FE
	 6WULhgzf2lybWiP6tfdMN9tUF6WsBRQ8bTT5GfctrVgpbh7MjcwqehHzKXSji+w3li
	 tWYETsl7rO4+tvXVT/KFHelmkM0NY7Yw5zgNxGw8=
X-QQ-mid: zesmtpsz5t1761544102t2fd12e65
X-QQ-Originating-IP: 9D8j9F1R1n69BE9ErCI2rUt3ZW+zWcbpU/HCZSqgfqY=
Received: from = ( [183.48.247.177])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 13:48:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3398915015117501572
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 27 Oct 2025 13:48:07 +0800
Subject: [PATCH v2 3/4] rtc: spacemit: MFD_SPACEMIT_P1 as dependencies
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-p1-kconfig-fix-v2-3-49688f30bae8@linux.spacemit.com>
References: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
In-Reply-To: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761544088; l=913;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=MdOH9hjjxGZsKypHF4E37v9P1dlEBgH3N1GF9QnLQ1I=;
 b=jzR4ZlQVr89vvMu1oyh/46l2oRBTv/PLt6B/jfaLsrCb260Lpqf76bKrPnMiKPjKCLa1IOGn7
 362mPKO4nFDBUSwhqCn9Eaj+9TsjrPxs1kwQhRvjgWgBJ6flf/Hf9TG
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M8w/1a60XBliYmeKU8zFG7/gdP6ko7FUsxUF4ryDR9j69xddCleJwDRZ
	HJRS9tFiTGjfBcrSiqFj/VhRSClFqoqydxrNR7EWQLrBXyzuVAgWcBU3rlKBRPPOuBkaGF0
	Bxun3fPllqhXW2As/iv3YbZJH4yFNPSXryMMJk3VfrdFKv2OP7L2IL/R9Z07/3RHBDZaFjS
	ncr4M1J4aSbYdvYojZDSJDZovwiEtrye/N/YhGjBHLHb7zg7LI7s+lfixAlym1nxxN0JF0i
	h+/+5KNcB+z5jlDaZT87cO49ANMnEVo/OMh1bUVA9pLVvzwmBAP2OM9wWTwOhFxWQPz2ftG
	2I0PhBdlLdff00hNk6x/mifq3jowWtO5I2Xpbfz1cUMOGL+VLQDvBbEM8q8QLzTIBlJlqiV
	on6PITEWDct8mpOChHp0A171V81TXUZvvjmwrvbPNlg/uTosBK50//5NMsbBf3YUexWlpRV
	yHAx97sNnVINUmSbKaBHBDNDCzxO7AOVvBnW7eeKYnLGCam3N1X5n18P9xQ3XgXBI/zrMhE
	L4NoFr9OYHkGcGhB1CAuYezmV1s778T+EP0e7a56vhgcQJzBWXZAHO+F+1NoslDLpCxWMwI
	Fqq4AWddPPxpf7n1J7xtCFU8LlbZu7FfRvBNFjzwJx9xgKA/IjeSgEMz19lHDBIOtm+OkxJ
	LWvUrTECCxGTGpKXl0Dqu65kUqnTsXpiK2X35Y2zzvKpFV9VQSfRpSb4d6YLPCet2lyik4n
	AlDkkd9HyT1lowjoG5TtEZsn7NrCwHtUYKm4QMiZURvJexqHbwpQ5Gu+KvryXEn4cSKdDBX
	LTNC8pisXI4DqMwNBraqxSNkVYghs/biDX6zq0hQ/a/jAPk4Wj10l/BoPAMRSgXys/DnR/J
	QjhR8BW/vtat/TwwSw/D6fIAYR9aqVVi8fYAnM9kEc71hTO/7iwLSdh0QDbQ+oHof+tNGSY
	a6I8D0nJjFdWmM4mjzV0nWAE8rysBBoirFiLf8K+CGyu1PP5/ZjIdctDRQylM5XD36FK8t0
	AS1veQsODEGSlFIeniCilWFX5X0nY8MPDHOrg/ZVm+vnBfu1Thw25PNvCzWITppE0V3LUqq
	wAIcYNlNHvryZ5GKrgtvg50zU/bhbsr60opxkyIV9UF
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

RTC_DRV_SPACEMIT_P1 is a subdevice of P1 and should depend on
MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
does not always respect the parent's dependencies, so 'depends on'
is the safer and more correct choice.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/rtc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 2933c41c77c88e60df721fe65b9c8afb995ae51e..1ea0123e386f2b140e1a63a182d1781f6a17e835 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -409,7 +409,7 @@ config RTC_DRV_MAX77686
 config RTC_DRV_SPACEMIT_P1
 	tristate "SpacemiT P1 RTC"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
-	select MFD_SPACEMIT_P1
+	depends on MFD_SPACEMIT_P1
 	default ARCH_SPACEMIT
 	help
 	  Enable support for the RTC function in the SpacemiT P1 PMIC.

-- 
2.51.1


