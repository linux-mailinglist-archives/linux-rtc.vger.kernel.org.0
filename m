Return-Path: <linux-rtc+bounces-6576-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6fnsLLS6F2rMOwgAu9opvQ
	(envelope-from <linux-rtc+bounces-6576-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 05:47:00 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B015EC471
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 05:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E6BE3021716
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 03:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075D72F8EA0;
	Thu, 28 May 2026 03:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="iLnpGP8b"
X-Original-To: linux-rtc@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FDF1A682B;
	Thu, 28 May 2026 03:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779940016; cv=none; b=OZ28HfGHBeVjR8DZgumEKnSuJdt9SS7/Ib8dVg55PLgI7CIBuKuuxgENSJFjb2C28QNQDmxcOgq9Wa5QVUuAMSwk4XKEMH7/IX1OrTKIz3lIksigTaIt/cDhlBaCNY8Cncw+iE+g14RuI8Ea+9Y9X6dNdzpphHrjcsGGTAAR724=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779940016; c=relaxed/simple;
	bh=Q3e7GS24NZWO8n+pR1VieccH/HXq4xPQg7nQSsXSHtA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=KRiFCc3pcCahzvc224raevZ8KmoveoP61YP3TjS++3J1Qm+YYa/2SFsMxs4XbxQsZL2wRXSejXuXGT+QJOpxpldIchEF3SKIyZlWErOF2ENh5rmRWhZ1mgV6pYq0I2ouamXJM6eoLLEmZ0UJ/ca9JbH8gEleisX8Knodj8FNNq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=iLnpGP8b; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779940015; x=1811476015;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=Q3e7GS24NZWO8n+pR1VieccH/HXq4xPQg7nQSsXSHtA=;
  b=iLnpGP8bC9QDT00gcrRReLQuLCWgesJIrPU+7XNYxhROJeEa6QarEwQG
   +7kLbAqJ0t1V3nsE9rpnpkoHf48awwrxQPFZDEAEFFyQ3rRbJcKtSn7dV
   iDbtcCVX0QqvvPp1B8Esj73UekizlCgFmuLLkLLZoMpj5arfwPTioS4qt
   awYRmBk5C+xEEIDIFlv4O3KYi+28VEW56Ypl9CKtHDsvWH7FkJPuR61+y
   MZR0Md8ZTscpkWWiOC23g5nd05cMR9hhgOZ8jW0SNGH01B8fXTH5ZLN0D
   h53oFrO23c1XHTPKZ91cQvcfqohv3cRE2o0/Jn9tHgwMSogakesBdSFEZ
   A==;
X-CSE-ConnectionGUID: hUTYoKN3SwSWX+HnMTj47g==
X-CSE-MsgGUID: wZReTwe/TzCBa4PIx8zIkg==
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="58160222"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 20:46:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Wed, 27 May 2026 20:46:48 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 27 May 2026 20:46:45 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Subject: [PATCH 0/4] rtc: convert several drivers to dev_err_probe()
Date: Thu, 28 May 2026 09:16:43 +0530
Message-ID: <20260528-cleanup-dev-err-probe-rtc-v1-0-29dc9cb6c3f0@microchip.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKO6F2oC/x3MQQqDMBBG4avIrDsQg4r0KsWFGX91QGKYWCmId
 29w+S3euyjDFJne1UWGU7PusaB+VSTrGBewTsXkne9c63uWDWP8Jp5wMsw42R7AdggHaZq5Ewn
 iaip9Msz6e96f4b7/NoMtcGsAAAA=
X-Change-ID: 20260528-cleanup-dev-err-probe-rtc-bc44f6ccbc01
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6576-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,linux.alibaba.com,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,microchip.com:email,microchip.com:mid,microchip.com:dkim]
X-Rspamd-Queue-Id: 14B015EC471
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use dev_err_probe() in place of dev_err() and return across four rtc
drivers, which communicates the error type and helps debugging
hardware issues.

Build-tested with x86_64 allmodconfig. No functional change.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
Balakrishnan Sambath (4):
      rtc: palmas: convert to dev_err_probe()
      rtc: moxart: convert to dev_err_probe()
      rtc: sc27xx: convert to dev_err_probe()
      rtc: s35390a: convert to dev_err_probe()

 drivers/rtc/rtc-moxart.c  | 25 +++++++++----------------
 drivers/rtc/rtc-palmas.c  | 21 +++++++--------------
 drivers/rtc/rtc-s35390a.c | 18 ++++++------------
 drivers/rtc/rtc-sc27xx.c  | 24 ++++++++----------------
 4 files changed, 30 insertions(+), 58 deletions(-)
---
base-commit: b72386864481cf7fb6153842d22561ac3032302f
change-id: 20260528-cleanup-dev-err-probe-rtc-bc44f6ccbc01

Best regards,
-- 
Balakrishnan Sambath <balakrishnan.s@microchip.com>


