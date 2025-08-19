Return-Path: <linux-rtc+bounces-4714-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F49B2BF4A
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 12:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AB4CD4E061C
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 10:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15EA322DC5;
	Tue, 19 Aug 2025 10:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="gBkLkNk9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771D8299ABF
	for <linux-rtc@vger.kernel.org>; Tue, 19 Aug 2025 10:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755600458; cv=none; b=o6fLgRw52b+XgZ5pvpGovlPGXqiTlcYTyUuFe2KE7itfyGxl+X5RosUkvc6DFo3PG+rFIxrlVGm5h2Z3M0AStND1p0ZZacUCc1ULnyMNS83JCUSPrsqOoXJKHdvwbDQnqGdE2VXfmOBdjBDx8RsifGpE7af+9hyGF6q5DKgcmng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755600458; c=relaxed/simple;
	bh=B/piRdm9KsicCGzPdzlO4YQVIrOsVXPj98YRZT5s/30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZ9x/CkQ+fAIM5o1AasWbRAnUvolegJRN/420SejXbLQpqadaGaovjxaRiE95pefHMEteTSNqOdkpMe/xCEN+em+e62B6BAYz+kbiZLbg2FZ/xGm96mlafcJVPDE/8nk3X9ab3MoGg7UyNcdxC10ZtTLHEKOr9v04U2c3RvfcAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=gBkLkNk9; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 2F8BB1012BB3
	for <linux-rtc@vger.kernel.org>; Tue, 19 Aug 2025 16:17:34 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 2F8BB1012BB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1755600454; bh=B/piRdm9KsicCGzPdzlO4YQVIrOsVXPj98YRZT5s/30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gBkLkNk9kUTPt6ZQO3Y/2islBlH6PGa8eKqqnpnNnF4FGqzmwvH8FWpkCeEM9YxQb
	 3ItmMQuwlZRKjfo2x80uQ+p5LxE2tkH5gmDqP9hdKFRgiSg8OHSSqmZWgjoPBzkoZy
	 VInUlwSerx1WVQZqiybiJ+TWdu2p/tjBvEzMrAqs=
Received: (qmail 12420 invoked by uid 510); 19 Aug 2025 16:17:34 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 3.468614 secs; 19 Aug 2025 16:17:34 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
  by ldns2.iitb.ac.in with SMTP; 19 Aug 2025 16:17:30 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns2.iitb.ac.in (Postfix) with ESMTP id 40ABB3414EC;
	Tue, 19 Aug 2025 16:17:30 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 56F831E81492;
	Tue, 19 Aug 2025 16:17:29 +0530 (IST)
Date: Tue, 19 Aug 2025 16:17:23 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: alexandre.belloni@bootlin.com, mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, akhileshpatilvnit@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH 1/1] rtc: ds1307: add support for clock provider in ds1307
Message-ID: <6b44b47567e418a7bc3f68b626e287b8106641f3.1755599808.git.akhilesh@ee.iitb.ac.in>
References: <cover.1755599808.git.akhilesh@ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1755599808.git.akhilesh@ee.iitb.ac.in>

Add support for square-wave output for ds1307 rtc via
common clock framework clock provider.

tested on TI am62x SK board using ds1307 RTC hardware module.

Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
 drivers/rtc/rtc-ds1307.c | 139 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 137 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 7205c59ff729..dd99b9a3836d 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -1658,18 +1658,153 @@ static int ds3231_clks_register(struct ds1307 *ds1307)
 	return 0;
 }
 
+/* ds1307 RTC clock output support */
+static unsigned long ds1307_clk_rates[] = {
+	1,
+	4096,
+	8192,
+	32768,
+};
+
+static unsigned long ds1307_clk_sqw_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
+{
+	int ret;
+	unsigned int rate_id;
+	struct ds1307 *ds1307 = clk_sqw_to_ds1307(hw);
+
+	ret = regmap_read(ds1307->regmap, DS1307_REG_CONTROL, &rate_id);
+	if (ret)
+		return ret;
+
+	rate_id &= (DS1307_BIT_RS1 | DS1307_BIT_RS0);
+
+	return ds1307_clk_rates[rate_id];
+}
+
+static int ds1307_clk_sqw_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ds1307_clk_rates); i++) {
+		if (req->rate <= ds1307_clk_rates[i]) {
+			req->rate = ds1307_clk_rates[i];
+			return 0;
+		}
+	}
+
+	/* Default rate 1Hz */
+	req->rate = ds1307_clk_rates[0];
+
+	return 0;
+}
+
+static int ds1307_clk_sqw_set_rate(struct clk_hw *hw, unsigned long rate,
+				   unsigned long parent_rate)
+{
+	int id, ret;
+	struct ds1307 *ds1307 = clk_sqw_to_ds1307(hw);
+
+	for (id = 0; id < ARRAY_SIZE(ds1307_clk_rates); id++) {
+		if (ds1307_clk_rates[id] == rate)
+			break;
+	}
+
+	if (id >= ARRAY_SIZE(ds1307_clk_rates))
+		return -EINVAL;
+
+	ret = regmap_update_bits(ds1307->regmap, DS1307_REG_CONTROL,
+				 DS1307_BIT_RS0 | DS1307_BIT_RS1, id);
+
+	return ret;
+}
+
+static int ds1307_clk_sqw_prepare(struct clk_hw *hw)
+{
+	int ret;
+	struct ds1307 *ds1307 = clk_sqw_to_ds1307(hw);
+
+	ret = regmap_update_bits(ds1307->regmap, DS1307_REG_CONTROL,
+				 DS1307_BIT_SQWE, DS1307_BIT_SQWE);
+
+	return ret;
+}
+
+static void ds1307_clk_sqw_unprepare(struct clk_hw *hw)
+{
+	struct ds1307 *ds1307 = clk_sqw_to_ds1307(hw);
+
+	regmap_update_bits(ds1307->regmap, DS1307_REG_CONTROL,
+			   DS1307_BIT_SQWE, ~DS1307_BIT_SQWE);
+}
+
+static int ds1307_clk_sqw_is_prepared(struct clk_hw *hw)
+{
+	int ret;
+	struct ds1307 *ds1307 = clk_sqw_to_ds1307(hw);
+	unsigned int status;
+
+	ret = regmap_read(ds1307->regmap, DS1307_REG_CONTROL, &status);
+	if (ret)
+		return ret;
+
+	return !!(status & DS1307_BIT_SQWE);
+}
+
+static const struct clk_ops ds1307_clk_sqw_ops = {
+	.prepare = ds1307_clk_sqw_prepare,
+	.unprepare = ds1307_clk_sqw_unprepare,
+	.is_prepared = ds1307_clk_sqw_is_prepared,
+	.recalc_rate = ds1307_clk_sqw_recalc_rate,
+	.set_rate = ds1307_clk_sqw_set_rate,
+	.determine_rate = ds1307_clk_sqw_determine_rate,
+};
+
+static int rtc_ds1307_clks_register(struct ds1307 *ds1307)
+{
+	struct device_node *node = ds1307->dev->of_node;
+	struct clk *clk;
+	struct clk_init_data init = {0};
+
+	init.name = "ds1307_clk_sqw";
+	init.ops = &ds1307_clk_sqw_ops;
+
+	ds1307->clks[0].init = &init;
+
+	/* Register the clock with CCF */
+	clk = devm_clk_register(ds1307->dev, &ds1307->clks[0]);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	if (node)
+		of_clk_add_provider(node, of_clk_src_simple_get, clk);
+
+	return 0;
+}
+
 static void ds1307_clks_register(struct ds1307 *ds1307)
 {
 	int ret;
 
-	if (ds1307->type != ds_3231)
+	switch (ds1307->type) {
+	case ds_3231:
+		ret = ds3231_clks_register(ds1307);
+		break;
+
+	case ds_1307:
+		ret = rtc_ds1307_clks_register(ds1307);
+		break;
+
+	default:
 		return;
+	}
 
-	ret = ds3231_clks_register(ds1307);
 	if (ret) {
 		dev_warn(ds1307->dev, "unable to register clock device %d\n",
 			 ret);
 	}
+
 }
 
 #else
-- 
2.34.1


