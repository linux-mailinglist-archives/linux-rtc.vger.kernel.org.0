Return-Path: <linux-rtc+bounces-1272-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 801A6903366
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jun 2024 09:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 299D21F21AD6
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jun 2024 07:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED8B171094;
	Tue, 11 Jun 2024 07:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="czhZ7nEb"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B46C26AF6;
	Tue, 11 Jun 2024 07:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718090679; cv=none; b=PPpCvFMURIysrXMk4+LJzRQdJr6lKqUd6vlik7T42xU4Hcab3FQV7qNtH1fWcxKCFTQ4iwhDohWsqEAclhNKEwfnjS9UqL5snyiGrgfID39FXIAAKI/g/akaoP2R6rP56CAOSZ4OL473ZZYu+FSkTpjB8XXtWr+zx7Di/vLTLPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718090679; c=relaxed/simple;
	bh=cNKJBff2JjmgIeBtk0fH5JDTmZVQLoGJcT2ZaD1G5JY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=alTzIIB79AzvkF+YF1HXCciqlBBqs/3knB3MBsPzZ8DABwujkM86ie0MPyar8dlZoHWvJUt/vVc3ztVpSy4gNsrmfl8880QAWkgVQJaFQXiUL3zq3U6J6pxheKUd59Lt/Bqb4NmQFjEoO0HCsi9VHJQulBQrMkZuPsCsoYH+inE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=czhZ7nEb; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 78CA8A09A1;
	Tue, 11 Jun 2024 09:24:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=nxOoWzJj6x8CbfgrQF46F7yU7jRVDYeEowyAEH5Wuic=; b=
	czhZ7nEbYNkbdkAzdzShMWGTOEKQXzK6nCIoYYe2QXSgjZoZeJlfBYfubbBkyK1X
	snrHepAgKJ/ZFkkIMtb2nwUJhKgUOYu2+DnhTuA0QfwKI1lTZPmC8XBrqpUcJOgD
	gTOoNtpnRF9Rd76P4A3wk3OYQ2Rc9YiQegYVmzVB3uNAmB0BIFt3r4wpssZMLwul
	B0I3AU9D93CcO69WVksqpy8FAzSzeqyfEr3X0e8UA+GfUe+rnSqqdm9ti8eFkvMM
	XMB4tZ56XArn6gYPjNxf5TR/c4Ke+srmO43ZPoQDZYo6LQbg90c59jQUlKkJW0jF
	7hGbG7aCYEQiflfMINuu1XZV6NK2cJjE2DRGrEPK7vvxJ//qQ2y8sad5Pl7/lGAy
	L/rEpA9OsrKneNnYmhlWTltobTGnMtVI18YlLqvcHTMV1aJoW41hpSFrqWUXMbqf
	76dTcup/MErGM1xa9Gbq36HdQH5KimHSXV0Eczbu04EJqZ6tbBDkzd9qWFsTfHBi
	9Ug9UDJb0h7zIkVZFDMAmWxqL2I7t2WAFRffYicU8KSlU0lOkgnR6/Xr2ZOy46UZ
	io/SglhGEHCy/anAfyBvElaMsSlhAADIBZFN/Ds07PafT2jZVzMsDKpm4yGr8/IJ
	tP3ASMoiVSUqZKnBUMvc5Kn1vTaRsUctdrOePAuofQ4=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>,
	=?UTF-8?q?Szentendrei=2C=20Tam=C3=A1s?= <szentendrei.tamas@prolan.hu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 1/2] rtc: ds1307: Detect oscillator fail on mcp794xx
Date: Tue, 11 Jun 2024 09:24:08 +0200
Message-ID: <20240611072411.671600-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.45.2.437.gf7de8c0566
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1718090671;VERSION=7972;MC=2743792726;ID=507903;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29916D3B54627C61

This patch enables the detection of the oscillator failure on mcp794xx chips.

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



