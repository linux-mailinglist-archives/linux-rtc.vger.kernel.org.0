Return-Path: <linux-rtc+bounces-1350-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7917F90D557
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Jun 2024 16:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0C0E1C2230D
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Jun 2024 14:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB23C155C96;
	Tue, 18 Jun 2024 14:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MDZypJh1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF83155A56;
	Tue, 18 Jun 2024 14:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718720348; cv=none; b=mzQuAQ1l079o/Zzw0NLbVwMoURczmxIwEqA9a20WjihUhKoETxJahX/QpzAkaDesOdtojNWixsoK9HuJzoa4kRon7rg9zHCzg6vgsnmdt8kMrg7CvFBUauIZim1XBNfKjwrVVAFnlhhCgn7M+fGR6eS2wxDolx+LQFeOihJRHKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718720348; c=relaxed/simple;
	bh=3q4E1Yg0D77nrOFykHyo9O4ie2FnEOchmgONMr8mB2g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BJsjqMvmY7IrqX6r5qo3cXI4vGHH1+Q5IzB3A/jSl5LK1dNIWsaXpNEeSI8dqn7u9H8SiIOozbhB+WP71bz1OmUL3AEKWBUSGlIAfvwHe8KK111oDXNFaZUfmvOFaBzeFrl0zoG5xez+JqLjzpABmJzFXXCO1NMbPl4ZYoGOET8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MDZypJh1; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CE5B1C0002;
	Tue, 18 Jun 2024 14:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718720342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gyL/hw59WqU2reMGUKBGMooPbHmAQCDP31Jx4rlQFm8=;
	b=MDZypJh1alvXt+BkMK+ZSeTMTlIF87U8/pjpPaFhHroT+PNoT7pgzaMBXpZxecE+evTAMo
	0wsAEN2zm1ceqcTrhyELoYzVGnDOCnFVxAwNWISGgBCQ+Go/E5g1jDYvV5cuZF0OoUt92Q
	2qdwKwOI8LWUi4r7+c5P5Xvxjlo8kAuHMcCuw1GrB0KvtxKHFxxOdJS4iDe+/dgrqFn5FM
	PVCQCzzcWVo2Eqigiu9nypBq7GhFnUy+ygXxfFsvJjDfRKNRP4ZBbtRmHB2ACItvjwDX1d
	PlYnL0OhbbIOqCWIh1GGQOpYbC2x5SXIc/cZ8gLcsFK0XtLwZ7OHibA10TtK2Q==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Esteban Blanc <eblanc@baylibre.com>,
	linux-rtc@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v3 0/3] rtc: tps6594: Add power management support
Date: Tue, 18 Jun 2024 16:18:48 +0200
Message-ID: <20240618141851.1810000-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: richard.genoud@bootlin.com

This series add power management support for tps6594_rtc.

The 1st patch fixes a memleak found in the probe()
The 2nd patch simply introduce a private structure as drvdata that will
be used in the 3rd patch. (no functionnal change)
The 3rd patch introduce the power management support.

Changes in v3:
 - Fix a memleak found in probe()
 - introduce a private structure to prevent squatting the mfd structure
   (struct tps6594) with rtc-only related stuff.

Changes in v2:
 - use DEFINE_SIMPLE_DEV_PM_OPS instead of deprecated SIMPLE_DEV_PM_OPS
   (This fixes the defined but unsed warning when CONFIG_PM is unset)

Richard Genoud (3):
  rtc: tps6594: Fix memleak in probe
  rtc: tps6594: introduce private structure as drvdata
  rtc: tps6594: Add power management support

 drivers/rtc/rtc-tps6594.c | 75 ++++++++++++++++++++++++++++++++-------
 1 file changed, 63 insertions(+), 12 deletions(-)


