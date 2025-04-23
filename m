Return-Path: <linux-rtc+bounces-3991-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A16A98A55
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 15:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86E231B61FE6
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Apr 2025 13:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9126886331;
	Wed, 23 Apr 2025 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+DQYZ1C"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6808F481B1;
	Wed, 23 Apr 2025 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413453; cv=none; b=WRHHcah1SRBv8DBr2Oq4XxfTyhubz9tpQE1dQuIfcRg82dhwgKE3dJCVfUZFI1qIgrhTG5JrLqWZeoQvlhJHG1Onfb1IKxpaEKuB5X0P+1U7c+ges56fF9mnzeszhvQXvgbKcYPpI0fXQ5RL2n4HXJB545JrNipcjzJnwpAjepY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413453; c=relaxed/simple;
	bh=y4Pg4hBfbtBrQn7ZCtEpf5lbHq9wpE2t0lOM183oZTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NggDlmx9drBJYhfWHje82jrMy6w2oCjG4spIv1m5BQch8je4jko7dragqYOqfomKusFFk2eLN5drIRKtwr6ZSHzBu2s7JnZObo4rKFAxcuh39/8pN5zi97A2HYKqjzqampmeS2E6h4vsQHcGHCZjaENV2385V/c6E2Aeea3tMXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+DQYZ1C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0457CC4CEF1;
	Wed, 23 Apr 2025 13:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745413453;
	bh=y4Pg4hBfbtBrQn7ZCtEpf5lbHq9wpE2t0lOM183oZTw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e+DQYZ1CFpjds+Rs5J1gYwIREqfpuDkurPXES/bUUdSK/hcGkZTsmS62E2KlVo+WS
	 TumJ1ciBk0OUzpWPW/rktK9MjEBJksBRtmq3SsBnX+PDA2cLJ6uTM4C+0pqJ/8GIT7
	 E2BK01lydY7P71X8x6QQxBc8mlJ7qubDQn4NaRh3lHPHkcVy5eMmhtrJWG6HlHV2kg
	 z/fglRXNEbPr4QIa4psa2q9bhJDevFQ9ukEB6F9IK4NAG99+XA8UrK0z48EGPWKTx2
	 R6JAAVKS2HW53KtO2Lgd5aKihpxzF0asgA9TJmumZYaxW55DEW7yUbVmrm1yjMf/bF
	 IZHC19AEu3WkA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1u7Zls-000000008Ad-1ch3;
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
Subject: [PATCH 3/7] rtc: da9063: drop unused module alias
Date: Wed, 23 Apr 2025 15:03:14 +0200
Message-ID: <20250423130318.31244-4-johan+linaro@kernel.org>
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

Fixes: 80ca3277bc7f ("rtc: da9063: Add DA9062 RTC capability to DA9063 RTC driver")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/rtc/rtc-da9063.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-da9063.c b/drivers/rtc/rtc-da9063.c
index 859397541f29..38988d952db8 100644
--- a/drivers/rtc/rtc-da9063.c
+++ b/drivers/rtc/rtc-da9063.c
@@ -513,4 +513,3 @@ module_platform_driver(da9063_rtc_driver);
 MODULE_AUTHOR("S Twiss <stwiss.opensource@diasemi.com>");
 MODULE_DESCRIPTION("Real time clock device driver for Dialog DA9063");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:" DA9063_DRVNAME_RTC);
-- 
2.49.0


