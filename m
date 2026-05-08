Return-Path: <linux-rtc+bounces-6481-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HJKIKAr/WkLYgAAu9opvQ
	(envelope-from <linux-rtc+bounces-6481-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 08 May 2026 02:17:36 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 368C94F0738
	for <lists+linux-rtc@lfdr.de>; Fri, 08 May 2026 02:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 65E9C3007A76
	for <lists+linux-rtc@lfdr.de>; Fri,  8 May 2026 00:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1E91A682C;
	Fri,  8 May 2026 00:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="zAB6gMDF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BD916F27F
	for <linux-rtc@vger.kernel.org>; Fri,  8 May 2026 00:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778199450; cv=none; b=acCuQnj01r3+i2L/hnMMHmNBfFfBgf7XnwrsiqHVYWZJJLSpfWuQODDHu3G20yMaXrGQfJoxlHH80r6NC+DUwzoHhXsi0H434ggLWssN6ipS6vT1s33jPBVIOSvE/5VL7vqEVknENzIqwPWWVA5lsGrFPnUL2AXIfuZLbw6kQiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778199450; c=relaxed/simple;
	bh=vRXpJQN29hjLjmK2OxhdxjRCoqHqZIbkPY3vEmdZBxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hnN8+V2+oxTf1p6a1xBt2I011OoWfJv0hVMhpuwQVm3hLWoL5P1Ck//fyr7re8aDAUTeskahrnQC6vRbAcJFt387EwwBwsEpvLZueDoUbSjW+rw+kTNQPQ/sL3tXrfq7XJqjks34cnYHk2Z6FEx/XGaeUWqmAudaqnobljCrWFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=zAB6gMDF; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A936E2C0183;
	Fri,  8 May 2026 12:17:25 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1778199445;
	bh=uywkIOOPdprN1Cctz2PBlY9ZoFYz/Hwr0W+QeaQL52M=;
	h=From:To:Cc:Subject:Date:From;
	b=zAB6gMDF11tAfixR+bvE5ByKeYKXCKCfShMNhabJ5ebWXO2wIK8tOCmUkYbr8a+5X
	 nHMtE5If5IZfSyLF1zLX70zGefHo6d2a3mVgosA6bRuMBK4BM4cOuHA9D5bch7DbTm
	 S+9q47o3T6phOwMHusnjiRy395/WiOIpDa/Qrtay+7tuLQDdJ0lfctP+tsaGeXCNWG
	 Mt3FUziQzDiBkMCD2/kZhNvD5BYQ7dS372+K3LnJdYvxLyNjB3p7xklDlOJP23RETE
	 cNpCuoleH/uiSXP7Jrn6v64Lu+dcsu/Zy4tDJ1uVBTADflVkeQhOhnMnAqcOXmqoNa
	 ojYMzwLmoblzA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B69fd2b950000>; Fri, 08 May 2026 12:17:25 +1200
Received: from ronand-dl.ws.atlnz.lc (ronand-dl.ws.atlnz.lc [10.33.12.18])
	by pat.atlnz.lc (Postfix) with ESMTP id 776DC13ED2A;
	Fri,  8 May 2026 12:17:25 +1200 (NZST)
Received: by ronand-dl.ws.atlnz.lc (Postfix, from userid 1930)
	id 7277D84004F; Fri,  8 May 2026 12:17:25 +1200 (NZST)
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
Subject: [PATCH v2] rtc: ds1307: handle oscillator stop flag for ds1337/ds1339/ds3231
Date: Fri,  8 May 2026 12:17:06 +1200
Message-ID: <20260508001709.3681392-1-ronan.dalton@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=FPe4xPos c=1 sm=1 tr=0 ts=69fd2b95 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=NGcC8JguVDcA:10 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=FLmnqZ5pAAAA:8 a=yMhMjlubAAAA:8 a=gUfQWItQAAAA:8 a=vhqSDMIX0PFRHOe_07sA:9 a=3ZKOabzyN94A:10 a=d3PnA9EDa4IxuAV0gXij:22 a=8DxQ4-P9FUvTN4rw3Xy2:22 a=Xud5aiJGVNusHZ8q4fKI:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-Rspamd-Queue-Id: 368C94F0738
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[alliedtelesis.co.nz,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[alliedtelesis.co.nz:s=mail181024];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6481-lists,linux-rtc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alliedtelesis.co.nz:email,alliedtelesis.co.nz:mid,alliedtelesis.co.nz:dkim,bootlin.com:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ronan.dalton@alliedtelesis.co.nz,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[alliedtelesis.co.nz:+];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Prior to commit 48458654659c ("rtc: ds1307: remove clear of oscillator
stop flag (OSF) in probe"), the oscillator stop flag (OSF) bit was
checked during device probe for the ds1337, ds1339, ds1341, and ds3231
chips; if it was set, it would be cleared and a warning would be logged
saying "SET TIME!". Since that commit, the OSF bit is no longer cleared,
but the warning is still printed.

Directly following that commit, there was no way to get rid of this
warning because nothing cleared the OSF bit on these chips.

The commit associated with the previous commit, 523923cfd5d6 ("rtc:
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
Fixes: 48458654659c ("rtc: ds1307: remove clear of oscillator stop flag (=
OSF) in probe")
---
Changes in v2:
- Fix hashes of referenced commits

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


