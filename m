Return-Path: <linux-rtc+bounces-4584-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7790BB11A8B
	for <lists+linux-rtc@lfdr.de>; Fri, 25 Jul 2025 11:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFFD45A263D
	for <lists+linux-rtc@lfdr.de>; Fri, 25 Jul 2025 09:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42FD2727ED;
	Fri, 25 Jul 2025 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hp8d/An+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FB327145A;
	Fri, 25 Jul 2025 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753434433; cv=none; b=ABFi9YiS+/uFl4x087XP9ifxoiy+8tVUfTZ5bSbiR4Oj80vFLGqMbwmfUTJpCRzsNPqq6RTtrzVDk+pPD0JDXvPxzW+jf8sE1M3MqZRlfpCxySUq2JQWDDIONn0mp6tgr/uin/4qFFOmsX9cbo3woEuhb9VqGdwrQ9i+RmPKuq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753434433; c=relaxed/simple;
	bh=f+HoknzAfUhciWezY8bQPVYKEB9d842f3T6STLNB0iI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TVUU8jznXitrKDQST5QbHVLXXRESTw9v3YWAyWlcyAYKDhSEEMlsCEGodgLzZLzY+aDKwqeUIBZjzg2hto880IZrnr0XDCQc/Da263m3jh11HX3MbFgfLjGCamXUJlDpCC3gAB0bpPZjV7excZ2BNw7+mQSjo8ZB3BuIuY5TB1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hp8d/An+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0ED0C4CEE7;
	Fri, 25 Jul 2025 09:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753434433;
	bh=f+HoknzAfUhciWezY8bQPVYKEB9d842f3T6STLNB0iI=;
	h=From:To:Cc:Subject:Date:From;
	b=hp8d/An+y2FArfzE9H4sZS6jYwiQIyUMbmS5weoGaQg1mlyT0WnPlBtNneb3jt7Dt
	 9drDnGupWWvtcQlrrI/9wWQ3hVov+3y1Gdwcl5H28MB/Q9aFVpmcF5LXskYK4p0Ck2
	 gPKmADXObQtS6Bdhplis88LsmiPpchfqrrG0/USgVW9s5WnXZNSO2jUxMBE/8P2w78
	 STsN9R9NXbDJ7ims0l9tD3raUSRitnUcDmu5BRDr3rdvm2I7cicLFbrjdqFjvjmTXQ
	 oK2tNLEuEuFRIYREUMjCHpfU7xqwsQmBWIuOZjkCUb7IXrFhKN1+5nkx+t9gJk+RDe
	 MFIHjJ1m6FcIg==
From: Arnd Bergmann <arnd@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Lukas Stockmann <lukas.stockmann@siemens.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: pcf85063: hide an unused variable
Date: Fri, 25 Jul 2025 11:07:06 +0200
Message-Id: <20250725090709.2505113-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The newly introduced configuration is only used by code that is
inside of an #ifdef block, cauing a warning when that block is
disabled by the configuration is still there:

drivers/rtc/rtc-pcf85063.c:566:37: error: 'config_rv8063' defined but not used [-Werror=unused-const-variable=]

Add the same #ifdef here.

Fixes: a3c7f7e16ea8 ("rtc: pcf85063: add support for RV8063")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/rtc/rtc-pcf85063.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index d9b67b959d18..41e4a5a16574 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -563,6 +563,7 @@ static const struct pcf85063_config config_rv8263 = {
 	.force_cap_7000 = 1,
 };
 
+#if IS_ENABLED(CONFIG_SPI_MASTER)
 static const struct pcf85063_config config_rv8063 = {
 	.regmap = {
 		.reg_bits = 8,
@@ -574,6 +575,7 @@ static const struct pcf85063_config config_rv8063 = {
 	.has_alarms = 1,
 	.force_cap_7000 = 1,
 };
+#endif
 
 static int pcf85063_probe(struct device *dev, struct regmap *regmap, int irq,
 			  const struct pcf85063_config *config)
-- 
2.39.5


