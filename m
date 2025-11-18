Return-Path: <linux-rtc+bounces-5400-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A8EC67A91
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Nov 2025 07:10:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9D02C4F11F8
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Nov 2025 06:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7872DE70B;
	Tue, 18 Nov 2025 06:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="F2+PgoNh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFA82D7DE3;
	Tue, 18 Nov 2025 06:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763446111; cv=none; b=d1gxDjdum4EIckYKQIMQwxpx0nLaJNik/O65ucW5ChZXX1Bh82B6+Vu43r/ZREgXjuYaWIyU03TM+mbxI++rO7dyLj8AhM2pHhJVqiugoGpWyvVOPAixCfoYTqemTIW8OZWxw5rGYJdCpk2dtu6xMZ34QEf36olZuu5y+pWDigM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763446111; c=relaxed/simple;
	bh=yls6h80hLZJlTac4LUpPcWzxMBYeSjdLpDtBb4EbJJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dQ1XezfOdSCPC4esOhuB5Qm6ia838P2Pf1MDsv0zN/Thn7WjcdaQbgnVm0QpgNFG6BmcV3Xd2c4AwZcICBXx/RNdw1J6ioDHKq4LlJaAViUCKvV+//BB+03ElSJUm7DaaeY1zM4yHTH+vPcy2nzJRpNYtJgSy5Q0OW4TFzcr9M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=F2+PgoNh; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763446104;
	bh=/R28j+sip2o0AzX0gvsfJgIDgUWL+CJ2iEXc2U7oVtU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=F2+PgoNhtlvjmdd3cR5q4vYuuRa89ah9ifHpktOLRmNLc5pT0gtKEgE9OQ320uF2r
	 LdNG3NSSRJPA9lc5phvs/HVEm7hZreVj111bQCAgU1Rc4ugRpyQ+B71R0gxODtY39h
	 X9QuCQN/bpsRlbdNo4NwRi3TIdmtj1WZueDQcHIg=
X-QQ-mid: zesmtpsz3t1763446100t30a9d698
X-QQ-Originating-IP: HMfRSA0C3/bJASptnEPMikXz27CdD8G3z4bOnI6LNzQ=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Nov 2025 14:08:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16781449544636721918
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 18 Nov 2025 14:08:07 +0800
Subject: [PATCH v3 3/4] regulator: spacemit: MFD_SPACEMIT_P1 as
 dependencies
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-p1-kconfig-fix-v3-3-8839c5ac5db3@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763446086; l=1532;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=yls6h80hLZJlTac4LUpPcWzxMBYeSjdLpDtBb4EbJJg=;
 b=dr7NO2Rl2NS1SRL2NLicVgng+DpAuuG3iyX3P85oi8i6vmNxhMmIi1rQq0P1D0+kuhXx+lQm1
 Y6KrtgHoA7wBd6WvY2Hv+xJl6oQIKUsPtdxrlgjcjgrFughsSecOqyB
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OSVdtdr3pQUVVvFBu3XbEIhV+RJcOSON5Wsy5pTZtkzszhkQRcA/+tQq
	YX4vgCAvlHN4J/n3jz1rMX8jbVSesrZUMkSeY+Uf1fN9Qx3zasYmUZk5cDX+1Ilm03R9mFt
	tCKHex/XGh8wKv5YRTi2SV6/elBJKPH6QUbshvSToJxGMAbxdfiVIrM2ztYrgleqyBzp49m
	K/1odnumCs+EGXadd/CBXp/EQwfidK0A8T3WfHIigFJrEBkIY8eMUCQNe6VN2ZUtoZTLEqF
	HX1Q3TEg/0P0zbJ80S48lmWxSP5dciiniOK1d0917GG6ISRBbBylIp21jDFR/obKgEJvxpR
	kvcVMQ9F198obSqJra6p+rio0fCQHcaf8FSLUFotOzOLfr9h/dd+B9yGwgddj0pD40adnj+
	Xgpz+Gafc+puERBrpZHGCIJ2aTwXLFQ9iz6DJAtnn4BKyl51FbMju8Gxmf1sjSmYSUI/AXY
	WkTrTgviEiy7BPB9qCF9cTRpe78LbOu6lhK7GoQJQOHgMmMxlZrLvEeirNMu0NRmt9Iwc/8
	EidHrK3D6Ye2p6vhr6vGotMSc4/XqLyO9ES5Pz+7KARfO3LO+akGj9WVuG1i02QLru4d+W2
	norAie3/JUK9izgJB0+s+iw76/csyjR8pzT6kFOOvcQvnoN7dSn1O6NCcSoZvTY+WLN4IBG
	WPmMnbTcuDm2mymEtxY6heWVp7BMb39p9/LYBYut/r62MZyeKxOA4fKi92Dy7yVPU2A0T36
	xVbh6J9G1zuoPKy1tNs0W5+2A+n9/aO/rctp42WVPGbcTMQmLoYxf158DOQBSKLVNJ1h0i6
	oUH5xzXSS/0ehdI7V1yRxJnOEM4WM16Wk0FmYGcd5VruJttlA+Q4f1a80NQDYrFDvZ1TBel
	fE8kM5FzFcypP2P1rIS+h6+Yw1bYkysmLtSdtyaFz8ZADo/vyaJ0qqTITQSNnu5WZinSym6
	1Cdyy4zT6nedoabl57aa72E4Sct468tw7G8Ejd28FnfSR0Kn8xfiFgHMPuoVa+rztu/qsR+
	9Ubk4BHjwd12fGrk8zfgwfnHcCPelkkEw00aY/K+4CQWtQdyt5A9dCwR+H5aDXEFpFeSYhk
	iZHyJezN8KL3SNCTx4cRYaB9SNVdNeq/OjadiYOoM/4616eOLQboAM4fbCOu4I+IA==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

REGULATOR_SPACEMIT_P1 is a subdevice of P1 and should depend on
MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
does not always respect the parent's dependencies, so 'depends on'
is the safer and more correct choice.

Since MFD_SPACEMIT_P1 already depends on I2C_K1, the dependency
in REGULATOR_SPACEMIT_P1 is now redundant.

Additionally, the default value depends on MFD_SPACEMIT_P1 rather
than ARCH_SPACEMIT.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changelog in v3:
- modify commit message
- change default value from ARCH_SPACEMIT to MFD_SPACEMIT_P1
- Link to v2: https://lore.kernel.org/all/20251027-p1-kconfig-fix-v2-4-49688f30bae8@linux.spacemit.com/
---
 drivers/regulator/Kconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index d84f3d054c59d86d91d859808aa73a3b609d16d0..e2cbbb90500189a1c4282511b8d7141301cae1f0 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1455,9 +1455,8 @@ config REGULATOR_SLG51000
 config REGULATOR_SPACEMIT_P1
 	tristate "SpacemiT P1 regulators"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
-	depends on I2C
-	select MFD_SPACEMIT_P1
-	default ARCH_SPACEMIT
+	depends on MFD_SPACEMIT_P1
+	default MFD_SPACEMIT_P1
 	help
 	  Enable support for regulators implemented by the SpacemiT P1
 	  power controller.  The P1 implements 6 high-efficiency buck

-- 
2.51.2


