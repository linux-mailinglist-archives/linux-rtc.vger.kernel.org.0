Return-Path: <linux-rtc+bounces-3992-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DBCA98A54
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 15:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69FBC443E2C
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 13:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98705137750;
	Wed, 23 Apr 2025 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vh9WMBkK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F75157C93;
	Wed, 23 Apr 2025 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413453; cv=none; b=XOpTY9a8fZhi89MPERd16Z+uUVega3/wpasNqjCOixK8ZXiIK0EaDoBFQKL3bLDX7kK884PzSikCHbP1Pqd5gX6l5Txw/Wq1Bz/zXKDTp1d5ysEJpeAVp0KdfhxCmHxICFL/6JZPehLulFjlUAP07oDGH7KHwrJtpfSYmF/5cYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413453; c=relaxed/simple;
	bh=wr9kuspXHzK4dwpzzjI4ktGlrhZWqLUNz8asSpvIUA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gQXw/tKL/t9J0JDCu1OvDlUDfP4oW/9Q8r+XnuUYDONEBMSIVmLB6//whThTz197EBmfMA1jZuRtMQ1yqdpNlv98ZB54I4L/ETwvza8i2+BeAKQrc/FIFyGrdNqj6W8o0HMsKgpK2Cg/WbHELYHQ8vlp++CoOIk1cVmKkYSsRxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vh9WMBkK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06562C4AF09;
	Wed, 23 Apr 2025 13:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745413453;
	bh=wr9kuspXHzK4dwpzzjI4ktGlrhZWqLUNz8asSpvIUA0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vh9WMBkKHOyvwPbYaU7JsJuV217g1QGi/4hNLjAh6gfypUg1KbqzQYWFQZOLhBWVj
	 AQlXk1x0W/wvKnD0I5UTefUhGIj1cLg5ccdwq8O8JTKny22qc4t6E8tw/IAjD7XFNw
	 WB5QilpF42vz/RRxgD56wUggocMI6omRYjTt7IvttMhxjfx85qcMTSd128Bua17wAT
	 zBVFjvZTp61IX6AhbL2NiD4OcQL+uoOT2A5QJhNTvG1kDTufW/3qJrPMowT+xzTOIG
	 i3LZQXYbr4nuAD7xSMwQcsCJt9rXYPeQ+N8Z2CzloiL2qeSGbh5ooVtepjTNbuVnlW
	 pNTNRwj2sjmWA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1u7Zls-000000008Ab-1HzY;
	Wed, 23 Apr 2025 15:04:12 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sebastian Reichel <sre@kernel.org>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 2/7] rtc: cpcap: drop unused module alias
Date: Wed, 23 Apr 2025 15:03:13 +0200
Message-ID: <20250423130318.31244-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423130318.31244-1-johan+linaro@kernel.org>
References: <20250423130318.31244-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver only supports OF probe so drop the unused platform module
alias.

Fixes: dd3bf50b35e3 ("rtc: cpcap: new rtc driver")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/rtc/rtc-cpcap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-cpcap.c b/drivers/rtc/rtc-cpcap.c
index 568a89e79c11..c170345ac076 100644
--- a/drivers/rtc/rtc-cpcap.c
+++ b/drivers/rtc/rtc-cpcap.c
@@ -320,7 +320,6 @@ static struct platform_driver cpcap_rtc_driver = {
 
 module_platform_driver(cpcap_rtc_driver);
 
-MODULE_ALIAS("platform:cpcap-rtc");
 MODULE_DESCRIPTION("CPCAP RTC driver");
 MODULE_AUTHOR("Sebastian Reichel <sre@kernel.org>");
 MODULE_LICENSE("GPL");
-- 
2.49.0


