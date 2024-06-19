Return-Path: <linux-rtc+bounces-1359-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F9D90EBF5
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Jun 2024 15:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 503231F2198F
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Jun 2024 13:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3965A14D6E4;
	Wed, 19 Jun 2024 13:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="ihpkXdXe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0916F13DB90;
	Wed, 19 Jun 2024 13:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718802117; cv=none; b=DlHmNBwkj3ngpzsKm5sfrIbz/OjL9d32Cvxuwjk6oJo78EHdbtXb3JJgolkh9RYJKk4ked49ztK06u3wS8nBmQcnfABo+gxwHNYuLZWCmVuVKpVOV0KDoHbcFRETjNoXzlOuqQ9QEzHety51OcV2dQx8/BO0lOINQ4SyEKuzDn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718802117; c=relaxed/simple;
	bh=Wqj4fkKWDCEh/pzYyA3u8TD2BiyQQ36+PhN66S75nf8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hB0rtRXazHYqdEnZ+B3E24fGpuf6Lrk1VwpOZ3YtQX3UXa3W/i3t3w4ZRLp/5sc5E2V6+C6m3iMQE/ubNZFSlG4j2iMiIjDmHcCddYVuHEEuUaPBJcsostT24YSlRtg1t7eOisD6FBW/GMum4MSrQOIkcvhV4QY4uGPHp14AW08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=ihpkXdXe; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id A32EAA0B51;
	Wed, 19 Jun 2024 15:01:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=xC0P4So+IH1EdQB9fWJmhxeSCfO4o+MbyG70cV7lM6E=; b=
	ihpkXdXeHFk3LSVzjH9VgfW2HFy6e7K4WA8Vn0MsHeakxqZp9xTDvnbw8CxYbBCN
	vi/zOjB36qnXkR95fcSe0OwPg/2V+DIt5lFnCx1/qV6OEa2c+lQX49NfS0R+9Mwn
	hsVisuZRzvYZ+NqQgNPBkDj6a1mxfBCmK5qDfzB0vjHVvJmQrdkAANVRXarC/Odw
	Qs6Sx1IQNsUjq/hbF8FEm6ESDz0Q97GEMROvXkCu6qjSSHPCwG5aAhMWz07DIBPN
	t8DUCleKUKU1xdXVBw7u6ZYLGDlpJj4vfsnrUQSTHguUrUgLHetf8WHP12ugnLzs
	35a90OqY/1+KKPZgd4n86asE5A/TWc+JHOluiwr1QEkURBB8uDWlHiVup49pTAiI
	zBKVFXPCW9CuM0STk9ZUn0rJJQLltgoPrWLl5YjH2vyBxZ3Hu4fZXqiv2U3yDR0F
	1eWy4uHPRZ4V+bDnvyp5NragSedOPBJAnqDtyJVRz0a5HCeuEniDgN70n/AA7nM0
	TWlHidR4Y/G0yUVtZoJwwoG1ftlvIrAs+bFmuXig6Xyg5EM8tvTjAfF8xNZqoVqE
	syAFMxKcaTn+krzyqeI43NehvQdPKfURKBvL3T/n6w1R3+om9+22syKaWANQOm+j
	Zm8eENMnldNCLH+y/5tDs79a3p1q6cFMuI1NBvS2xBY=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	<linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
Subject: [PATCH resubmit] rtc: interface: Add RTC offset to alarm after fix-up
Date: Wed, 19 Jun 2024 15:01:16 +0200
Message-ID: <20240619130115.2799118-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1718802111;VERSION=7972;MC=2560499276;ID=565953;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2945A129576D7D61

`rtc_add_offset()` is called by `__rtc_read_time()`
and `__rtc_read_alarm()` to add the RTC's offset to
the raw read-outs from the device drivers. However,
in the latter case, a fix-up algorithm is run if
the RTC device does not report a full `struct rtc_time`
alarm value. In that case, the offset was forgot to be
added.

Fixes: fd6792bb022e ("rtc: fix alarm read and set offset")

Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 drivers/rtc/interface.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index 1b63111cdda2..db8dffffed91 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -273,12 +273,11 @@ int __rtc_read_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
 		if (err)
 			return err;
 
 		/* full-function RTCs won't have such missing fields */
 		if (rtc_valid_tm(&alarm->time) == 0) {
-			rtc_add_offset(rtc, &alarm->time);
-			return 0;
+			goto done;
 		}
 
 		/* get the "after" timestamp, to detect wrapped fields */
 		err = rtc_read_time(rtc, &now);
 		if (err < 0)
@@ -378,10 +377,12 @@ int __rtc_read_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
 done:
 	if (err && alarm->enabled)
 		dev_warn(&rtc->dev, "invalid alarm value: %ptR\n",
 			 &alarm->time);
 
+	rtc_add_offset(rtc, &alarm->time);
+
 	return err;
 }
 
 int rtc_read_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
 {
-- 
2.34.1



