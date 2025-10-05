Return-Path: <linux-rtc+bounces-5048-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3228BB9CD7
	for <lists+linux-rtc@lfdr.de>; Sun, 05 Oct 2025 22:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CF7C3B7E84
	for <lists+linux-rtc@lfdr.de>; Sun,  5 Oct 2025 20:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2BC1DF248;
	Sun,  5 Oct 2025 20:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fNhbgcX2"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50A3191F98
	for <linux-rtc@vger.kernel.org>; Sun,  5 Oct 2025 20:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759695592; cv=none; b=lQTWuq9ZvDzgfjeg8BcD2nVmQ7Q01YrRxHZkd/qxF6eqKbEXY/Cwh3HU7BBWamwNHVfbtolWDNM0LYuA8ZGe0igEyezBpFhvzmERvPu3+++w6/zYWsYJriHUJTr7zB8CD7DvZuiytLgPcwfFvqxyeGxf6Z42ZpBAPpA8sWV/KwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759695592; c=relaxed/simple;
	bh=rM4/5G2V30Hbl+Iq+kXNIQ4tx7lDkcC9tVgWpq0vXWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qEOdBEYKnv+xd46JTV6aICavhKACzhvU+SroWZ41DRfAPZQVzUGkXVqbK/h3hl7WQ1ZUq8LVc86nWBFlUPnQEF5GKVI2vAkRn5EHCILipyuj4Q4Ho+IlDsy21gchavwgpHccu/j8Uil2OkdvPc4DzYx2JJLx8cumh09/x+Dsh0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fNhbgcX2; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A9F081A1122
	for <linux-rtc@vger.kernel.org>; Sun,  5 Oct 2025 20:19:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 68A2E6065F;
	Sun,  5 Oct 2025 20:19:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF500102F1D0B;
	Sun,  5 Oct 2025 22:19:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759695584; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=D1+ThUd0H2aIR2MQVkM0B+QGXcipu5gIAh7qnE8fBhw=;
	b=fNhbgcX2EhHS7NE7wTwB7JJJIlHkmroOt1QLsmNgouMG2jW8ImCjI3TIVEaiMur8/Qw2cx
	SLqQZAhWUMMR3i3gM5sEKfXvnRZs9fm9MR36w6pphoUi95lHixWoZPMxlpTI34n3px5A+u
	OwMp20t2pwQ+A88K8eRtj657wDWQYQiSuxk+UeWYJMXp9Gf44s7Doz6BRAue+EnSIcp8Ct
	MXi5DrbkbiOJa3Dxv3uWZfpR8HsSr/NvUmP2UXAwCgQeGWQfAbBfvoEwFSEzwDIJlj/K9+
	XeXuURp2TxUv3ppgAwjS2LlxSzjlwOYKn2eoCctC1Pib58ryJikBd2UbQs4xrA==
From: alexandre.belloni@bootlin.com
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: kernel test robot <lkp@intel.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: optee: make optee_rtc_pm_ops static
Date: Sun,  5 Oct 2025 22:19:24 +0200
Message-ID: <20251005201925.3757345-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Fix sparse warningg:
drivers/rtc/rtc-optee.c:714:1: sparse: sparse: symbol 'optee_rtc_pm_ops' was not
declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202509230549.L26lw7UZ-lkp@intel.com/
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-optee.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-optee.c b/drivers/rtc/rtc-optee.c
index 3d5662aa1bd8..184c6d142801 100644
--- a/drivers/rtc/rtc-optee.c
+++ b/drivers/rtc/rtc-optee.c
@@ -712,7 +712,7 @@ static int optee_rtc_suspend(struct device *dev)
 	return 0;
 }
 
-DEFINE_SIMPLE_DEV_PM_OPS(optee_rtc_pm_ops, optee_rtc_suspend, NULL);
+static DEFINE_SIMPLE_DEV_PM_OPS(optee_rtc_pm_ops, optee_rtc_suspend, NULL);
 
 static const struct tee_client_device_id optee_rtc_id_table[] = {
 	{UUID_INIT(0xf389f8c8, 0x845f, 0x496c,
-- 
2.51.0


