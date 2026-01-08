Return-Path: <linux-rtc+bounces-5681-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6462FD01BA8
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 10:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80A0B302218D
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 09:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E21346E4C;
	Thu,  8 Jan 2026 08:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="i1W+pTdJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDA3345738;
	Thu,  8 Jan 2026 08:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767861562; cv=none; b=Vkve3lguGFrEaj9yDp1qV1zISgRI8b0ZV8DC+n2Cs1E9dzHPQjOOzG2Q0LrhK5DjpHVFBe9L0Gx4JD8om3g8HFi2/nhsmg8cpQoAQxl4AKCN2UaH/5f5Ew6rSFWlxeqwAQiQerdzgS//bW3sYp+JO7BOtB/wGV/aQtBjNt6Fk/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767861562; c=relaxed/simple;
	bh=f4L/DsZdH7YPl/4hbvzirDWoiAM8dIkuN0CGyCu5Jjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t5jJiHmHIXUvNk+SSCVR1Ad6OnysHwRy7AVSlRO8350l+Zx60QdkLZZ6kXBEF2cSKCtIShFoPauj0gg5Ztl82IOFFyjMQZjj3xOzM6kpLaP44WdyFd2cZorvnY+JbHij6OEHE8Zckd2N263WLKlLgBT3Dw5KiSFJRjgpICgauzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=i1W+pTdJ; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767861550;
	bh=bhWQjwHsWGDy9Epy5b1CqHXWSTOBB+JGPvA87GRf/qw=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=i1W+pTdJL2YPOMm/IfkndnuReiGH6MpdBPVf3BVCtrzzAv1go+iUXTb9fy427vOZR
	 qQbiOEOFfHXfdrw3f+5xnVmy0XvRJgj5vqP5JM/kzxNG0nDUDZi7CED2DozvgrlM/Y
	 3a4EGlAmhsbdAYo7vXf7p7qMkhDOWHy69IuGsF+s=
X-QQ-mid: esmtpsz19t1767861545td8db11fa
X-QQ-Originating-IP: QUCW5A6sCbIriSA6aa5p7bzPKIVx7LKFVxD+up/whCw=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 16:39:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9751466037048988391
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 08 Jan 2026 16:38:55 +0800
Subject: [PATCH v5 2/3] mfd: simple-mfd-i2c: add default value
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-p1-kconfig-fix-v5-2-6fe19f460269@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767861535; l=1144;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=f4L/DsZdH7YPl/4hbvzirDWoiAM8dIkuN0CGyCu5Jjk=;
 b=4Nfs4psnPhhVx6f0KZktEPb09B9yA2kw2teQmc5K8ZsYHRWFPUq/hYSe9qt6oJtkrtTVVig7L
 7t7FxHl2PPZDhAsdSncvz9C/JMr/LgrSGngePQSgkyrcR9XskgORs1n
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NxXOwrf201y0P6EI2mNhEBo/K9Z4iE5zZks63XJcpH1mKX9KoL3LK3ax
	wKPoJT5wXzb8GQZzvldJ6wTHLI8Q89c6Gza6wr5CPL5fjqyhh5iQcGQRh2hNXY5A/ePCS+U
	Vadjrr9B+TJ45tO0ZFKT6F/WZNSvde/3uoRPuBqq4NZ50J3KuGlBzQv2p8eAsE/qWt01IvT
	FrrSCajydgNxqBBjEo5faOHlKAtQGtMGLpBWged+KuJYKycVNRSzI4mq5HHoCq+E7CBRzlr
	24wkA3VwK43ovKgCmP2kaxMlvITrbi+qFS1qCNrfhdFuhVNuI2h2Rb5DqulJrsdq8IkkDxC
	U+upSZM7eAo8ECbSydB6p8sOSMYQ2QsNtt8EwFMgXAOR1ggQp0rgY3i+noIRX2JfmC5tq+X
	clKOwfWzCDDk1/VMWoUPLNqF5eZ043gxb0FHnkniXoYIBLZWPWM6X+Xk4Ge7A/FfpXnpIiO
	cgHebcuJ6Y/wX3OAEYgruGcHiyPNW+9iKOoYWK7NQRrlyI7upG6Yptz+GXRSNl3iN1uEwEF
	5sh7fRs4CUn15bvRgL3j/K9RGUUH2B3R0Ppxg9a1Yhjm0DdfNGMTt7VAlDXIAHzr8dBoikc
	BtIrvTz0WklNkcTWXcKQF51PKdSOoI1QBkyLSwSKl0I0Y+skyTyBoJMeVwRsBMiL5pQ8jHG
	nOmwuYQ8b+YbAeMLyzG/xK5DmZ5KotTZz7sWm2g+Y444eGmbdRbyDFnXLaT7Zgr5njq4tZr
	rTmECtYK/IBpvuSzoBCcBV1AO0QwW/9dgdvLE+vjFR6x8szYotyePouHGUe4CeZ7x2M2J7z
	spmWlSQKH1/CsJtppBDB4g0+ONmIxJF4U7SnPys7in3a1dVfWVSh3LtM3KeV4zT+G3ph7PQ
	y4ASUPKTdUrkL2QQjrjL0HBVDDgfyYZhmzLZSR8LxJ9zktwPY/P8SYsTMKiH/kzVtyC0AQz
	jH5tU7wAAgy1HQDEqRhkvrW/Mhc5VTKxge4mSMUNxeFr260lSL/99O4NNJJjVbSTDnHxjNz
	wJXGFBrMK3SOdBsrLAxEVvAlw99EAbCbOrH3hxclfnFV8Elgn0X/ej37S9DLuxJMjhLyAZe
	eaUW99JmAX0h8TglAPRJL985Tc6ha5pEg==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

The default value of the P1 sub-device depends on the value
of P1, so P1 should have a default value here.

Acked-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Change log in v5:
- nothing
- Link to v4: https://lore.kernel.org/all/20251225-p1-kconfig-fix-v4-2-44b6728117c1@linux.spacemit.com/

Change log in v4:
- default m if ARCH_SPACEMIT instead of default ARCH_SPACEMIT
- Link to v3: https://lore.kernel.org/all/20251118-p1-kconfig-fix-v3-4-8839c5ac5db3@linux.spacemit.com/
---
 drivers/mfd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index aace5766b38aa5e46e32a8a7b42eea238159fbcf..c757bc365029dc794c658fc5b10084a0f29ac9b6 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1276,6 +1276,7 @@ config MFD_SPACEMIT_P1
 	depends on ARCH_SPACEMIT || COMPILE_TEST
 	depends on I2C
 	select MFD_SIMPLE_MFD_I2C
+	default m if ARCH_SPACEMIT
 	help
 	  This option supports the I2C-based SpacemiT P1 PMIC, which
 	  contains regulators, a power switch, GPIOs, an RTC, and more.

-- 
2.52.0


