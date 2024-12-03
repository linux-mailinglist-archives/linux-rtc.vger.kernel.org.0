Return-Path: <linux-rtc+bounces-2662-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D668A9E274F
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Dec 2024 17:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCA88160E7F
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Dec 2024 16:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626F21F8933;
	Tue,  3 Dec 2024 16:25:11 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8312F1F8937
	for <linux-rtc@vger.kernel.org>; Tue,  3 Dec 2024 16:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733243111; cv=none; b=HbGKnUCm1MIn+c66ckdk6veRExbJwX2BJr84mWx7+emxeevC4GRYyPY7/UYdvhu2azOKFirRSlnD0OYh9KqkfbP2rLHHDmsD/7FlUGQ9Jc4iEH72UlQGcwLDtmYlVyh4JWi3r/BVvGmy9p1vhnjFHdDBvvUIhhT9n+VX/GMflu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733243111; c=relaxed/simple;
	bh=N4TqWut4vJvpFZL8ZWPH60K8BoMPjePMb/Mr0Rm2bbs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I1HGDHsMqgV9REbcS9ITIa5Zyeci27lt5Qr7tVIy+v3rIwXcyZmOVAKTrORgT5fx2ZkJbbUyO/QmF4Kyz4E63EWgPowDp5eUy7ZeQZL7PhWDIldDIJ4DJShhl/NK0G2zBB7IRuIn687KSg/nmZFpsPoupiajsCXXl6wiMzwkAEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:829d:a1e7:5b32:5d8e])
	by andre.telenet-ops.be with cmsmtp
	id kGR72D0043sLyzB01GR7Ph; Tue, 03 Dec 2024 17:25:07 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tIVhz-000DUP-3v;
	Tue, 03 Dec 2024 17:25:07 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tIVhy-00ARCF-Ve;
	Tue, 03 Dec 2024 17:25:06 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Cc: linux-rtc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] rtc: RTC_DRV_SPEAR should not default to y when compile-testing
Date: Tue,  3 Dec 2024 17:25:05 +0100
Message-Id: <7b8eefe3b0150101ba01c3ea55e45aa3134059ba.1733243007.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merely enabling compile-testing should not enable additional
functionality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/rtc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index a60bcc791a4803b7..0bbbf778ecfa3e4c 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1316,7 +1316,7 @@ config RTC_DRV_SC27XX
 config RTC_DRV_SPEAR
 	tristate "SPEAR ST RTC"
 	depends on PLAT_SPEAR || COMPILE_TEST
-	default y
+	default PLAT_SPEAR
 	help
 	 If you say Y here you will get support for the RTC found on
 	 spear
-- 
2.34.1


