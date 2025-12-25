Return-Path: <linux-rtc+bounces-5615-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E14CDD778
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Dec 2025 08:48:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6405730014C7
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Dec 2025 07:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F822D7DE4;
	Thu, 25 Dec 2025 07:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="GwkSF15o"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BAE2E9EDA;
	Thu, 25 Dec 2025 07:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766648934; cv=none; b=i1cjSBy3lFVvwLXlVecWtmZYYTijMcnJs2vAKqBJNVhLkG0MM+lWNQTnILz8glYhm2BfnFuIbX2EhLadCFMZXV0wfiLOb/y/OgToqE/HxbH2aTtYVT+rcOFbW1Yna7um2qctjpyKPmtpS/wlfpcGQvElUuFgj4evk2r4zZgTslA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766648934; c=relaxed/simple;
	bh=iMg6wwDsweWCVKfGU6Yuji1Fc0E8bijBQy5ZTPi76/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i8EFPIAnemwjwqjJZFrcGuS0dy9KE92VaAblfQRxWuhb0+D7eC4QI2AweHo1FOvKv9iovF7Is/EZf0pA5HmxiAxoaag0SdR3cIOX5ggbwmfje0/hR9g8wgLQjVrbaP7tVu8HtPFiqiSNebm/ZB5WN3qAS0D8y7Xd6nP0WUFfyxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=GwkSF15o; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766648918;
	bh=Bt9+AAj1WTdGjnYn2EX4UcCvWfJz1QvVTOHob6fVY4A=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=GwkSF15ov38NXhfCzs4c+ngyZCg63HTZtgs3h0KsIYuOgfGVoNNCP9yfWkVxovIfT
	 ck5dGO6MNrnrIOcOm1AKvuThvmJFFUC7fQSYimvFwv9rmFzFTMlEsDXEOtBdb7fI+s
	 +ZhLZ1SWfWbQ+HAOlFAlQKIymXsUToNZEwOTTlp4=
X-QQ-mid: esmtpsz10t1766648913tcbacc2ac
X-QQ-Originating-IP: 3r9bwkTFX1T3U6eigVRSJNklhH7Vc2HXfb9poEvfdc4=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Dec 2025 15:48:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10865565144095889897
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 25 Dec 2025 15:46:31 +0800
Subject: [PATCH v4 1/3] regulator: spacemit: MFD_SPACEMIT_P1 as
 dependencies
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251225-p1-kconfig-fix-v4-1-44b6728117c1@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766648906; l=1771;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=iMg6wwDsweWCVKfGU6Yuji1Fc0E8bijBQy5ZTPi76/Y=;
 b=wi4kT3hFhqwpJwe5zdJD7BDfxtV7mw+eeGP0USovdXh522DDsTRZ6aTn7PDACALex4Jj1EGZM
 1er6vMpLut/CwqOy8VimKPIom+Y7NS8OivrC7pJsJ8BnVmVjD/e78ZG
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mvo1WeMpZNlutgRoldzu3w3I5YeJDG/2TAbkmpNI7mufP0MzsQBij8ry
	eNOB9YP6WCew/VIwQD2tnviqMRT39TfCNSM1+72GNXn2Z5TwJwCUr+s8tfLST9f9aW4tndj
	5xkUwsm4AO9hy+FciWG4TbTitgW7w+uI12SScjNf9Uc7KdfXoNYX+nUGXHvJiNLblhJO8hM
	3ph1d8YgJRcxZ+jKmxYv59YciP0nVr5T2i+u8YCMk2BO/clPLTSdHAF0fIF95KfM4wMdNt/
	oCRpRSV4iBEMeAG57rpvcLu6isN8JFQialPbwumBD+oKvOAPbtFPtSWCUVYQLC8ftB526Ws
	MeWatb9xF+Z7m7Mc0VDjtkqr1RqRrqukuw3TAJ/tLZP4y6o+RlDK+q379U8s9jZFGu6uocE
	d0qOEL4UYi+VRSYp+BulBhyQiAquVCBbLVf2yrbMxuXOUPf3rcBflv2+A4QLOBfK34ydrT+
	3iOsMw3x2j6uWgw6W7WC34GwIFWaH3+roh9UNcOYJXWHXnFcCCzEGwHe/DMRi9NtC0gpBdC
	vLFmGEBh20a1l+HUMApT5PYSZG31OM9HPxt+lbEmP4waIW1T9vq8QjyiW4IFVA4vemtvycz
	jX0/wvqjElO14IlXJ/PY7O7TsRipIZot4kM0Bqr51f2/IHhfxNryn+hnVRYUmXPt6BxWoaI
	33x1NklUP0tydAdqzauBmoHmhmXqCl0R9dA6W2LLGg2OL8x8D5q29obpdAu5yHUrv8XJUk0
	xPVx4L0q+iDqWpnwfPNXUQe2HFgV1wcYAl8Ddddm3VaXK+EyT5gUHejJ75WIRgJ27UII04Y
	VX9nacwYaUE3GEgIbybgrzRSyKReudRpDOPIf0Oe8zuBRVfT0YKOhUGQv9+4rxUzC2DypkH
	rGHPZ5CJaq8NbeOfos5jYmEvfZ/yZZ42WJeXzz4tWNq/hdXzTIzJmyZ9cuqmS6xvjNs4RD6
	/a5boNjulNrQziRXZco1zSV7Urmrz/oZktHjNHEFZY9uTsoQ67PSrHM3wPhYvaLnpVPWCVY
	QYR6ckKoZxqFZaAxeD+yQoOxA69b2Y56yu53v2qIRJfizLFEi34tdODGiohNulUBDg/T1cr
	2QbDamExugapmGYa5Ia8f1oz6I8K08RQgz7ebFISZZXnm7O/lQk5HsFvGQPaDtNhc0R+kwD
	GGn4w6edBTkrcHI=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
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
Acked-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Change log in v4:
- default m if MFD_SPACEMIT_P1 instead of default MFD_SPACEMIT_P1
Link to v3: https://lore.kernel.org/all/20251118-p1-kconfig-fix-v3-3-8839c5ac5db3@linux.spacemit.com/

Changelog in v3:
- modify commit message
- change default value from ARCH_SPACEMIT to MFD_SPACEMIT_P1
- Link to v2: https://lore.kernel.org/all/20251027-p1-kconfig-fix-v2-4-49688f30bae8@linux.spacemit.com/
---
 drivers/regulator/Kconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index d2335276cce5ffbd500bbaf251d1761a9116aee9..b51888a9a78f399a6af3294fc19f60792576332c 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1496,9 +1496,8 @@ config REGULATOR_SLG51000
 config REGULATOR_SPACEMIT_P1
 	tristate "SpacemiT P1 regulators"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
-	depends on I2C
-	select MFD_SPACEMIT_P1
-	default ARCH_SPACEMIT
+	depends on MFD_SPACEMIT_P1
+	default m if MFD_SPACEMIT_P1
 	help
 	  Enable support for regulators implemented by the SpacemiT P1
 	  power controller.  The P1 implements 6 high-efficiency buck

-- 
2.52.0


