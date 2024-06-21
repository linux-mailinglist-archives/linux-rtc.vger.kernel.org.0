Return-Path: <linux-rtc+bounces-1380-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B977C911E39
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 10:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 562D4B25C6D
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 08:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BA216EBE7;
	Fri, 21 Jun 2024 08:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="RcNvXE7e"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCA116D4DA;
	Fri, 21 Jun 2024 08:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718957152; cv=none; b=GbDmdtk5MDbvv+WVTQmcVHcNW03EqP3VFP0TQv4ouoAIzbnpkuCxgQ+i1ErApEqF7sgVcdfWWvuj1vejbxKyBMhNW4NkkyQd0rGDL9HuwhqFRadPZY2NSyIQ35G+UOM17vON1ALR2RyCkxrOodlj0fvvY9tnIkAb20wiWm6zijE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718957152; c=relaxed/simple;
	bh=z8w3eMhXP7mndxW4NaWWenn/LylxaQ2N372gycPqnTw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F4yRHf4IbBRJPSfLgrnwVyIgyllJ2Q8nPTuW6+/WDT/oHB+aKFQmsxc9gMNmndhnIF5GkUfL4i0/F8nWddKovBmOTRCVR2Sy72py59eMCcyLd0pWA/bbVD1QH3Vr+qkF0YZgm7/WSIgnqXkndjGqF5/DBiLM4K7K61Nko6YYZMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=RcNvXE7e; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 2882CA02B8;
	Fri, 21 Jun 2024 10:05:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=fSqZUlwJCUOforWjnk3dfSHqa9aqAkwAZzUGtcCCadI=; b=
	RcNvXE7ezyi7ax7Nsk/O+GiZxL43lhER+0hD0L3OMKIYIUuBPhvoo12v530VmgpU
	QzT4nUMnrlee+BzNsm06x+3UIZ/cLbTcxOkcBKhbT7X7R150t6Wdt2sl7vy0unoT
	M2z83uvPN+UBff6YLlOVwwLBrd1DoFOtQMyPsrxnOmRz6J2OOyj4mKxnMi7W6LzU
	Vj7F4CnyiS/jtQd3m8+pWE4wxyvYeaZVSM1709sTu78x1c/dmwHwh5ftnACyrp/3
	RGPKq0wsMJiM2KSQ4GyEUzL9J+dNqAXOvXm+nmUARxaJIpASK59r9IFdoDES1Qil
	AsroVGMGtLl9JnXt7gjlaleNpNSpvdHcOpTvGwU7Bj3kOX7AZfvBhbaL/dwwXqTl
	MmeFQgEPdW8Gi+aVoCtaK1Ekr1UpqWsmOq+gtPxYqVSL5QLGpKiLprfbcoDzeaSZ
	ZXpE4M8o4INvYY8dCWbDbGQC9ihlzbbVzQBxoZNOij9SqrVDKJ40cmoROTADR9f5
	DiFdE8CCj14GfZv6z6Z3J2WBk4uN36GteI2CXohEJ86eaq5DqXXcuZRLO69lKuH+
	q0jGpFKk0S0T/x+0GCuEq/7GRXQs4RPKOHVRf3rdE1H4qwcbY+Khsj4RcQSsifbU
	mt35S51t/flsLu/l1oAwiAIf2v3zTgzQUBOb3StWBsI=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>,
	=?UTF-8?q?Szentendrei=2C=20Tam=C3=A1s?= <szentendrei.tamas@prolan.hu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH resubmit] rtc: ds1307: Detect oscillator fail on mcp794xx
Date: Fri, 21 Jun 2024 10:05:13 +0200
Message-ID: <20240621080512.2916664-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1718957147;VERSION=7972;MC=3168413634;ID=787214;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2945A129576C7567

This patch enables the detection of the oscillator failure
on mcp794xx chips.

Co-developed-by: Szentendrei, Tamás <szentendrei.tamas@prolan.hu>
Signed-off-by: Szentendrei, Tamás <szentendrei.tamas@prolan.hu>
Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 drivers/rtc/rtc-ds1307.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 506b7d1c2397..bdb7b201a160 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -65,6 +65,7 @@ enum ds_type {
 #	define DS1340_BIT_CENTURY_EN	0x80	/* in REG_HOUR */
 #	define DS1340_BIT_CENTURY	0x40	/* in REG_HOUR */
 #define DS1307_REG_WDAY		0x03	/* 01-07 */
+#	define MCP794XX_BIT_OSCRUN	BIT(5)
 #	define MCP794XX_BIT_VBATEN	0x08
 #define DS1307_REG_MDAY		0x04	/* 01-31 */
 #define DS1307_REG_MONTH	0x05	/* 01-12 */
@@ -242,6 +243,10 @@ static int ds1307_get_time(struct device *dev, struct rtc_time *t)
 	    regs[DS1307_REG_MIN] & M41T0_BIT_OF) {
 		dev_warn_once(dev, "oscillator failed, set time!\n");
 		return -EINVAL;
+	} else if (ds1307->type == mcp794xx &&
+	    !(regs[DS1307_REG_WDAY] & MCP794XX_BIT_OSCRUN)) {
+		dev_warn_once(dev, "oscillator failed, set time!\n");
+		return -EINVAL;
 	}
 
 	tmp = regs[DS1307_REG_SECS];
-- 
2.34.1



