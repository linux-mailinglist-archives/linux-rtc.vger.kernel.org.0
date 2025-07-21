Return-Path: <linux-rtc+bounces-4534-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D517B0C7AA
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Jul 2025 17:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BCF618939F2
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Jul 2025 15:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B36928D85C;
	Mon, 21 Jul 2025 15:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="xVNCWfhl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFEBA923;
	Mon, 21 Jul 2025 15:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753112023; cv=none; b=QMVwq5UakJuukpHzXA90zGK1T4Ct0A3aY0I9Ljsv6cWjn1U/hjcz3lfHHUoT3Z+cY4rNu40GqggGXpB8NHPndf5XL93vQtHjKFw3oz34zZfAoQ1u7mf+a6O59d6b+iww/8ftshX7hSNOCY+woAeSgCcHlsecNQLa6Vpz3Vm1NSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753112023; c=relaxed/simple;
	bh=QPcmBTAvRNf2cvnNNR6bBadzyZYWFJI51TKBWRMLxO8=;
	h=From:To:Cc:Date:Message-Id:MIME-Version:Subject; b=EKc05sjTlBMtqRn5ZTFORoroyDQy4NUmZA/IFq+kDzFHvRH70cpRAQIZNcPQvw6XcTPA3Zn/Uz5CljmeDuI5XWZ7wzrOYzOarixisC9+pvrA0uLQbmTstjrCCgn5HozLp109OZLKp6A4eX21d9M73QAgJydyO0okAo44WRo2e84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=xVNCWfhl; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=IiyHGua9ePsRi9HR9A8rx3faBuhMh6XaApQGZqQsY7I=; b=xVNCWfhlFgHLDdoZIyplueSZZB
	OCAhxtxgMj3NU98Yxhsh+smFntub6nPHQtGkEh1MmQrFzE4QtX2zEJAXQG+eLeQ+pDfKrvMGWDCE8
	Uyg/b9/o1WuiFazB8ct/W6UgcLwyyyFoRvHdl0vePay0pUq0LoSsbOuEdPlew7Oqgn0g=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:34006 helo=localhost.localdomain)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1udsWI-0001cH-Dm; Mon, 21 Jul 2025 11:33:38 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: hugo@hugovil.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Mon, 21 Jul 2025 11:33:31 -0400
Message-Id: <20250721153332.2177134-1-hugo@hugovil.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 184.161.19.61
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH] rtc: add BSM flags descriptions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

It is hard to decipher what the RTC BSM flags mean, so add
meaningful descriptions.

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 include/uapi/linux/rtc.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/uapi/linux/rtc.h b/include/uapi/linux/rtc.h
index 97aca4503a6a..da65130e316d 100644
--- a/include/uapi/linux/rtc.h
+++ b/include/uapi/linux/rtc.h
@@ -141,10 +141,15 @@ struct rtc_param {
 #define RTC_PARAM_CORRECTION		1
 #define RTC_PARAM_BACKUP_SWITCH_MODE	2
 
+/* Backup switch mode */
 #define RTC_BSM_DISABLED	0
-#define RTC_BSM_DIRECT		1
-#define RTC_BSM_LEVEL		2
-#define RTC_BSM_STANDBY		3
+#define RTC_BSM_DIRECT		1 /* Switch if Vbackup > Vdd */
+#define RTC_BSM_LEVEL		2 /* Switch based on a threshold, usually with an hysteresis */
+#define RTC_BSM_STANDBY		3 /*
+				   * Switch if Vdd > Vbackup.
+				   * Useful to ensure the RTC doesn't draw any
+				   * power until the device is first powered on.
+				   */
 
 #define RTC_MAX_FREQ	8192
 

base-commit: 0bafe291cb429d39b5ff70bcf7b2f3ab026dcb02
-- 
2.39.5


