Return-Path: <linux-rtc+bounces-5397-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79531C67A6A
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Nov 2025 07:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id C40DB28F77
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Nov 2025 06:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F5802D7DE3;
	Tue, 18 Nov 2025 06:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="ijcyv0Zy"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A20428488D;
	Tue, 18 Nov 2025 06:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763446103; cv=none; b=Q60Qrw2dUW+2XDVFZ5ou0NOKod57KrrORvpfHuA0z+dWJoPEHfa1N+OIVx76MUISHLAkZHAJXCEm6CWHGjL5mqfj9Fh72gXcdMsApXYDo/nJlMgt7PTlpjaK0BGp9SMgkboD04teem6hZJs5LQEbueGc8cKO6oKvSqb9eb969yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763446103; c=relaxed/simple;
	bh=pRelXNcNN37ZM7O2BV0S35r975DWh+ueu5XV8SMlrBs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UxDYNM1MiB8SFvUtRm+JAp/tiPJRrFj9AUO5QAjDVwX92nZvaGB126/0+ANQoxqaGlBL9XMnSzW8TVLbbeI8iDss4r84fbmKs5IzsBqh4OO+tR3rnDtgAXEu/NCZgApLGpEQJx9aA3jqkeA8jodIiEz6J3WDJ8iewhQqOvOoAPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=ijcyv0Zy; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763446094;
	bh=hzOfPR919VrIHi152EWvE2Bp6APdazRwuR4ex5e3Hbw=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=ijcyv0ZyQdx4/Dt2OxHp8jPOM1LAgKSIiUdc42cJlIyPNdbf3lg5+HYdO7XHz8kjP
	 lmkJTDdaE+DTp91FiYxl6XZLlFQYcBzWOiqmOLNlaexxVF6ORcmZakpFjA1oooudz1
	 3EInMnyM3UOujF35fyR8AHe4bBkjK1Jm79Wm/8Dw=
X-QQ-mid: zesmtpsz8t1763446089t05f7671e
X-QQ-Originating-IP: gfIiIDlmEa/nlrPhq5QOGcUUZldrQI1NIAYC/9iO1aU=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Nov 2025 14:08:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12746656525817130818
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v3 0/4] fix the SpacemiT P1 Kconfig and resend the K1 I2C
 ILCR patch.
Date: Tue, 18 Nov 2025 14:08:04 +0800
Message-Id: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEQNHGkC/23MSw6CMBSF4a2Qjr2ktzwsjtyHcUBLCzfKIy0SD
 GHvFhITow7/k5xvYd44Mp6dooU5M5GnvguRHCKmm7KrDVAVmgkuMuQCYUC46b6zVIOlGfJKqKy
 oeKKkZeE0OBPmHbxcQzfkx949d3/CbX1T4puaEBA0pqLK0KDi8nyn7jHHfii1aWmMdd+yzZzEp
 3P8cQRwSItcSptwVZr/zrquL7HQGtj9AAAA
X-Change-ID: 20251021-p1-kconfig-fix-6d2b59d03b8f
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763446086; l=1635;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=pRelXNcNN37ZM7O2BV0S35r975DWh+ueu5XV8SMlrBs=;
 b=jSJ9sJxE6RX5av6jM6BMhL0iGQaZppaNPJMQJNNU9u9qR01cb/m3k5HQIqRhqBGGXg1KdD1y6
 xz4wUtB+mffAgOu9cOkDzl1KmjRdAqngIzXfCp7HEC7e5lwlCuEVn7z
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NioaTWkRhWwabMl859UJroPOUZFJLGvVRGATXzj/VbNitmwY7J8imLPz
	i472u+81WFRp25QRQ2gvum/nHUfgu1n0cZM9eYE1nwmM6JClmWbYXu1SJsrKO1z44Ie/v4G
	WLhJJjMY7oBDvDgp35f1VpxtOU3fHn7tM3bCHc97dTYMS8fg2O0P9FeUUTGkVRKl89yFcQC
	rJBBNZrGoBoFJU5AjTJ6c7hAIMjVWlmqsIuaA8jFOaZxwDmctMdT8KlPwfpl5YUhTJQAzqD
	ospYX7axHbsAEqaa3GO+NOq4X69qQj1rhZTcW3DZwihAsc6buZXn/eIMQ0qQjC0ngr+8b+v
	UAmem6RITRlr2zSBt3+1MXmv7T3l1pXeSErZMYvdGPKI9JGpEzyclMBLA/yQcDFbOnnRdX3
	s6pNsGVubdoLFbx0iZvgd9r69qsIXyIJUDU+YjU1A8aLc7XsYMj/LZ8sgH/E2v2eTV+K7o5
	USrR0s9p4lQVhNfriZYk336HiF+ZN4kFRrmaCrHj41DkhGwJGa5/xlIFSyBi6JQ6bLkfkFc
	r1p1q1If41WR8sTz1rzD0xLAzG0fc3Rs+piCz4UEc5pm95KH7mQL6DWPMgIfyKvWlC7qhu8
	bSgWmIUnDGvTzMUaVpripiiOjZW5nNtLQeBR66kakvG6MMbqIrhwm2XXLbjwhbgme59WYHI
	PtX/QEoomsfTMzAeJEMk9OzN4I6QdpKGvL9BH8k/6XdJToJKxGy1a/ViFCv8yU4kTWFz/cA
	px9AT/3pyd+D4W2ZqEj6ZUaGDMp6BcjPn7QeF3ZK6WxNqNeeE9BrWDRFFb5Si41DS5aqEtI
	lYz7JqS188kB4PAFCjfdXVHw5IlwAG4ftnPInN0MPbvJFgrvy5sBxoWL7JnTVOS9mzpqv/i
	eSa9/RDiqw7dIeTSJfFWyc2jzU/kK22z0oxUxIMnilvSDf9fs3DbKzmsVTJpyy1fHWOWKDX
	0Z9KamhRB3pEtfvpUBjjU4CA2cnkXTb/bDrFqSBkXLOkBtFHiHRtlRkFj4oEGW7fy/oqsVz
	KMmmraYXRoiFj1sep6BYb5xVBb7LN5tP0HDqgBdFMaCLma+1yuBCoenSyzV/2guwi9CJs2Q
	AJvc6NTpqW7gjlYOC5DvT5CbZMLO9Ru0GHVo91DNPUZ9ltZPwE7vIUdNju4bZMriCQ5KX0D
	iF0z
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

Since P1 Kconfig directly selects K1_I2C, after the I2C ILCR patch was
merged, the driver would fail [1] when COMMON_CLK was not selected.

This series fixes the P1 Kconfig and resends the I2C ILCR patch(This
patch has reverted by maintainer [2]).

Now, P1 Kconfig patch has been merged[3], so I2C ILCR patch can be
merged as well.

In addition, the Kconfig for P1's two subdevices, regulator and RTC,
has been updated to use 'depends on MFD_SPACEMIT_P1' instead of 'select' and
change default value from `ARCH_SPACEMIT` to `MFD_SPACEMIT_P1`.

Link: https://lore.kernel.org/oe-kbuild-all/202510202150.2qXd8e7Y-lkp@intel.com/ [1]
Link: https://lore.kernel.org/all/sdhkjmi5l2m4ua4zqkwkecbihul5bc2dbmitudwfd57y66mdht@6ipjfyz7dtmx/ [2]
Link: https://lore.kernel.org/all/176244506110.1925720.10807118665958896958.b4-ty@kernel.org/ [3]

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (4):
      i2c: spacemit: configure ILCR for accurate SCL frequency
      rtc: spacemit: MFD_SPACEMIT_P1 as dependencies
      regulator: spacemit: MFD_SPACEMIT_P1 as dependencies
      mfd: simple-mfd-i2c: add default value

 drivers/i2c/busses/Kconfig  |   2 +-
 drivers/i2c/busses/i2c-k1.c | 159 ++++++++++++++++++++++++++++++++++++++++----
 drivers/mfd/Kconfig         |   1 +
 drivers/regulator/Kconfig   |   5 +-
 drivers/rtc/Kconfig         |   4 +-
 5 files changed, 151 insertions(+), 20 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251021-p1-kconfig-fix-6d2b59d03b8f

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


