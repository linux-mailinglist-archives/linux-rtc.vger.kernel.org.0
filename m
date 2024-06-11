Return-Path: <linux-rtc+bounces-1273-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6DA903367
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jun 2024 09:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B41A928BB7C
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jun 2024 07:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20AB171E58;
	Tue, 11 Jun 2024 07:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="VWxMbzur"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239B813D8BA;
	Tue, 11 Jun 2024 07:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718090679; cv=none; b=bEwCQsxylAvkeC2QFYCJj53wO8EH3jKlIpv6Dt7rgwiGNipOAfut+ONBd1Mxq5XbMqwh/0qbC0/D4dclFxYc2wjNKwF2wjJ788S40nSC3AO08to6DkKlBrII0i13q/uHsAEWd4AULmQXPfWruBEpux6qymNW7u3eZNL8XPOJ/l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718090679; c=relaxed/simple;
	bh=/BViwiv7ODDGxwqmgG1UcvqUTvS9SkMogPTYvFA1l/o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NpOfpI5ABbsMTF9+y8w+3CrFNPyqS1m5YtPfn6IXQi14arfp74z7flKrow68cJGS03Fn/YMlDkm2KAaANz40TL+7xIPAs4QrXk/Yhu2biVcvZkntpU6HCSOzQEZcokutza5Ig+Usv7QQLx9tbu2GkK2CJrCymTbfNJYdA3XByss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=VWxMbzur; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 072E8A0A2C;
	Tue, 11 Jun 2024 09:24:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=Lyr4vKbJDlBYGx7GCBBG
	E5ECzYDxemWMfM7u2PghLS8=; b=VWxMbzurSef2hfVcbJaRiXq1SAMn+Kma44iI
	u+MCq2a7ztINQojHBxYyRkWi5Q5YKljbQhs1QiXuc/ceiQDdtcwg9LRndK2FOh+N
	xjhTBDous4DdKkKXjC65TsP7CcX8gLlj6cMEP9x4qPfj7gikpOaV1S2+mXNIbd20
	HTt4qUwUf41KfuWoDUk9398p6rMz+taNcV5nnGRei6tXRBZsD+8lTxP+1Kfoioqg
	VY8KATsEsVfZYVng+FhVtaBNRe7+ypMaZ5HFoKvK8G5CFkBH8uzBwrVZzw7aArrB
	LKzgFJ8lv6dbVp0JW5OGWv1I1IcQLwaKjQCn1DGHHEZZypTACMD6dwMuUQCfbkGL
	DBwoYxHC0kClDIxan2WxjXjOaOKHODqGJkjvs3qfnaiygMYOCIQWa5ZWl83K3lLQ
	SuoXkSb47Glv1uG2iuln0gkyo1ZF6nabyO9HRlWSg8yTOPWNQgt5yB+wmBTeKA3u
	I4CoA1rY6cDOAiF206M/tj+2yhmLSyjqjRytanbTUtWUDgaDpKiWokgjNndTgQY3
	anRuafDg1YO8lXLQT5uOMWXyV8//1Gbwb8GJ0MGgJupthrNF/rIj/cSSloHW6f8x
	HVmxbA63YXWdhHYSwFUlyYjnh3bCNnETqSkcwXPignN6tFNMhgp8VsSpxoHwexkx
	4kfnyuw=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>,
	=?UTF-8?q?Szentendrei=2C=20Tam=C3=A1s?= <szentendrei.tamas@prolan.hu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 2/2] rtc: ds1307: Clamp year to valid BCD (0-99) in `set_time()`
Date: Tue, 11 Jun 2024 09:24:09 +0200
Message-ID: <20240611072411.671600-2-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.45.2.437.gf7de8c0566
In-Reply-To: <20240611072411.671600-1-csokas.bence@prolan.hu>
References: <20240611072411.671600-1-csokas.bence@prolan.hu>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1718090673;VERSION=7972;MC=1998882007;ID=507904;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29916D3B54627C61

`tm_year` may go up to 299 if the device supports the
century bit. Therefore, subtracting may not give us
a valid 2-digit number, but modulo does.

Co-developed-by: Szentendrei, Tamás <szentendrei.tamas@prolan.hu>
Signed-off-by: Szentendrei, Tamás <szentendrei.tamas@prolan.hu>
Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 drivers/rtc/rtc-ds1307.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index bdb7b201a160..872e0b679be4 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -359,7 +359,7 @@ static int ds1307_set_time(struct device *dev, struct rtc_time *t)
 	regs[DS1307_REG_MONTH] = bin2bcd(t->tm_mon + 1);
 
 	/* assume 20YY not 19YY */
-	tmp = t->tm_year - 100;
+	tmp = t->tm_year % 100;
 	regs[DS1307_REG_YEAR] = bin2bcd(tmp);
 
 	if (chip->century_enable_bit)
-- 
2.34.1



