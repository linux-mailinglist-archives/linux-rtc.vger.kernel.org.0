Return-Path: <linux-rtc+bounces-5616-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E596CDD781
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Dec 2025 08:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C0453034A18
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Dec 2025 07:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA722FC890;
	Thu, 25 Dec 2025 07:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Hc1+lb5T"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40199217722;
	Thu, 25 Dec 2025 07:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766648937; cv=none; b=B8esO4xcrvo/bnrKWnW1Hd52upPk5cjbLqa2+Gv6KbjZTflBmSqlnlhJmQIn/vSDd1PRhCY9FOYAxDmin+x3CQEmwCG9HcjpGll0bPndw0oRJ58PLUTodelyFEwkcqoVcvRhqP6F1QxSp9Zr2vKQCU4iof7nmoCVyaZG03/6U08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766648937; c=relaxed/simple;
	bh=xM27GTuey2voa4c/ivGBVxMn1od2yxNMdtHcPdo4Cco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SoqZzmUHQeZn6tB4KaWrg5d0/iYzfXiVRaw33CHte3s2BND/KlfD+4xyv/2qE/+vaoHXGbg5T5trAkKSI6iymbryehQ2abOGC9kbL43nw8dfQnTaOeROgsROCsagWKVi6y7sTaKsrjgX5+e6cT0U+pENX41vOom9CALDb6ZBmVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Hc1+lb5T; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766648921;
	bh=eEymra0qzBDOvP4K/PwzhLAzm6ZoyhboNV8QqUN0V+A=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Hc1+lb5TNeYt/9amRxvQ/hYEgB11Jk4zF/xEpLyScDnsCm1/e5ADv+udxRZByPosL
	 zvRJ6vGcSYWhxj6UC2CC2fbe26pkgbhZ1dx8bKWBrEaSs8GIj3FmQ2N0knysY6s5Oh
	 TEECKO8eqD4sT1ufEXHAgYAiEgLqh3gs3FjkQYRw=
X-QQ-mid: zesmtpsz6t1766648917td0345b37
X-QQ-Originating-IP: WYKXruI1A1CMaQX4ORLBBq/CCXBheEu1KxZcpi7QXFM=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Dec 2025 15:48:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5726861883151983815
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 25 Dec 2025 15:46:32 +0800
Subject: [PATCH v4 2/3] mfd: simple-mfd-i2c: add default value
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251225-p1-kconfig-fix-v4-2-44b6728117c1@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766648906; l=1007;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=xM27GTuey2voa4c/ivGBVxMn1od2yxNMdtHcPdo4Cco=;
 b=mUhg/yb5BZn95GBRopReXfuKzpAZupqgNvD7KcYxDGkydKAzmuR3gi+K+o7OKYUjsPAQ6g54z
 BwtBkPoioIWCBjpWCzP9JkBcAvMKxxtQl4Vfkg0EubnaBOz0HsqfDoa
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OKhy7fcgXWEZWXOXrUYIaV3PPN1GGl5g4Grl7Be4HHnZxBHNIzfZAB7R
	J2Z+bLjcn304mK7WFDU6uU545lrHzX6TTht2pjpTZfikUSxrFiXv8X8PSPMw3C1c18XrCcp
	sk+FyCXMGwdba0u8j3Q7JL8ygWj6hsbzk42V/1ncDpyFAdz4xZnTtr7gzBRg87wh8sHueQd
	vqJase/flNCI5496fKzhnV5JDNRkoUzxwMkEf1HoW++KdI5rDyVGZU+N4i+phkUNSWGCsXu
	9Oj6DWzK5gwIoiKWlBtlDDOPCPZyNNS4FvPImEC7ynPmarKTNe3/NKSL3PJl7278IWaA0Fq
	0WS+gtl3TZktu8Rl3fiPvHGyJBR9tmFLfyF3Afk31hGKecKqLgTPYhDuveSiFlbfge35Qx6
	wn5U/cSSmsrnZFJcLO7KW9y0sk1HVFrQt3oIQrkjAJFIdfe5q7JIbDiW2tDCHftCgt7Tp0R
	wRIqetEjlxW5fXNwJ+ooC2SrN33C9qgaBUEeW4jeLDuan2UfYRsecppwmKt9H7W7slU1WcQ
	n+y4BIJLp+er+eIaYr9DD20hYgDUHtPShTe9lMhY2s/30vjlSZ7THGtc+W8fBFylHspaKUk
	J0z0WCusPaV8sqOdKiIN/ErYSP5le6z93/e5grNc8ImyNZsai59fdXe4WZwYg7AD3W5R6OK
	ib2kI7oFnHC2u2Iw+pkA9bI6zGogBv51JTPPjNRrlrDrBrWdAor04bhZWfHgJCmWmYYGBbR
	kTb3EURCH5msXxDafiSUQ4PROPWZakd0HGh9CCeluPjc0TbIWmVbkwDyRIZoFY8DSYhAACI
	rUDCIw5dGGa/p6H2wP2+/sfaiAqYuAoN9t8D/EQJEP5Y21GvD00zwc7WFl7py7Z7B0X+Nl8
	QugZMpdwLz9p0GTDZ+lsvS1E57BiCzNpdXFVaTkXIbCoZNNjX2rQRyQwdhKY6zQUYg4Gya6
	4J1LiIR+4gb7vk6zVNLFEEFgf8uV7GxFWfqWcDL1T32nQU3jSxXEdj+kq0p2en/0ZLYSTFu
	yQp2q9fY1TyhFmN2Pc5EJLFkGYFdiRWHawUiruBhV3dR+bK4PF8kuIABKw2u+YB1KnZpWJN
	PjfMN39GJZigRCw4l09jlV+63ecd17UMXr3u7qEIx0HYnu/ho2DrV7RAY7vwOapTIRu3vLr
	fDmJJE+Ep+gU0F8df/7CKTC1Kez47eOsGOtCeoqvBZt3/io=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

The default value of the P1 sub-device depends on the value
of P1, so P1 should have a default value here.

Acked-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
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


