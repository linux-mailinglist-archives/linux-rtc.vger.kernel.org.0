Return-Path: <linux-rtc+bounces-6580-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6L4dMcm6F2rMOwgAu9opvQ
	(envelope-from <linux-rtc+bounces-6580-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 05:47:21 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE765EC489
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 05:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D748306D0DE
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 03:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83EC31353C;
	Thu, 28 May 2026 03:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="sMXU3dbF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836993101B0;
	Thu, 28 May 2026 03:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779940024; cv=none; b=d6gJ+WV+jGZJ0Z0t1+R0IwXqA1nIEWjDOdR3RnaesifagVkR82zFvBrSDUear3dxlUweeQY4fsQIg5nQq0mxukmRtYr7MH9Ljj70e2FYNo0D7XjoHUKu0qH06ELPZNIrDzXgR3nSlP1yX/RGnHe7bUxROdV7Yh3dyycuT70dVs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779940024; c=relaxed/simple;
	bh=YOdoUxfSBsws3SKNn9de0Uhyko5jGF5YH0WJr5ohLrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WjxsDDYVrZR8QEL9VLCtlTH4Ovdv91L3abmZ9uVrQs/clgx9VNY+x8GuLudrfUpi2KxQ4bt8/fpTknulhG9q02ZuJEjfLI/In/qUTVheW7PE4N0Fsrp3hDqoOWFBcpJlYia2Tu/rYuDNEeVZFirLUv50gNvBPkZGcIp1bwklvCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=sMXU3dbF; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779940023; x=1811476023;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=YOdoUxfSBsws3SKNn9de0Uhyko5jGF5YH0WJr5ohLrA=;
  b=sMXU3dbFxQynHHjgxeVqR8c0L6Is80lPTZ0a7gvKMR8MPacF1Nn/qwW+
   HAbRDXplURsLRXOlSeanLUWHNKwOPGZ8bbb4FwNUif67rYUZuAZuz0MyB
   x1htTC9vp3MEizCTl9P2ZRODo959qBers/ES0YQCVUm5msRW7CVHweZX9
   98AYrSuvrfgl1K3Yl9ERahQ1yNp8zvNveGXeixymjHVcOQROiixKdRULm
   6gyu17143De3V5qO/k9xkhgWAVYOCbePq0NZ0nHFdUaaB35PUuOoee6Dc
   xicV0oVFYtmUTZFndHEUARTJQIyHh6OQhSGdAmEe0fFhh4U+GGXRuXO3e
   A==;
X-CSE-ConnectionGUID: vXzvNFDVSBG0BleE8SWlBQ==
X-CSE-MsgGUID: k2aDQVdFQrG0glp5rs4w2w==
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="58160225"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 May 2026 20:47:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 27 May 2026 20:47:02 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 27 May 2026 20:46:59 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Thu, 28 May 2026 09:16:47 +0530
Subject: [PATCH 4/4] rtc: s35390a: convert to dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260528-cleanup-dev-err-probe-rtc-v1-4-29dc9cb6c3f0@microchip.com>
References: <20260528-cleanup-dev-err-probe-rtc-v1-0-29dc9cb6c3f0@microchip.com>
In-Reply-To: <20260528-cleanup-dev-err-probe-rtc-v1-0-29dc9cb6c3f0@microchip.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, "Orson
 Zhai" <orsonzhai@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>, "Balakrishnan
 Sambath" <balakrishnan.s@microchip.com>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6580-lists,linux-rtc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,linux.alibaba.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,microchip.com:mid,microchip.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7DE765EC489
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use dev_err_probe() in place of dev_err() and return, which
communicates the error type and helps debugging hardware issues.

No functional change.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 drivers/rtc/rtc-s35390a.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
index a4678d7c6cf..342fd2b568a 100644
--- a/drivers/rtc/rtc-s35390a.c
+++ b/drivers/rtc/rtc-s35390a.c
@@ -479,10 +479,8 @@ static int s35390a_probe(struct i2c_client *client)
 		return PTR_ERR(rtc);
 
 	err_read = s35390a_read_status(s35390a, &status1);
-	if (err_read < 0) {
-		dev_err(dev, "error resetting chip\n");
-		return err_read;
-	}
+	if (err_read < 0)
+		return dev_err_probe(dev, err_read, "error resetting chip\n");
 
 	if (status1 & S35390A_FLAG_24H)
 		s35390a->twentyfourhour = 1;
@@ -493,16 +491,12 @@ static int s35390a_probe(struct i2c_client *client)
 		/* disable alarm (and maybe test mode) */
 		buf = 0;
 		err = s35390a_set_reg(s35390a, S35390A_CMD_STATUS2, &buf, 1);
-		if (err < 0) {
-			dev_err(dev, "error disabling alarm");
-			return err;
-		}
+		if (err < 0)
+			return dev_err_probe(dev, err, "error disabling alarm");
 	} else {
 		err = s35390a_disable_test_mode(s35390a);
-		if (err < 0) {
-			dev_err(dev, "error disabling test mode\n");
-			return err;
-		}
+		if (err < 0)
+			return dev_err_probe(dev, err, "error disabling test mode\n");
 	}
 
 	device_set_wakeup_capable(dev, 1);

-- 
2.34.1


