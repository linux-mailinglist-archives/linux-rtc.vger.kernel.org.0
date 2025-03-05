Return-Path: <linux-rtc+bounces-3414-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D48CA50E67
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Mar 2025 23:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A14E188A513
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Mar 2025 22:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423A51FFC75;
	Wed,  5 Mar 2025 22:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IxsQ68Hv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8AA146588;
	Wed,  5 Mar 2025 22:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741213034; cv=none; b=jJh64kSMCzXQw3MefRjHgksCRMhVuOeyHWzwvQTjOHC/xhpGBvf5LMJfUTyCNqi6eQ0RDZ/3S4Iipdnc8TNm6HfNtAN937TymxaQoSo0eBVltP3TpAHj3pIOS13YSkOZBqVTaD9SQv/8i6dEZiQu+hNn/xfWhTdLABSfUxY1v5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741213034; c=relaxed/simple;
	bh=TIQ9DsmUayaEMPwOEJ3FYJ9PugSAj19u6KaNBelk9A8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AkHC2r58CRChosDq1YieUrNfwALpiOgWKIlEIkEg4vR1PRA/f/ZukKSWzQUTWnzDV8FSVkxzLL5sz2NjJDyhzjRNGq/bf+im4akcI+FoVRnRL2y/z7m31xq1vN+InBB6JVKZx4g+N/7iLku11aUsGFf/0D6bq+NPvhRrbtf/xmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IxsQ68Hv; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D153844389;
	Wed,  5 Mar 2025 22:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741213024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=52JzpFAmR4s4hHmh/IBHGR01Q5kxk91ZCSuKPC7c9gM=;
	b=IxsQ68HvshiP6OZz8oxdkI3snpV5GkgiLukuucPAUUKn87KWGHRNjzbQFIjUMcSQkGV4z8
	g5B2flY1i+50VJVbSK6sbt3M7E69iJp/M1Kac+oY9bgKL0Hih4coheSUfQ4IWL8hb/k5OC
	sn9yBEi5P6no8N0buNMS//BXsxuFpt5at+lcFHMU1wB9U7aVgkRBFPASuHYGpJH62/kJJD
	FnVWAcGGRidKiN2URY7IrZsvYGMkNHc1lL5YRn5O7sc8XIaGBhKCoSvjbyKX5ExG8WsTEZ
	NIiAbsCiwWXsSGYti7p20k9oUrelnAEi1igq6jrEGvTsYb/BNIlQ8Bcj1PBOFw==
From: alexandre.belloni@bootlin.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: kernel test robot <lkp@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: pl031: document struct pl031_vendor_data members
Date: Wed,  5 Mar 2025 23:16:59 +0100
Message-ID: <20250305221659.1153495-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdeitdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmnecuggftrfgrthhtvghrnhepjeeghedttddvkedugfelffdtgfffhedtkeeugeetueetvddvtdegvdevueejjedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepjeejrdduhedtrddvgeeirddvudehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepjeejrdduhedtrddvgeeirddvudehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlkhhpsehinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhto
 heplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Document the range related members of struct pl031_vendor_data.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503011015.SYvdddTc-lkp@intel.com/
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pl031.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-pl031.c b/drivers/rtc/rtc-pl031.c
index 47bfc5395e59..0401c51191e5 100644
--- a/drivers/rtc/rtc-pl031.c
+++ b/drivers/rtc/rtc-pl031.c
@@ -74,6 +74,8 @@
  * @st_weekday: if this is an ST Microelectronics silicon version that need
  *	the weekday fix
  * @irqflags: special IRQ flags per variant
+ * @range_min: minimum date/time supported by the RTC
+ * @range_maximum: maximum date/time supported by the RTC
  */
 struct pl031_vendor_data {
 	struct rtc_class_ops ops;
-- 
2.48.1


