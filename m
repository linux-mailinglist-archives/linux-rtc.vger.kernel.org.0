Return-Path: <linux-rtc+bounces-5682-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3681D02083
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 11:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFF673436C65
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 09:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B379346E4F;
	Thu,  8 Jan 2026 08:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="pd10Y+/P"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846D8342C8B;
	Thu,  8 Jan 2026 08:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767861563; cv=none; b=Cj8ehIcmIghG080lV4wd1ZTFeI0IOwTACWUYo6Iur74Gsr0bE3CpeNw9Y4aOeHevQQtxXavbA8dh6tbAD0OT7msr0lcMloVWyeNNXezTAqvuqBN2qI5f+0fif5f8Tq7QCtFu8+lrYG9L67WBMHsD0/LxrhChgoZuEbu3k229nBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767861563; c=relaxed/simple;
	bh=l0P1/XJnYJJjVLkQ2RZpYHnO+C5ScLPs7tmvyBIKM/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NdL070MFYujHd3tQwD7pKaS7VEW+g9B9gXnBt1PXxTjX9SihVC66pZSl7MDRM8K3OkuWovkPd0VKxRk18HhLtmyRH4bkvuhIj4AYzkHejv6zeSO+ANI7S9M8hFqGQAQRxBeSQQl93wR1dYlHIa/YMSCHKOCtXs5WFXhVSrd1Orw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=pd10Y+/P; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767861545;
	bh=sp5K3VkefrVnuWV+ys3nGYfC61ceu0DP4LhpEvGP00Q=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=pd10Y+/PPh+gT8uG0OqA9c8WzK1fKkC6CCeb/gN4AWxRHqfOegD92WKT0CAgcPrHb
	 DbnO67iTpSybHIjfcf2J4RJ811y6R89KVqfxPa5NLVo+zKR/CZUMDcCW6Ddy0bMXH3
	 4C6qFZKdHTSszve7E41IDhB4MP4fJ0u9Z0Jdiwig=
X-QQ-mid: esmtpsz20t1767861541tf3b247e5
X-QQ-Originating-IP: wz7bZD9g+XxhYcyVO7Bx85P+ibKdteFy0msASS7JnYk=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 16:38:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14760604461507898606
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 08 Jan 2026 16:38:54 +0800
Subject: [PATCH v5 1/3] regulator: spacemit: MFD_SPACEMIT_P1 as
 dependencies
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-p1-kconfig-fix-v5-1-6fe19f460269@linux.spacemit.com>
References: <20260108-p1-kconfig-fix-v5-0-6fe19f460269@linux.spacemit.com>
In-Reply-To: <20260108-p1-kconfig-fix-v5-0-6fe19f460269@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767861535; l=1908;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=l0P1/XJnYJJjVLkQ2RZpYHnO+C5ScLPs7tmvyBIKM/I=;
 b=ESyDfxPS8NIbcdtEszUGlXFzmS7z8F7hdhU6+rn4cXKnYF39eOKpv4J2iwqubimrGrG3fJUDB
 0KEedp49deYDsuGsUUemkfJaHHoBJAepDwBJ812yXU/a/pmCY1OrUeA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NvH2zBBgt3uTZrE2CnibEfPolk5Sb5p91tu26yEruP4sfrbvTjwn1ZhL
	rGZIQiuwBphNTISNvPwf6Ru2mL9UTb+GY3oN4GSBIMPUinBNfhdqcDaQ33Hy8tSmsb5Rabh
	jWeYcDPQKPR9lUdEvuFjvwDEYCBwiRHX1nI68r9Vbln59hP9C6UP5KrO8jTtltetokjf/3f
	O9/OdBIh29YjmHC/WB+oQXaNmp3U8CjwKKewAChDJTEWsGYnxe++akSdr6v6VGGj4Q3nLld
	EtWAUGjLM/xjDDmHc7cJgqb+pY6QWHrxXwz4BiPIY+NqtUbtAZ8TNbYLwpnYF9PXUpmzVCZ
	fzgoFO61W/Bh7Ft4zXLjxyMauugEpCJuCySpCL9hbgewejuZnbrPyAHvSBc0QMPE9SYg2JE
	P+JpqZgt48g5dywGD/8SVY/khQiiOGj+0F+l2GHQY0aUdKYLXFA0WbrxSGnKEO78gg2yACo
	wDfcLHbDMTRK42MYou2tmM9u9xfG+A6+l6FOISdzHgwlAOfX0/btfCN+YwUi+PQFJNGB5AN
	nsqc2kupqxoiozkFJyahXvW8eZPBZQx9CEh5pi2VJ6erx3+MrIlXoQpOIoWZCUBjxkhWJgd
	ECOE/lilpdaY7k+R3dwiKL4zVrx1SwicDV+vodyuQEvJPIJ4VZT1JEClWj0lRNhP911fLre
	EoWIFWvu72kl5+5EBoIeQCr3Am0yNM04bg3QRSA/Z2ApA88Uvv9aijymR7XQy9wyRChAe2n
	gqjF5SmtCZwy5TO9PIP+NWzuNsFZYldcVA+3ipczmMhXG3Aj1SYpUh5hRha1fsbaceT8eQ/
	1wt1vapFjlK2Uu5wLBvO7Hgj2/DrtHJ/u1lfn65djxmfKT8JpUxOU4eLus8Y8EN/3LV+/63
	PFw2UmA7/CILfGnEKm7O770GVQgyqJijD+etZx0ncV0ETCjnyt0MZTShq5OzUlyFgF598sn
	+ExNWKLwi2YBvc9FuTTuFOaHVYbFjNYnYaif4BuG7qJz0HHZEIo7o6LkVnXPi69kCJaesL2
	n3Gw1JFd//3HK2gzOK/VKw1QHncBw/TWubFoeOmHT3E00hEdBylGgFq3nGB0W+O0fguoqGt
	UdqL8jQ6/29fqTq/S1267kr6oOV9UnoM+2KDW8hxVgToXQ24v2rG9E=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
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
Change log in v5:
- nothing
- Link to v4: https://lore.kernel.org/all/20251225-p1-kconfig-fix-v4-1-44b6728117c1@linux.spacemit.com/

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


