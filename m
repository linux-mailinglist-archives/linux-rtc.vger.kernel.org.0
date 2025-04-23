Return-Path: <linux-rtc+bounces-3988-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81ADFA98A58
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 15:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAA523B0C35
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 13:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0C133CFC;
	Wed, 23 Apr 2025 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PG6f0Jhu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244D443151;
	Wed, 23 Apr 2025 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413453; cv=none; b=Lv6pJpvPAcQ3kA5O7iferH6KVCK7gjn3o0tDdJPPicoAzISe5y+pq4lU19V+iULYu6SzosUrmXll3q3OBmpsMFd5rgqwSePDKBP89MYZhFrUQU85ywTm0S/FFeKZ1cBi4MDn+RLMk0t/0720PJLKZjsIGQJqKVjEJru3QXXExSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413453; c=relaxed/simple;
	bh=5j+PZyGK15b/xCvRJYDk2eey1BgzPdvVdWTGs9O+yVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tPzfI8Hh8VITK5hATaJrNhGWhQHv/Rm4GQdqTeoR4X2/AYc3G1DEc0PhTw9srpnI+HqwX1KdcGH6iZCNaeuYwUM+wwroOtZmhGmReMv0eO5WrFSYX36hdbcVrPRKiTdGJuxMDEhuevTOBK/RVBsipkZ9HNHrab+90QIJdUBGZNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PG6f0Jhu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 023DFC4CEED;
	Wed, 23 Apr 2025 13:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745413453;
	bh=5j+PZyGK15b/xCvRJYDk2eey1BgzPdvVdWTGs9O+yVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PG6f0Jhu2j4BENhfKCpK+JPGk2645M14vW/NIo0rCZnxB12RhUglye+WRqS2DxWmI
	 pT5mXxcZoITKugMbi7h5TPsfGwLi+uNnwWxjBbb0qiQx4iiuGGoV1hVfU1n7y3HLvc
	 vuT6VYEOchBsF0X0bWTQVIGR0GO3vc+8pS9TigAjE1s3/T36nA1VJ8ovmb9Sk33NRy
	 NP0l0BtetBuPKvhzl0ryUklGJEClKr3etB0xcJcsk1s6lI2qRlg1Yk4BfzYZcon3OW
	 daAJN4vRtyJ87ubrnVg/z0lNAeYtY4Fjkv+kaG6E+IaMlcm6c1TL3jQd2FQs7PvjR6
	 P5KJhKuiOMXqw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1u7Zls-000000008Ag-1wed;
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
Subject: [PATCH 4/7] rtc: jz4740: drop unused module alias
Date: Wed, 23 Apr 2025 15:03:15 +0200
Message-ID: <20250423130318.31244-5-johan+linaro@kernel.org>
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

The driver only support OF probe so drop the unused platform module
alias.

Fixes: 24e1f2c9383e ("rtc: ingenic: Only support probing from devicetree")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/rtc/rtc-jz4740.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index 44bba356268c..11fce47be780 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -437,4 +437,3 @@ module_platform_driver(jz4740_rtc_driver);
 MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("RTC driver for the JZ4740 SoC\n");
-MODULE_ALIAS("platform:jz4740-rtc");
-- 
2.49.0


