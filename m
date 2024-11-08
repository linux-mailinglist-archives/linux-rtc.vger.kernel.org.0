Return-Path: <linux-rtc+bounces-2471-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 182869C1631
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Nov 2024 06:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 351501C22565
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Nov 2024 05:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990D61CF5F9;
	Fri,  8 Nov 2024 05:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zk4Af8mA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B931C460C;
	Fri,  8 Nov 2024 05:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731045290; cv=none; b=NH+4hob6drLbLrqPyJ0wkRgXk5CtYnKD1FWs/GnV8WjPfnN3Ag+YwmMep2NPJYWxg6K/qWn0Z8EzbBbkcIMIBISPFFk/WN02UhHfZZvZY1Jwu3AhW2GuReXZl30qoKtw5UNByqEcFuz6cZ4l+VuovfpCKDewima2CT+6YkWM0nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731045290; c=relaxed/simple;
	bh=SVIUbQzxLofeJMLFPpkqoKqNt1gn+vEU3tlnN8KXr+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BxlUnfjK9m0J6L9ZxttWLHetXypvEJzybnehFWJfanNOOrbaKs16cFgRIx62BE5w5HHFUBSRjYh6ui5SI9GvgKjaZpxXD4FL2zQT6IJ5jvHSgELi6BVWOdFbEWsrU4X2FLxIRPed8BAf2Qpc0Nn/Hu49wRpWr1mmMk0Vujrt/8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zk4Af8mA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 306EBC4CED5;
	Fri,  8 Nov 2024 05:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731045290;
	bh=SVIUbQzxLofeJMLFPpkqoKqNt1gn+vEU3tlnN8KXr+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Zk4Af8mAZhaQg02H1wiTVNGQFzWpvL4i53HYZF7DC3ZhfpL0q+ex4mToiNInCRm1+
	 S9vAQWQryYwkkU8mo+PBHoxGImjidC0wLKcE31wYkwNO+7MBnMVJO83e18AYfmSSLK
	 FcagCmb2ZbyWngoE+S2ljyz1hjzM7r1ToVS6CswIudDmyzA8ioyIGsH7vfOdRxqFyE
	 3q9z/yLirsSMmLzTJYtoLYDJ86FfgFeBU2j2vQaZL27qcq/gmWJbyF1RPE+WEh3wgl
	 aURmIaxoEEE5io8VcEJgkqF2nEwEUBr4Kt3BnKCjEx6LeRau4QgVSabAN8RMDRya3N
	 LKecrCtlTzahA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24055D5E13A;
	Fri,  8 Nov 2024 05:54:50 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 08 Nov 2024 13:54:43 +0800
Subject: [PATCH v5 3/3] MAINTAINERS: Add an entry for Amlogic RTC driver
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-rtc-v5-3-0194727c778b@amlogic.com>
References: <20241108-rtc-v5-0-0194727c778b@amlogic.com>
In-Reply-To: <20241108-rtc-v5-0-0194727c778b@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731045288; l=931;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=Gn6Ya+wBxnc2VJ4I38RsdaXoWkK7Fe7p7YGOFyMiaMc=;
 b=JauI8zgU05bKeqeyzwuQBA2wM5STfZhy/ebpOWWWoTKxzWe5isdRVwCx2UNb5IujppvIWQH4S
 jRpneopPvcTD6rp07VFBCYsfr1yysXZdFURcmzrPv/o0o0p2PID/UfJ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Yiting Deng <yiting.deng@amlogic.com>

Add Amlogic RTC entry to MAINTAINERS to clarify the maintainers.

Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c27f3190737f..86675e03888c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1209,6 +1209,14 @@ F:	Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
 F:	drivers/perf/amlogic/
 F:	include/soc/amlogic/
 
+AMLOGIC RTC DRIVER
+M:	Yiting Deng <yiting.deng@amlogic.com>
+M:	Xianwei Zhao <xianwei.zhao@amlogic.com>
+L:	linux-amlogic@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
+F:	drivers/rtc/rtc-amlogic-a4.c
+
 AMPHENOL CHIPCAP 2 HUMIDITY-TEMPERATURE IIO DRIVER
 M:	Javier Carrasco <javier.carrasco.cruz@gmail.com>
 L:	linux-hwmon@vger.kernel.org

-- 
2.37.1



