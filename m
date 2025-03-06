Return-Path: <linux-rtc+bounces-3419-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB4AA558FB
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Mar 2025 22:43:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 653BB173C9C
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Mar 2025 21:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61D526D5B6;
	Thu,  6 Mar 2025 21:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eFEj9Iig"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C66C249E5;
	Thu,  6 Mar 2025 21:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741297375; cv=none; b=R1zKAcFtJLlbDHjnMjVUIC4X0xHyE3L43DHJ7xLKjUt56SaSRLn54E2SEk1wqm8SYJtAP3ZB5i4HWOIvcMciZwG5mUOAh7UYN4n/yrIF+Bb0Grg0vPhb+p/MmfCXnMIelckBtMPxm0KEOyK7U11DUCVl95qYA8NiopQzQqmqzzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741297375; c=relaxed/simple;
	bh=3f5+J57QZiPhCwvwGs9AjGy8dfyXp0K6l439RdN5j7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GQld6br/v1NcwMcFYxq3ax/zJtYNrMIZAtVCfBhIy4Xhhod1RpLTZAIX7dNUcvRCKWmNoCaOG9R4d0l9B3VxgKaoHxTdFOw/l1d1C8y2sLak0WF8oqH+cuR2QmJUJhJ+ZLzh6aQM8hBrB2Hve9n2arxfWc7IosjNTGxIZkf2HN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eFEj9Iig; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDD364444C;
	Thu,  6 Mar 2025 21:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741297366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y0aIB33mW8Pv6AsngXV4BfceV3FNsph3VejREguc1so=;
	b=eFEj9IignPVc+Jc3QIq4DZCMx748J+T/6YmyG0qPBnhgAH44CKjL/LIIm5x0J2e77zDo5G
	acBI2S6q7zfSlV1NHy9mQ6aneX9TEaeDoPUcQe/k7ix6dCDeXVs14Nk43h4c0JJXxhCRWQ
	OsgOY9ctxeIjDHnLFPrgSCgnF8QnZurSynFIoqtZkDWukKYoD+acYTNzoR7x3lOMvzJR9I
	dmGmP/xlgX1KuiODbtv4l57ohUAb4KWf5THebi9LoS7kI/gqZSH3Q14pWyqHDCVLwO0nK+
	VgAJnr9zP/ZPg0gUN20e90Kkz/Y7nP/SZX18cYQAdzTX/a10PTpwezu5jeuHsw==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] rtc: rv3032: fix EERD location
Date: Thu,  6 Mar 2025 22:42:41 +0100
Message-ID: <20250306214243.1167692-1-alexandre.belloni@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdekkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogetfedtuddqtdduucdludehmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmnecuggftrfgrthhtvghrnhepgedtffeugeeftedtfffhiedtjeefieeuveelffetledvueeludeggedtjefgveevnecukfhppeejjedrudehtddrvdegiedrvdduheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeejjedrudehtddrvdegiedrvdduhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

EERD is bit 2 in CTRL1

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3032.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rv3032.c b/drivers/rtc/rtc-rv3032.c
index 35b2e36b426a..cb01038a2e27 100644
--- a/drivers/rtc/rtc-rv3032.c
+++ b/drivers/rtc/rtc-rv3032.c
@@ -69,7 +69,7 @@
 #define RV3032_CLKOUT2_FD_MSK		GENMASK(6, 5)
 #define RV3032_CLKOUT2_OS		BIT(7)
 
-#define RV3032_CTRL1_EERD		BIT(3)
+#define RV3032_CTRL1_EERD		BIT(2)
 #define RV3032_CTRL1_WADA		BIT(5)
 
 #define RV3032_CTRL2_STOP		BIT(0)
-- 
2.48.1


