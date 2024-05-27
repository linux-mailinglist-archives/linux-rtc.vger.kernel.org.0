Return-Path: <linux-rtc+bounces-1213-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B848D053E
	for <lists+linux-rtc@lfdr.de>; Mon, 27 May 2024 17:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EA1F291C8F
	for <lists+linux-rtc@lfdr.de>; Mon, 27 May 2024 15:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5181A15F41B;
	Mon, 27 May 2024 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="KnRlW99x"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686AE15F41E
	for <linux-rtc@vger.kernel.org>; Mon, 27 May 2024 14:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716820941; cv=none; b=Aqcw18f8jpg108tG+iQOBj4ZL3qtM9GWlMCZETYp6WaHis5sgPk+ygLlhq/ALiZIcDuWHTqps7VWBJzLuvNMfJahIL+TMWlhn2hr/hqPIh/wRzGc4rjR00RFt9Y4BnziUvjrTyK+X12u5GVs28Tl2UlPaZlvf5lFmdeYfJjT8Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716820941; c=relaxed/simple;
	bh=qe5Vh8evFqEkO+ML2Nw5k92F4ODLLgUKLoBT4y+HOKQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Jd83rFi30nGDQCeoKokToYNDmES7nvTmj81m6Z8zqHDjFiR7tge6+Mh25pqj3yhhatwzLkXYIpL7r5ww7ozZzmezTWRx6ZNiXMlgfiiJsdx+dBlwNummru6pzfH8YGcuSncjfkoWZNSmBfNhwaVH1yEXImL+m4bTvVaxc8cwzI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=KnRlW99x; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id BA282A1B6A;
	Mon, 27 May 2024 16:37:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=fWiSCTrZysHBS9vhWocyIvbMQY9pKXjPJz1JcIjVIwk=; b=
	KnRlW99xs9VpSIrRH5rTRqedd/1kVWlix4fzRiR/A1Fco7/QiZZJxmD/dIhTLDJr
	5CC7HSU9+02p2aNCtI6nGDTmXcUrnOoTuBh9fjtTYh94p0r3raHFZNCY6xmDbz3N
	QpMqXETowTvff5FD/shR4TftP7dmyGCfyfbRI8OWT6r24r1m2XepbfdJxCrXR2jf
	bNsFRXmsPKuaIwZlcg5EYSjzR4IMBql8btBpd9FYYsKZqGtYJtC7Age/wSBlDKlt
	pp5BX3/ZXhyLNiayNj4Jy8Yv7SV5zQMQLHwY4EBy/Lu5qU076lZtKkPglAjKKqAz
	MANLUieNSdDsTIbBKp6hMD5z1QxBu+7CE2tzEM/VKk5RqZ1S2iZd8vQDlviGJU3Z
	TGztWyByVRHbRSeYzwimHUAzIVA6iujzF4sQmoyYrdAVlL2aDwAhdRQdi+5swnw8
	LGdIF/G9s1w/3gei1be+KOrlnz1jTIfu1c+AEH8/92lJ+vtP/mwDQNEswwzUiR/i
	z0O52o/He0iBwO3ZPuKhdb+fOKGkqFWLNlr622Qx0dxU5SzOXAmCO9FU9SergTTi
	yshqUEaoPw8COHA7h+WdFQrna4LAn7xT9HCHOCdG1Zxs1oSBYt+EfgvFlAbsKd+7
	g7zB6IWtKPSbRGvStOWk4YKLyVj6ftRIIG2yhDec5vc=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <linux-rtc@vger.kernel.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>,
	=?UTF-8?q?Szentendrei=2C=20Tam=C3=A1s?= <szentendrei.tamas@prolan.hu>
Subject: [PATCH] rtc: ds1307: Detect oscillator fail on mcp794xx
Date: Mon, 27 May 2024 16:36:07 +0200
Message-ID: <20240527143605.390592-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1716820602;VERSION=7972;MC=3930033811;ID=624071;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2945A12957637661

This patch enables the detection of the oscillator failure on mcp794xx chips.

Co-developed-by: "Szentendrei, Tamás" <szentendrei.tamas@prolan.hu>
Signed-off-by: "Szentendrei, Tamás" <szentendrei.tamas@prolan.hu>
Signed-off-by: "Csókás, Bence" <csokas.bence@prolan.hu>
---
 drivers/rtc/rtc-ds1307.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 506b7d1c2397..45dc7f770225 100644
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
+	    !(ds1307->regs[DS1307_REG_WDAY] & MCP794XX_BIT_OSCRUN)) {
+		dev_warn_once(dev, "oscillator failed, set time!\n");
+		return -EINVAL;
 	}
 
 	tmp = regs[DS1307_REG_SECS];
-- 
2.34.1



