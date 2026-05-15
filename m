Return-Path: <linux-rtc+bounces-6530-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL/dI46TB2pU9AIAu9opvQ
	(envelope-from <linux-rtc+bounces-6530-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 23:43:42 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DA85585E9
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 23:43:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82D02306B4EA
	for <lists+linux-rtc@lfdr.de>; Fri, 15 May 2026 21:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16EE23EE1F2;
	Fri, 15 May 2026 21:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="BZQnmMjE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809563EDE42;
	Fri, 15 May 2026 21:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778881228; cv=none; b=ZegZ1kfX0WUoic+01lDP+j+UhsPXTmNG8aAD0kkgM5BROHXdYovn7ovBTJoP0s1Iah20FwmeXXN4uEJQIfEja9jUZ4j6XiDGxI2+HOux+jxnWaA4AV6wzDoEHUPokB46jkeV61c6fWXfYaE+GVVN64MA5myuYrMzMV+glDIH+Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778881228; c=relaxed/simple;
	bh=vP8w8lxUF7n9TxS1NBD9u73XFc/xRv4DArDfYKdCdqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mSCE4ZqxcK2HIgaaupOowaM7BFAwrE6JfDGvJdkNxG7AuxpBHzFG4c4tGvBaRQsU7GnSV6vWU3yTmBF6wGVHvJo8gcFcxovLpnOipZ8WzCixihA4SjZgdt/GThGxP9ydOeJv4IJVWT48JEWYtZnUe99gdsspWUyZK8+dW2chXIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=BZQnmMjE; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2187527163;
	Fri, 15 May 2026 23:40:26 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6CqZuTwtz8uW; Fri, 15 May 2026 23:40:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1778881225; bh=vP8w8lxUF7n9TxS1NBD9u73XFc/xRv4DArDfYKdCdqk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BZQnmMjE4Y9jH+l/tERxt0B4qoUXRIXJ8kYnKaC/0Q8J137wL54C8YDChDKnrkATC
	 chNfKMpCV4WMA0eBFFCg7n9NaJS0xIUGRgqqFXDHnnSffBrwejMelLswH7pFebELlx
	 gd6neew2rMkjItrgxjxUYltufwWJnvC3R3h0fozHUwgxWfgJZgvYol/v4UnPCGJDqO
	 Kn41Qz7CvINgaW+nO6yvUh+4C5rFk3/D3eEYTwEISwqgPFrPnzmYeDJcFlaC8NmOVx
	 2cQ1zyCBxJBigaWTA7EhPrFRuXX5OLYK8EZSucJhSNTX5LXM2Dzw/yJ7o4xd7pAwq3
	 CHImU0hs3uA0w==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sat, 16 May 2026 03:08:40 +0530
Subject: [PATCH v7 08/10] Documentation: leds: document pattern behavior of
 Samsung S2M series PMIC RGB LEDs
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-s2mu005-pmic-v7-8-73f9702fb461@disroot.org>
References: <20260516-s2mu005-pmic-v7-0-73f9702fb461@disroot.org>
In-Reply-To: <20260516-s2mu005-pmic-v7-0-73f9702fb461@disroot.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Nam Tran <trannamatk@gmail.com>, 
 =?utf-8?q?=C5=81ukasz_Lebiedzi=C5=84ski?= <kernel@lvkasz.us>, 
 Yassine Oudjana <y.oudjana@protonmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-doc@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Rspamd-Queue-Id: 45DA85585E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6530-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[disroot.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,disroot.org:email,disroot.org:mid,disroot.org:dkim]
X-Rspamd-Action: no action

Add documentation to describe how hardware patterns (as defined by the
documentation of leds-trigger-pattern) are parsed and implemented by the
Samsung S2M series PMIC RGB LED driver.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/leds/index.rst        |  1 +
 Documentation/leds/leds-s2m-rgb.rst | 60 +++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
index bebf440042787..23fa9ff7aaf4b 100644
--- a/Documentation/leds/index.rst
+++ b/Documentation/leds/index.rst
@@ -28,6 +28,7 @@ LEDs
    leds-lp5812
    leds-mlxcpld
    leds-mt6370-rgb
+   leds-s2m-rgb
    leds-sc27xx
    leds-st1202
    leds-qcom-lpg
diff --git a/Documentation/leds/leds-s2m-rgb.rst b/Documentation/leds/leds-s2m-rgb.rst
new file mode 100644
index 0000000000000..4f89a8c89ea86
--- /dev/null
+++ b/Documentation/leds/leds-s2m-rgb.rst
@@ -0,0 +1,60 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================================
+Samsung S2M Series PMIC RGB LED Driver
+======================================
+
+Description
+-----------
+
+The RGB LED on the S2M series PMIC hardware features a three-channel LED that
+is grouped together as a single device. Furthermore, it supports 8-bit
+brightness control for each channel. This LED is typically used as a status
+indicator in mobile devices. It also supports various parameters for hardware
+patterns.
+
+The hardware pattern can be programmed using the "pattern" trigger, using the
+hw_pattern attribute.
+
+/sys/class/leds/<led>/repeat
+----------------------------
+
+The hardware supports only indefinitely repeating patterns. The repeat
+attribute must be set to -1 for hardware patterns to function.
+
+/sys/class/leds/<led>/hw_pattern
+--------------------------------
+
+Specify a hardware pattern for the RGB LEDs.
+
+The pattern is a series of brightness levels and durations in milliseconds.
+There should be only one non-zero brightness level. Unlike the results
+described in leds-trigger-pattern, the transitions between on and off states
+are smoothed out by the hardware.
+
+Simple pattern::
+
+    "255 3000 0 1000"
+
+    255 -+ ''''''-.                     .-'''''''-.
+         |         '.                 .'           '.
+         |           \               /               \
+         |            '.           .'                 '.
+         |              '-.......-'                     '-
+      0 -+-------+-------+-------+-------+-------+-------+--> time (s)
+         0       1       2       3       4       5       6
+
+As described in leds-trigger-pattern, it is also possible to use zero-length
+entries to disable the ramping mechanism.
+
+On-Off pattern::
+
+    "255 1000 255 0 0 1000 0 0"
+
+    255 -+ ------+       +-------+       +-------+
+         |       |       |       |       |       |
+         |       |       |       |       |       |
+         |       |       |       |       |       |
+         |       +-------+       +-------+       +-------
+      0 -+-------+-------+-------+-------+-------+-------+--> time (s)
+         0       1       2       3       4       5       6

-- 
2.53.0


