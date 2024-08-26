Return-Path: <linux-rtc+bounces-1743-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0837195F976
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2024 21:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BA021C21B2A
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2024 19:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7CA1991BA;
	Mon, 26 Aug 2024 19:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YiFuITya"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7398D194138;
	Mon, 26 Aug 2024 19:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724699608; cv=none; b=DoorzezAmz6J7YCM3Jxg6qi3qJ+7tPYuWlM7ruDQ9ih8y0hmDDEb6xU3QHIitQBOS8zXMilCQmby5W9K0A7E4QP1CnZgn0Fkna5LjkWETczlkQfE8dTVw1t6SIOKrrnf1fjo6Q0fN35j27jAl3ZrXGJGS/csTnSFiFvUoaFC+j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724699608; c=relaxed/simple;
	bh=jyHyhjj34+hzwr/t69cAHCAN1hE5w03UJiK2d99qDqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SGX3n/mTnG+MCV9qzQaboILY5GLo0s8L1WkBe/Qp4kNMIhJjRZ8uNLRAKV9KNihk7VfcQ6FfbhWl2lLDmCb5wbqzzkz1nzvaRnp8BTVHsrvveBoEN41KynoqPjcCMvQVrE/oX0o66TP+rzi5LrY5yCJ7h8i6ohrB3SDhbEbr3zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YiFuITya; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C310CC4DDEC;
	Mon, 26 Aug 2024 19:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724699608;
	bh=jyHyhjj34+hzwr/t69cAHCAN1hE5w03UJiK2d99qDqo=;
	h=From:To:Cc:Subject:Date:From;
	b=YiFuITyaq+bLdNSRXuDwPQ9AccP/61YfdVhFHSS9/sw32txS5geIXnUaPy/xsL1wI
	 Fm10M66gFSwEWb2dFIsoH/d5SwITQcPgCPw3ofz6tEmn1lGCqhDO48I7kkY72uzbzq
	 imkSoctyvwikdCFoy0kucjrSg2TNQwF7BiVgRlaViLRm8wi99Ntqg8iU61pM3Zh11n
	 OOgEBU+NgC3H8TLPPRixZD/20tBVgZQPLhDrPnry0/ynDWVqqP+/uYwFucdBqSphN1
	 SjSmPHTcVs3Q3QxCGTAe3ImO92wXpIAx80h0a9nfpOzjG/qT4LJtVuKf0tg7UvB90B
	 JPP7WHCNck4jQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: s35390a: Drop vendorless compatible string from match table
Date: Mon, 26 Aug 2024 14:13:20 -0500
Message-ID: <20240826191321.1410668-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's no need to list "s35390a" in the DT match table. The I2C core
will strip any vendor prefix and match against the i2c_device_id table
which has an "s35390a" entry.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/rtc/rtc-s35390a.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
index 2d6b655a4b25..e3dc18882f41 100644
--- a/drivers/rtc/rtc-s35390a.c
+++ b/drivers/rtc/rtc-s35390a.c
@@ -56,7 +56,6 @@ static const struct i2c_device_id s35390a_id[] = {
 MODULE_DEVICE_TABLE(i2c, s35390a_id);
 
 static const __maybe_unused struct of_device_id s35390a_of_match[] = {
-	{ .compatible = "s35390a" },
 	{ .compatible = "sii,s35390a" },
 	{ }
 };
-- 
2.43.0


