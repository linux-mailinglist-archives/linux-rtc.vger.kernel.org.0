Return-Path: <linux-rtc+bounces-5683-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0D6D01B96
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 10:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A35F23008CB4
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 09:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5AD2DB79A;
	Thu,  8 Jan 2026 08:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="pqPlz5/m"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A6534575D;
	Thu,  8 Jan 2026 08:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767861566; cv=none; b=LpLWufcMfaDT1810mMRk5uAZO46SvabJaJ7Wiwn3iqlOOW/viaLeAzW3lvNzmh82vVhNEIz4b0sRpJku17W6hYLt9mRWh6+/ktsu11bs1zs3IXSJ2Xc9m5LvMdrXjzOrjzeeGu/tqpLDCMyAHm6oUG3jP2Fg7qM/fn7UfsZLGiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767861566; c=relaxed/simple;
	bh=SwCXuUmIT3DgySnnl02i2vZ2GAlXrZQWhCxKhnIHQzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AWhN/IJyBUjAB47x7ZKcMCzoF3OJuS2TqoLkfgqpsWQfPOQ6r0OMcIUy+cWfhX1REFILZkE50YYQ2MuPbA7hlvnIor7jzqOQM+B5Q1Nsr6PL8cLQxdwIoNyAKql7EooktNTlfw5BBiv3PsQgiZvo92CtaqtQ2adxkBh5ij92o70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=pqPlz5/m; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767861553;
	bh=Uvn8s4PS4Zfv1GYnrb8c0wteskQ9xtzXuxq/XnZHJDs=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=pqPlz5/m9p8PdOjQkiOHzVkLFdzGjMZdt0sk01HNY1mGTnxXQWQK0DbUFsZXEyEbt
	 L0kEa4wOrtaLCOuorkLTkVKfi14nG359xtVA30+HbugO47Zp2aMs2r9J4t6DJMXZzx
	 NkwHUk1S+5OiX9VDFUerdF1O8ZNy9mKmk/Q5ltso=
X-QQ-mid: zesmtpsz7t1767861549t562ab659
X-QQ-Originating-IP: JrlKtLWhKvgKg+YK19bVS6mC/dYvL2/Cm3SMf/hzeYM=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 16:39:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 140231474234214423
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 08 Jan 2026 16:38:56 +0800
Subject: [PATCH v5 3/3] rtc: spacemit: default module when MFD_SPACEMIT_P1
 is enabled
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-p1-kconfig-fix-v5-3-6fe19f460269@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767861535; l=1183;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=SwCXuUmIT3DgySnnl02i2vZ2GAlXrZQWhCxKhnIHQzw=;
 b=YbZjoRK8NM8bVAyK8aIfaNYf9Vb/qa18H4zel5cD4wDS/4ONVTeXqbqNnCVdbN9McAEmfTJXS
 RjNR5dbb9CEDjXIJlTwDpw4JaRMChxvTDGYTrtZsJsbKtsaCH6bU06L
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NmocKgWceFfAXgqNkmF+rHuHhtbMvcaZcsrdLbBhmFuncpb2SJn8wwxG
	07baURD5RuAc7gGbv1LIaWBcWAYrHUYNO50Y5BcV+Y1GcTWO+kj2v3ZXwpwDpJGbXe59dvx
	KxXpt9/hLVUz37j1INQ/zcjxKqa2MqJBCqfhgu8xm3qlvoM3YfblehZWFduZoS1Ws7H4v0Z
	U2dCtfjB4T2YuGEZyxUqmd4QZjgQ0MPl06ibX+NiCWpA/Rb0tACYBA9vz+eMSkf8vVV+WDq
	WMXRFuOaqIiGbgzH4+HbRt78J63JlDMe1nuWGR5iHPS8yR9EG8xZtkGjsemRYJL7xTQ8rhh
	LNA24mM2tYIx4NxOBPKi9KSysVec7WJtQg5PFMHwy46pX91j77rVJGqzAQxfUCwm8btTpNv
	b3guz5mGFBDwMKOFk7v5QSDDwhYkg7euz7pRscqPmw1mQQn1YGm/EDZVx6NIHSkjpOx9Mdp
	Jnmfh+V+v+G7KgByVssxSVk+4VAArAJZMYoemOBM2vB4IZ3ivgM8TWO32M24Hh51awTDC+n
	BltdTCMjiJbTcs6huVw44smUcJ8XkN2L9YxHjA3/G53WLsf+mJQ1eE7+arc/O8hXrZ1vnfY
	6oI6wsAz2yEPU64cvzhL0IZdLT75qUs35W0WtuqR4kbz0cygXLg9ITPkBt3HcwPF5ESr1ka
	G2S5Z56tZPPxBzF6sKdC1CmrZyTScEeY7D8+YXj1zeaQ1esPxwbYCSazWKExQJgfQo6IsEj
	3AcZne9mwjJ8/a0uUIx1/31nI45XWvzQmNhkAxdR4rU+Gldrg+Qy2vBJoo6jV4jxd/pqK5M
	w/ZcDMBXGqRz1c9uBMb30DEw3AUmIfAzxQYki8ljH15NlZXAnU40zG5sw6A4M4twCc945zy
	5uzdhm+q45ZeoEHK6J8ArdZPXHd7gDDWq8j2+zxSg0cI7idrpZJhcHQB1+EFJctfHBpiU+Y
	ZTnTl9TpG0lY8Qk3LV5MQbOJGAAZ7GHqsN0zoU826HdwtYDmpa6IMqLQrodrW4RMJ3aesS0
	lrfldw1jGXM4gezk8OzfNXf9TkAFFp61tdNBpeHKO7SG92w8B6c8tKNt0ocO5ZC17nyz9u3
	CQzhgXQd75HiVh5EuU9ZIWFBWGchXMLN1F9/D862dC/
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

The RTC driver defaulted to the same value as MFD_SPACEMIT_P1, which
caused it to be built-in automatically whenever the PMIC support was
set to y.

This is not always desirable, as the RTC function is not required on
all platforms using the SpacemiT P1 PMIC.

Acked-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Change log in v5:
- add Alex's tag
- Link to v4: https://lore.kernel.org/all/20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com/
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


