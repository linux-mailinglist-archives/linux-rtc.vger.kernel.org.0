Return-Path: <linux-rtc+bounces-5680-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A28D01B90
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 10:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0BF1B300A9B4
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 09:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B0E36E485;
	Thu,  8 Jan 2026 08:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Ah9iicQ3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A329936AB7A;
	Thu,  8 Jan 2026 08:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767861557; cv=none; b=ALXgl4SYWsmlIBdsNEs18+EWeLCC5Q2+StMSyWNeSGXU4ZxvS+KNZEwmCC+TKVnFR50cEzIPT/NK7SvpDEBQlJ7+ihywioCQPuR1ThiftYtO7qm75QKUPmreZuZ48U+OCizyZxiXpwuyHFAMhK2w2n5XMLKITC1P1UMg5YnvXCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767861557; c=relaxed/simple;
	bh=IiRNSVJmhy8MrOZ1LUM3AjhCQcMWkKuilr5Lzf2ajGs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ji5DxDNPXUv6IKJp8Pk1GuopzNYLc3a45tHTzoGN2bZ9Qbs1SFm66IWosInHnpCivUwNa9Hm3HKNOin+HJCvPvEkBBb3PPVaFeEOyqTChjsW0EdZGxq2MPrf/yJzsEx2TI7dbUfNHlxGz3oZBpf8bFr9psxPNtxod8Dwf+70E/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Ah9iicQ3; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767861542;
	bh=oXpcYu7/BiXLtInxfeyZ/crAJL6uNMHTLPJTzMs80uI=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=Ah9iicQ3FC4MBCJuOlBQzvx9f2OoyuaUNk1OhaEFnGGLCej4C9YtW/2+icSg31C4p
	 7N/q2FE/SGJT11XrbhUCeDq/QD2rBaHFqcJO2MO0Q3kRjwG+4ENohOJ9fOKkD19RTN
	 4Nqm0RhHUF23F7337WQag33lhkYlH2AVzr55JQrs=
X-QQ-mid: esmtpsz16t1767861537taf7cee1c
X-QQ-Originating-IP: rdQrMLWx957NdWeuu2zefdcqwwSrn5/h1cgo2IbQ/aU=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 16:38:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8314994872385934692
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v5 0/3] spacemit: fix P1 sub-device Kconfig defaults and
 dependencies
Date: Thu, 08 Jan 2026 16:38:53 +0800
Message-Id: <20260108-p1-kconfig-fix-v5-0-6fe19f460269@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB1tX2kC/3XO3YrCMBCG4VuRHDuSmSRtukd7H4sHzU91WG1L4
 xZFeu+mgih2PXw/mIe5ihQHjkl8ra5iiCMn7tocZr0Sfl+3uwgccguSZFASQo/w67u24R00fIY
 ikDNVkMrZRuSjfoh5voM/29x7TqduuNz9Eef1QdE7NSIgeNQUDEZ00n4fuP07b1Jf+3jk08Z3R
 zGbI7065cIhkKCrwtpGSVfHz456Ooh24ajsWKsqb2pvglMfHf10iMzC0fM/2hUlWcTS47/ONE0
 31tGXFo0BAAA=
X-Change-ID: 20251021-p1-kconfig-fix-6d2b59d03b8f
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767861535; l=720;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=IiRNSVJmhy8MrOZ1LUM3AjhCQcMWkKuilr5Lzf2ajGs=;
 b=RLp6iu8x/w5+nOe4WWHQNaTOD5AC2s2LIosBXD/a6Yz1hezUBXGiId9ylmi7ViesR1b25DVvy
 +EkeP6Oe0D3CAZp5T6EiHELbz1ymNvZWTJCOaj6YdVKqutjRhJaKPMe
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NcdRvUr+zm/y2iZOWcnG/0TAszi5r1cwnKLKU2rss2ADESF2yg7dHpEf
	/yRV0zBptz3+wHDVCuBdBN4ZUXHptf/OxQszpM0Gn8Xiw6OvCPof3q+e6YJ+zMpUe8jI4nd
	36b2Fu1PfxcV/KtY+AwisijM6uxk9HUINUspaWZ35KGspGXnCruZ8NLWpvNax3Q0qUykU7c
	hjIkmoDTMOKGXBH6nAZfcccRsnbXvq1Qly6d92BwEFG5G/cW3ke5ogPRt63HlJAIbqbvHC6
	mxTS+nrMADks8MABBNu6DvVhnUsFMSjLnHRyMjG0DnlW3TAHaH7hzm7vK4Y2gGwkjzxmY0w
	wnji0JJSunu3s/3jvp8upa4zvap3FInJa3NYLYbIoFtNCTpqrEm1Wz1mjlLpEhZ331rRVX7
	7YL2bP9YoHsuXna4wUXVG3bAEAnklVVOKCG8jnoSxMJaw3LiPdBrN8Xdu/079B1BD+KfeJT
	16Go7uxQv5jGpr9T6Is2LIUi0zQnDmTORRvbBsUUCTP8efBakyzuKT2/MJQZMGRb3u4wfrA
	Wy32AUImRWn6EjK2yUPfYo+N7cc/q9BVtrf2d/RzgoLVqI+yXt/FYdl9S7jLE9c1XRGKm+l
	VK7r3pamewe6rmfq0NRdsn+dsmOxA86KyMPf+jleIrMlb5pmdyN0+BCzk1cklTv/mk62JS7
	+AL32VooOcSq7SjPRYdPFjTQLZPSZUI0SXksRyXFMDsQ1grHs1yPJOjJf9JFDfQmsh202Hv
	D+RrXK1FDKHazu4LlsIal7NqQQ9DNyRbKajmADWuK1nzOFp/ApgSP+V3NzonptgvWCHd71/
	3ig+2NVWBzq1JO3b9g8yRt5aYBhpmAaIW9pf8QPmw5jnltOo5CXKn3VZ/KyYrkntMyiUGpg
	TAJTmJ9jR4jrTOeEcZIScXcyWHjbe9V0y1XjBHwN1nzCd0A6aN5oK3pXNz/K+OrRnAUXL6H
	rqF70g7S5tsqNazNhf53yXX/JElFT5KyKhS6CajjI7eGa8p5cBClYgQRE+4mtsW4Cni7qBH
	SbSSW5/M3G9ynGji79kx+EwMGocDDZrJK4PsAEZt1WpCkBRIxZwjq7cV4HXzbMDr5HcEoNk
	g==
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


