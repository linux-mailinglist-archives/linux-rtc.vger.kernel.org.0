Return-Path: <linux-rtc+bounces-3830-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4FEA80ECB
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Apr 2025 16:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57C543BB003
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Apr 2025 14:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FF41DF728;
	Tue,  8 Apr 2025 14:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jEKgs8sd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC23D1DE3A9;
	Tue,  8 Apr 2025 14:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123331; cv=none; b=hw25EIQMhJKEYW7040VJI0CpJZND59PazwtWnQBXgWG8JxF5lA5F02OIATvVmBNN7JEqq8PkTrD6+gh0Q1ehOCdXRTMCCzndYJ7y5r7vEFTz7cIhvgl0FAvJDZEV80hg9LEACtV/z9tekIOjczFnbyhoz89sZEwXg1AFy1vSMMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123331; c=relaxed/simple;
	bh=9ImBzIZtqGsJ1SHaUVZ01p2SwfBctJtqfs9D1vh30+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eW03V/UzL+HXzjLF79q/RfvcAdp//mYPlXRfTWrIiE3uAwt0/jeNvEBgcuFIKfBt097V1oFXEhG1r7AmIm5MuR10bEJD0p2ZMykj3yRr/dxCy6I1Wti4RB/O8s8pmi8LZAGNrQ7T6npxX7lEaQkUFX3rdifYFPATnhweuWmWvv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jEKgs8sd; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1020442C3;
	Tue,  8 Apr 2025 14:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744123328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iULc9f9XDkhckPow9uXWfLJLBIlhOd96cLfxtQCU/7k=;
	b=jEKgs8sdKKpEVq8+rB9cOuVLko8jabUBt44MMm/m+LfV4xYeG/G7YfG3lgFUiTy0ZeVGN2
	4Q0KFzA6NvA9fKG0djDNzoyeIPOe2IWzeUmKmM8DJWfy7IUNmAymDmmxDfTl17JvEZS927
	kr+8echwkdXE/iqXFMgMC3Rux3qd/vOZ7dwS3818bw7RdNoeFU8sjMMTWUKepHnhOlbpR2
	XWySaTqFiKUNQ0bhNay59MzwVm2LvbVTY7PKJBr31TOmG5YjXeo6CQbMvZ4z+sCI5xvteX
	B/nu8hkXtDgexD714/tAvcrA8blQbFUHApSaOQP7MmVOpG6NqTuu9kyzFTrvGQ==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: interface: silence KMSAN warning
Date: Tue,  8 Apr 2025 16:42:03 +0200
Message-ID: <20250408144203.3869821-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -85
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeffeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogetfedtuddqtdduucdludehmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmnecuggftrfgrthhtvghrnhepgedtffeugeeftedtfffhiedtjeefieeuveelffetledvueeludeggedtjefgveevnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemrggutdefmeegfheltgemfeefjehfmehffeefugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemrggutdefmeegfheltgemfeefjehfmehffeefugdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkv
 ghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

KMSAN complains that alarm->time can be used uninitialized. Pass 0 to
trace_rtc_read_alarm in case it has not been set.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/interface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index aaf76406cd7d..dc741ba29fa3 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -205,7 +205,7 @@ static int rtc_read_alarm_internal(struct rtc_device *rtc,
 
 	mutex_unlock(&rtc->ops_lock);
 
-	trace_rtc_read_alarm(rtc_tm_to_time64(&alarm->time), err);
+	trace_rtc_read_alarm(err?0:rtc_tm_to_time64(&alarm->time), err);
 	return err;
 }
 
-- 
2.48.1


