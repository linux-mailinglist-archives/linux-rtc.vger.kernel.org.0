Return-Path: <linux-rtc+bounces-3378-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8108A4D5FC
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 09:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 511FE3A693B
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Mar 2025 08:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5231FA854;
	Tue,  4 Mar 2025 08:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JW2CxyS8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3643B1F5433;
	Tue,  4 Mar 2025 08:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741076098; cv=none; b=EZmLMY9E2p4fDuRqCEAoXmxSvZ5gTWCcCU6uBgo7sBMiVxYTycQyLZ3ZNpW/y5Vlwgak8SNdL6gk77VB2zkk3LNL/Pz5HeaRSmSTZ20TgPNBFbaBxD0o8YtPYYKykhaJQj3yB6dMa3OkL2UI1kAqt9Hjq9JAv7Otc5szGyh7ogI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741076098; c=relaxed/simple;
	bh=13Lh5Ymwx9tHqgXZBtfwa87vli/CTbCqbiK3qs8j320=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cBEtXrDqik3Vzd83clfTAmou5L3TvGDRs87twM42HCrAqv70EGebvPjEbcF5aDqv2viufgagiBk2o9Woi3QR/boMn1D/DIPtV4ehJdQF/9qxRcRSMnutjEp4xIYj9LlF1g3jElupPtwNdgcYONchQ+hrVxO26xlC3KCGazi4Wok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JW2CxyS8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93BABC4CEE5;
	Tue,  4 Mar 2025 08:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741076096;
	bh=13Lh5Ymwx9tHqgXZBtfwa87vli/CTbCqbiK3qs8j320=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=JW2CxyS8cfJABeZ0i9QKzaHk+h5ljQrdM2mIZzyId61qfVj9AnpgIGEsmpabBkP7C
	 t9boc4Vr8oU1tXPslGleggW/6Uy+23XBUPtJrRdRbl2oyHHh0GVwIECaqlPdcfeNTb
	 jjpTn05qrs3ye9SF55L7t43cJNK3ftdCsjouj/F1wBlBSA47tVV80ZKp+E4MboUa4E
	 WAEeIl8wPdztnWe0jOEgr2tkCahfz8e03nEIF8VTfKEeizCjcj4DyfKriTKTrSE7nQ
	 HVS/l8O9FcOQsVc9rk4A5xyK0MvXUGzLkb01HBbbNBZUpThyXXvsZLUtfmKim723Mi
	 s0FvXa5BlAPLg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88974C282D0;
	Tue,  4 Mar 2025 08:14:56 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Tue, 04 Mar 2025 09:14:52 +0100
Subject: [PATCH] rtc: pcf85063: replace dev_err+return with return
 dev_err_probe
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-rtc_dev_err_probe-v1-1-9dcc042ad17e@gocontroll.com>
X-B4-Tracking: v=1; b=H4sIAHu2xmcC/x3MSwqAIBRG4a3EHSeYPYi2EiGlv3UnFdeQINp70
 vAbnPNQhDAiDcVDgsSRjz2jKgty27yvUOyzyWjT6lo3Si5nPZKFiD3lWKBm1KbrA1y7eMrdKQh
 8/89xet8PyJCEwmMAAAA=
X-Change-ID: 20250304-rtc_dev_err_probe-ae3268fec5bd
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741076095; l=1241;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=VnpZm7Q0qNGaZ2rAzKlEVmeZ1zL2qmrrgkz2dPyjYtA=;
 b=kEkN5DubV0hXbc/Rb/Q37RueM0FYdCJQ8T58k6QCvyl91+Y26ofOmzP6jihfUGdZPCynKoLGE
 U7IfwmPpvCLC7XNXX2rMnDJMSVB6cUebOplJ9J1WigVeQc2OqSF+6jq
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

From: Maud Spierings <maudspierings@gocontroll.com>

Replace the dev_err plus return combo with return dev_err_probe() this
actually communicates the error type when it occurs and helps debugging
hardware issues.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
I had some issues with a pcf85063a this change helped debugging it,
hopefully it can help someone else in the future as well.
---
 drivers/rtc/rtc-pcf85063.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 905986c616559b87826d1102dbc25614f7dcbcbb..650e45876be5e88d96b0ffabaab204168c8d355c 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -591,8 +591,7 @@ static int pcf85063_probe(struct i2c_client *client)
 
 	err = regmap_read(pcf85063->regmap, PCF85063_REG_CTRL1, &tmp);
 	if (err) {
-		dev_err(&client->dev, "RTC chip is not present\n");
-		return err;
+		return dev_err_probe(&client->dev, err, "RTC chip is not present\n");
 	}
 
 	pcf85063->rtc = devm_rtc_allocate_device(&client->dev);

---
base-commit: cd3215bbcb9d4321def93fea6cfad4d5b42b9d1d
change-id: 20250304-rtc_dev_err_probe-ae3268fec5bd

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>



