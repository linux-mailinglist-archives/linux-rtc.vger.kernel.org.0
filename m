Return-Path: <linux-rtc+bounces-6457-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ftapGWQx9GnK/AEAu9opvQ
	(envelope-from <linux-rtc+bounces-6457-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 01 May 2026 06:51:48 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C34414AA654
	for <lists+linux-rtc@lfdr.de>; Fri, 01 May 2026 06:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E832E3014439
	for <lists+linux-rtc@lfdr.de>; Fri,  1 May 2026 04:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C782FB99D;
	Fri,  1 May 2026 04:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="Mi8G2Amy"
X-Original-To: linux-rtc@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B27233D9E
	for <linux-rtc@vger.kernel.org>; Fri,  1 May 2026 04:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777611100; cv=none; b=VIQhID0M97suLyY+dt9g89RmVeklT4Amr6OV8xN9Surzq/gGKRWWlaP60f6bZrGQ37i6dRmulm+kcghpTCQN+VBuFhNZHgVO/f/8awnUCQpSSvY7TcTOU3T56rClyaBEKbsHN35TBU2aU5Ix+T7weMGEOvmSJUbP4z860/mZV+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777611100; c=relaxed/simple;
	bh=zgYKV0g8h/sbwHqqHgRPQ20vs2Bs5Np7r5DJDXulGhw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=unwbTnDqdskLdKqQa43GX5n9gZwoorNfGqItkOwawkYocLx1xv1XPhsxmA2pu4x/7hcZi33Tteq88d4jPNGXDqpZZAcK/H7xMFAUIkWUd6DrmIjc0jVi/YsbBSbBOlDPceDrqInH+naqwKqRWA4r2B/LLpqFSHaInxofM2TWrtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=Mi8G2Amy; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7B8A22C023A;
	Fri,  1 May 2026 16:51:28 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1777611088;
	bh=jmTSEhdwhbLZM471o2oxoaWmb7pz1B/7IQxuHd6Pubs=;
	h=From:To:Cc:Subject:Date:From;
	b=Mi8G2Amyw43NH34OqQmWrsjNRf5BFEg/RV3lN4z2B/rGKVXnzhxzqQu3Tg4tbS2/D
	 LihPvfUijmg6lPhWxQRxZdy4muxjS7ztoQziacZRgw1p4VcZ8d+YSm+tAjWiWyDRuA
	 sJKAAk7HjzWqEZ7BVab+3xCt0zheGmNubqsVHsXWXlSzneoQ83m1aNqDlhku2MgJFe
	 4Iw0RNtW66kdQgPdN+mx3Hanb4uKr3j7odG8m0tZGRS/QljmcTAqtlXCbJTOutbP0L
	 PnvYGdY2+Rnke97Zj3K/OhiDZubNgz+JMQ61ShHYSeGxyiVMOnd3UNU2VFrRrWkLdk
	 xtdsuiZYZK9Dw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B69f431500000>; Fri, 01 May 2026 16:51:28 +1200
Received: from ronand-dl.ws.atlnz.lc (ronand-dl.ws.atlnz.lc [10.33.12.18])
	by pat.atlnz.lc (Postfix) with ESMTP id 5565C13EC7E;
	Fri,  1 May 2026 16:51:28 +1200 (NZST)
Received: by ronand-dl.ws.atlnz.lc (Postfix, from userid 1930)
	id 4FE0484004F; Fri,  1 May 2026 16:51:28 +1200 (NZST)
From: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>
To: alexandre.belloni@bootlin.com
Cc: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tyler Hicks <code@tyhicks.com>,
	Sasha Levin <sashal@kernel.org>,
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] rtc: ds1307: handle oscillator stop flag for ds1337/ds1339/ds3231
Date: Fri,  1 May 2026 16:46:10 +1200
Message-ID: <20260501044657.1003980-2-ronan.dalton@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=FPe4xPos c=1 sm=1 tr=0 ts=69f43150 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=NGcC8JguVDcA:10 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=FLmnqZ5pAAAA:8 a=yMhMjlubAAAA:8 a=gUfQWItQAAAA:8 a=vhqSDMIX0PFRHOe_07sA:9 a=3ZKOabzyN94A:10 a=d3PnA9EDa4IxuAV0gXij:22 a=8DxQ4-P9FUvTN4rw3Xy2:22 a=Xud5aiJGVNusHZ8q4fKI:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-Rspamd-Queue-Id: C34414AA654
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[alliedtelesis.co.nz,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[alliedtelesis.co.nz:s=mail181024];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6457-lists,linux-rtc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,alliedtelesis.co.nz:email,alliedtelesis.co.nz:dkim,alliedtelesis.co.nz:mid,bootlin.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ronan.dalton@alliedtelesis.co.nz,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[alliedtelesis.co.nz:+];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Prior to commit 6cb0d8587b96 ("rtc: ds1307: remove clear of oscillator
stop flag (OSF) in probe"), the oscillator stop flag (OSF) bit was
checked during device probe for the ds1337, ds1339, ds1341, and ds3231
chips; if it was set, it would be cleared and a warning would be logged
saying "SET TIME!". Since that commit, the OSF bit is no longer cleared,
but the warning is still printed.

Directly following that commit, there was no way to get rid of this
warning because nothing cleared the OSF bit on these chips.

The commit associated with the previous commit, ae03a28e12a7 ("rtc:
ds1307: handle oscillator stop flag (OSF) for ds1341"), made proper use
of the OSF when getting and setting the time in the RTC. However, the
other RTC variants ds1337, ds1339 and ds3231 didn't have a corresponding
change made.

Given that the OSF bit is no longer cleared at probe time when it is
set, the remaining three chips should have the same handling as the
ds1341 chip has for the OSF bit.

Fix the issue on the ds1337, ds1339 and ds3231 chips by applying the
same logic as the ds1341 has to these chips.

Note that any devices brought up between the first referenced commit and
this one may begin mistrusting the time reported by the RTC until it is
set again, if the bit was never explicitly cleared.

Note that only the ds1339 was tested with this change, but the
datasheets for the other chips contain essentially identical
descriptions of the OSF bit so the same change should work.

An alternative to this change could be just to revert the referenced two
commits and not use the OSF bit at all, apart from logging a warning and
clearing it on probe.

Signed-off-by: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>
Cc: linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Tyler Hicks <code@tyhicks.com>
Cc: Sasha Levin <sashal@kernel.org>
Cc: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Cc: Rodolfo Giometti <giometti@enneenne.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Fixes: 6cb0d8587b96 ("rtc: ds1307: remove clear of oscillator stop flag (=
OSF) in probe")
---
 drivers/rtc/rtc-ds1307.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 7205c59ff729..edf81b975dec 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -269,6 +269,16 @@ static int ds1307_get_time(struct device *dev, struc=
t rtc_time *t)
 		if (tmp & DS1338_BIT_OSF)
 			return -EINVAL;
 		break;
+	case ds_1337:
+	case ds_1339:
+	case ds_1341:
+	case ds_3231:
+		ret =3D regmap_read(ds1307->regmap, DS1337_REG_STATUS, &tmp);
+		if (ret)
+			return ret;
+		if (tmp & DS1337_BIT_OSF)
+			return -EINVAL;
+		break;
 	case ds_1340:
 		if (tmp & DS1340_BIT_nEOSC)
 			return -EINVAL;
@@ -279,13 +289,6 @@ static int ds1307_get_time(struct device *dev, struc=
t rtc_time *t)
 		if (tmp & DS1340_BIT_OSF)
 			return -EINVAL;
 		break;
-	case ds_1341:
-		ret =3D regmap_read(ds1307->regmap, DS1337_REG_STATUS, &tmp);
-		if (ret)
-			return ret;
-		if (tmp & DS1337_BIT_OSF)
-			return -EINVAL;
-		break;
 	case ds_1388:
 		ret =3D regmap_read(ds1307->regmap, DS1388_REG_FLAG, &tmp);
 		if (ret)
@@ -380,14 +383,17 @@ static int ds1307_set_time(struct device *dev, stru=
ct rtc_time *t)
 		regmap_update_bits(ds1307->regmap, DS1307_REG_CONTROL,
 				   DS1338_BIT_OSF, 0);
 		break;
+	case ds_1337:
+	case ds_1339:
+	case ds_1341:
+	case ds_3231:
+		regmap_update_bits(ds1307->regmap, DS1337_REG_STATUS,
+				   DS1337_BIT_OSF, 0);
+		break;
 	case ds_1340:
 		regmap_update_bits(ds1307->regmap, DS1340_REG_FLAG,
 				   DS1340_BIT_OSF, 0);
 		break;
-	case ds_1341:
-		regmap_update_bits(ds1307->regmap, DS1337_REG_STATUS,
-				   DS1337_BIT_OSF, 0);
-		break;
 	case ds_1388:
 		regmap_update_bits(ds1307->regmap, DS1388_REG_FLAG,
 				   DS1388_BIT_OSF, 0);
--=20
2.53.0


