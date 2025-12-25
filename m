Return-Path: <linux-rtc+bounces-5614-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B95C6CDD772
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Dec 2025 08:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C651E301CFB4
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Dec 2025 07:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BACB217722;
	Thu, 25 Dec 2025 07:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="bWm8Tfg/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C474E555;
	Thu, 25 Dec 2025 07:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766648928; cv=none; b=azg/OfHG37wgQy9uDK32lhpXtoyFrR4n25xfzx3gdXWTuDbqJkie0E4ybVZ97ojo1b8cJXLh+4ZxX9G6juSdVqtAKBitDIS6o1BLgGkMYU3O/bEf+oEG29LrUanEiaU6EtPw5nj07cN59qbaBsLFdz+dcvTqW4wnaM1/SGIbHPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766648928; c=relaxed/simple;
	bh=IiRNSVJmhy8MrOZ1LUM3AjhCQcMWkKuilr5Lzf2ajGs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mBZsjif43MwBjXmG5XD1ccIcxTI0mo4p5ooiRO+ReDghLfhQ7CyKLZNE7UH6jJKfZaiqZUuCT7Izx7+v17PQIIRgTiZOPLP8o3ikiE8tHZ3TmZ0b1K28M/a9kLaQqmAAbber5zh4xAsdWDUHUGaXrw72fWilZIdi/hdwp/IcrT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=bWm8Tfg/; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766648913;
	bh=oXpcYu7/BiXLtInxfeyZ/crAJL6uNMHTLPJTzMs80uI=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=bWm8Tfg/hWtkyvQweW2cCsdLhJmYuoWL1TYbIePdCjFG0y9vBoUTr2pNbeOuctnPL
	 qqNlay7tJRc+NR84MIJLaIz1zTEAtre7YFAKPaO7t9UnnTqCtVbUkz3Ktu7fkQxSf7
	 fkFEsZsxaydRpgK2FCjzycSyaYz34hZWtOPFm86M=
X-QQ-mid: zesmtpsz8t1766648909td176ce42
X-QQ-Originating-IP: QroFkQHEo23eylXHlQX/mxkpfFw7ESnMfV2JhlLx0dY=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Dec 2025 15:48:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13698806636319235656
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v4 0/3] spacemit: fix P1 sub-device Kconfig defaults and
 dependencies
Date: Thu, 25 Dec 2025 15:46:30 +0800
Message-Id: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANbrTGkC/3XMSw6CMBSF4a2Qjr2mt6VaHLkP44A+kBsVCEWCI
 ezdQmI0Pob/Sc43suBb8oHtkpG1vqdAdRUjXSXMlnl18kAuNhNcKOQCoUE427oq6AQFDbBxwqj
 McWl0weKpaX2cF/BwjF1S6Or2vvg9zuuTEp9Uj4BgMRVOoUfD9f5C1W1Yhya3/krd2tZXNpu9e
 He2X44ADmm20bqQ3OT+vyNfDqL+cmR0tJaZVblVzsifzjRND/nW6xZFAQAA
X-Change-ID: 20251021-p1-kconfig-fix-6d2b59d03b8f
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766648906; l=720;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=IiRNSVJmhy8MrOZ1LUM3AjhCQcMWkKuilr5Lzf2ajGs=;
 b=RwCobX1DexAcrhwW5nRpQnaIlrwLh5GQ4Cify866vKLrtNeOnI23S6PNT6jW8HjcQ1H+HEgH2
 Orta6juCA1zCAYyKskHsWjCIOSHOeM67uZruPWvld09T79VgH0/HTxp
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: ND42uzdxTIzrTStEG2OTrO7La2NECKIXDRSrgXgM5Fpf/Sj/psA8bIwX
	3WzGq7Z/wasM/LB8M6Tuz504uNA+QQyHPfpAJMn10eOJq1v/MqEAilm0C+dD/5yhGp+sFqP
	RvrImz4xbh8jA6kqlHzwQTiz6Q/RGxbE+MsUopohvLlgN7wuAjJ9ztIoS2i4cABGaDzJRUx
	kkwxNEwdcaBx996arQ5NAf7K4C4IVXAOxj0usNwVX2ehqRA9oBm00D/CVdV4zWTR5mwipqM
	kn8eNSOsOu/vki28lGDk2GMHdZUKJnPGrVtmtiAwFAFnNqYXFLUNYDvrRahdxufNJ19OQ3O
	48e8IWeF9DhjYzYMkAM1PzGx0oiTHJiNNzf5ioF2Zw4w92P57Pc8hYPCHSKG3zX0EyHSeDX
	FuooBtunNA8TFNGIcAO23ylp6z4Gz/3r63LD9YFk/zQIfdDMUkMjrY8Jo/zjjDVI2jteUtK
	liCPF/2M144/9t7xlWcflFfOX5b/wCafHKXt0O+7CrdOBvxCi+ujvatfKIHifJSJ02rWY3l
	1tH47C/bYDV922awfzzFnEr3wQeZwD0LjkPgReBbMC25L5TjDaRF+EBMayv1i5Qm1ZP7nlX
	2cxArzYrXV2yTT38F8lUgdh6n781LcThL4ilKC1bPugYWqE/Jr/0kKoCWRx5XLZHRtmBlg8
	gKYJINdsDXEKCdqkMSzASoJybzhGkqfQPIgqagX5OmyqwxBVmSWncZ2Vc4eXPGSmqeRB+QY
	nblQizEWRofWx9RTsYJwShsg28sYVvvQxT8i4N7qvYtmhjynLYaSNqy4Jk5PX46/3oK6Yj8
	kFC7jyHEG3tcDqEnlkvgGcBzfcnebiD1GBSBHIBpSALYBnAqM3IdwuJ+rSHKNOw6kgrURKc
	zmAr3RLahbSX9Z4Mh06KxQSOJDGfhw42Y2wY/FdrgCEEwPo5aPupvCdc7Si+nQPsvu5X/xZ
	QdnadhZVjnMdJUuWJ5zLljga2iGPZ1ehyCe0tDYJuAQ1DXhZzIdcGRDtFK4bwGfzePoL46O
	XfNhwn/dsMnQAxjOA51ve1fn/0vXVYtKJ5k5iTnHdEPlCMjds26Uc0vPQETgNLAGfRBadTR
	ld1XqlAAgjq
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

This series fixes Kconfig default value and dependency handling for
the SpacemiT P1 PMIC and its sub-devices.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (3):
      regulator: spacemit: MFD_SPACEMIT_P1 as dependencies
      mfd: simple-mfd-i2c: add default value
      rtc: spacemit: default module when MFD_SPACEMIT_P1 is enabled

 drivers/mfd/Kconfig       | 1 +
 drivers/regulator/Kconfig | 5 ++---
 drivers/rtc/Kconfig       | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: b87881a3c93345252ce8559ad763369febfdb75d
change-id: 20251021-p1-kconfig-fix-6d2b59d03b8f

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


