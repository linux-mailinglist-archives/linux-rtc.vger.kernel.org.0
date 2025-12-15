Return-Path: <linux-rtc+bounces-5571-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF74CBE58F
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Dec 2025 15:42:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 09E093004A5F
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Dec 2025 14:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD62033E360;
	Mon, 15 Dec 2025 14:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JsYgT0yN"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F25F2D2498
	for <linux-rtc@vger.kernel.org>; Mon, 15 Dec 2025 14:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765808272; cv=none; b=FkTZ79PUILGD16dN8ZKde/dayuDBoqa/jWbTaRk09LUjUde3oVL+WShL46ukVYiPD9rbpeyKa143uXIB8mEGKN26FgZ4jKvCSRs11Js/bTrbebFhQ6KzBUmpP/WQhAajPx/CcZTlBZqHsgEghAkMgzOa/4bvENze7xegaDFqPOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765808272; c=relaxed/simple;
	bh=ikmzIlbOd+LEhbyDv3j+DT9OAKYhGjQzZlQGjQMpYL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ab7qLc+VOdsHg/deGRaJMJjqn2Gy3bMowRQ9g91o0IYmHs4eKMbmlfZ/pveQYTvZ5EruNJgOOyfrC+ZmAqKV36DEBZG+5GyiugEfOV9zPWygNPR5Fk54xw8VFGYwwycr5muKLy3WY742JjfwAxXXjC7RZIl0HIea9JOzc+6XbEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=JsYgT0yN; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b7277324054so593853566b.0
        for <linux-rtc@vger.kernel.org>; Mon, 15 Dec 2025 06:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765808265; x=1766413065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DstP1u05CPAHjOAUetfVzJW1wXxCkT+pjUtyyoYANxU=;
        b=JsYgT0yN+8lnYfvrLJVeu1PMbXUH584OwU1eAjaZi9SajgpFrWn1Xz0feUYqosaA3N
         fLelMUb+/UxbtiOhd9ZRtfFTdfEHucQT6v8jigmsq5Ksj0FsuXpYKiuugsVlZu9XWWGA
         T9oPK6WEfeQjaz9JfSDDduSW19EXjwlUnTstHjUQckLfGHwf1ktpJmcfwMM1ioVSNR4D
         aNaNzza+FQi7GPJS2jhlxCHAF+RK/8JSp5FyaWseXy3PAyDhkuHF/3HRyudjxxyQi3Ti
         BvbmvvTiT/X26NP1je7Qea7bcSsIKt0vV6qgzAuydRhJDgpWPZ4Oe4yRa2ArL4wucqfk
         XcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765808265; x=1766413065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DstP1u05CPAHjOAUetfVzJW1wXxCkT+pjUtyyoYANxU=;
        b=uair2g7DF8lSC5eKoHQntH77UVqcnlQ4b2oYE2XG6tYNjRu6udVdzxmgLIbcotRXZT
         N/Qw7SGZcJoLstTnnzhIgr7S1YGe5C/G7DaaNW2BugYHe1c8i1cksghf+tmIZqencvWZ
         2uv233Be7Tk2sTN7ZZxK+2w5Gq3CcTFCbb3Bh9CxvJBSyX9Uxkam1qm2gLa6HDAhJmgN
         Hec7n59HmatKYW7NsAt5vR7naaAzoEqeqIIf7oThSqjPkhUfa17PEAd7bDoddb6hGQXK
         Te4koEaZBGmB0sgPCVmW2BSJwnT137PUIMIoPRhRsW5Z3bGvkr6FG3K9rMs6Bm6hQwxi
         04uw==
X-Forwarded-Encrypted: i=1; AJvYcCXAVBEjK3iPcSpHkBNNfCFGgIowep+Rl96wywekf0ivfJ5vabC+WmanjcPAiDit1IePAzcnBCIV448=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3GadRW+f/LH+gwhipl3az5l9/J1IOA48qLlF9eBVokuai9+su
	gVCnKLl+hJqApiGFpUYeF5f2WI0AHJokoYQtLpY9uEKBMelSrhFxlgRNFfS3nyR/UlM=
X-Gm-Gg: AY/fxX6U/YgxJHhCe0L7LYq8xw1rRxbbEUzJ0/DxlgagJuaeKn+GwKAVYv/OMinsPKk
	5VVk9YZBCGQ9f32Mgxn8OGNp7moYC+Omc9+rJ/YoKTXcv/lEDQMN/Haey6YHvY5GkUTbcFWJ2zs
	sGA6LbctVfXDTCUJi5uKfgl6bkZKXzBeEYFq3Sx3G9JhXbQniGmH3oTJlRiKis+lXNHnotbANFk
	Fx5analKk+2u5r0TyPRJEZojhdDKCI7VDDJ6D1UBwG91+hYs54Hg2d8GNaxH+GCoAjG2P2U63Ay
	W4oH5bw+S7FpboUL1nFzrmij2wklr6Cj+jrvjurTG7dOO6Mjaa+66QRdPTHkSsf1uxbDxaVl+CY
	MJdLURQjzOAcI44C1hNREC/f/0YTXzlD6C6nhMKKYSWEIVL1jU+PEHBV99bkVangZCybGEjFWV0
	ccHQIQFT+a6o3Ac7bsXQ5IVnCM/jAv+JSjGZA8Doo6uR3YKw7eIvqspszYEA==
X-Google-Smtp-Source: AGHT+IG0aR1aVYo2hR9RY9GcMGEh3RQBWvatdAkF4IYLW7cEYQ+IwII2kbMYm7+RM3tx3GVb8FNltA==
X-Received: by 2002:a17:907:3c89:b0:b73:572d:3b07 with SMTP id a640c23a62f3a-b7d236b62a1mr1080879566b.28.1765808265489;
        Mon, 15 Dec 2025 06:17:45 -0800 (PST)
Received: from localhost (ip-046-005-122-062.um12.pools.vodafone-ip.de. [46.5.122.62])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b7cfa29f6cbsm1438920266b.5.2025.12.15.06.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 06:17:45 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	=?utf-8?b?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v2 07/17] rtc: optee: Make use of tee bus methods
Date: Mon, 15 Dec 2025 15:16:37 +0100
Message-ID:  <c4f7d5f1aac1af2b11a520b409b0c22366be84d3.1765791463.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2133; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ikmzIlbOd+LEhbyDv3j+DT9OAKYhGjQzZlQGjQMpYL8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpQBheMbvEqJBwhAhTqzRRzs/PHvyCJQxdPljAW tHVglfhLtOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaUAYXgAKCRCPgPtYfRL+ TutZB/wIvA2FIQU9tGTYvprs23GCWKp5tv902PnEn1WRPNA2wqjSj8Et20EmH8sojRdzzDJRsSa QNyyrBuRRrXRk+hnLGBnG5qTINCrKGW6TpoBHjLH5oDpUe9MoqbkKi4dLGxYIMTV7DNp7ANGg50 qdv6a7E3IcMB2qYuhJzPC4b1uQ/PiQcd0xej78j8Y1CY+fCPH1i0kLC3Hk5nHsHd/zftj/dBn56 DEd0WTmplWXVg9eMG/rwS8Q9+9ROV3yQ4+Jxcm4TfSpezTMHurNx0RFJxPWzBxWtblzX3tXFZsT 14C1B+SHAWvizy9CoqaogXbeS/QgQaxL+lyhvYrb9UaRJMjL
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The tee bus got dedicated callbacks for probe and remove. Make use of
these. This fixes a runtime warning about the driver needing to be
converted to the bus methods.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/rtc/rtc-optee.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-optee.c b/drivers/rtc/rtc-optee.c
index f924a729ead0..eefde789d194 100644
--- a/drivers/rtc/rtc-optee.c
+++ b/drivers/rtc/rtc-optee.c
@@ -547,9 +547,9 @@ static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
 		return 0;
 }
 
-static int optee_rtc_probe(struct device *dev)
+static int optee_rtc_probe(struct tee_client_device *rtc_device)
 {
-	struct tee_client_device *rtc_device = to_tee_client_device(dev);
+	struct device *dev = &rtc_device->dev;
 	struct tee_ioctl_open_session_arg sess2_arg = {0};
 	struct tee_ioctl_open_session_arg sess_arg = {0};
 	struct optee_rtc *priv;
@@ -682,8 +682,9 @@ static int optee_rtc_probe(struct device *dev)
 	return err;
 }
 
-static int optee_rtc_remove(struct device *dev)
+static void optee_rtc_remove(struct tee_client_device *rtc_device)
 {
+	struct device *dev = &rtc_device->dev;
 	struct optee_rtc *priv = dev_get_drvdata(dev);
 
 	if (priv->features & TA_RTC_FEATURE_ALARM) {
@@ -696,8 +697,6 @@ static int optee_rtc_remove(struct device *dev)
 	tee_shm_free(priv->shm);
 	tee_client_close_session(priv->ctx, priv->session_id);
 	tee_client_close_context(priv->ctx);
-
-	return 0;
 }
 
 static int optee_rtc_suspend(struct device *dev)
@@ -724,10 +723,10 @@ MODULE_DEVICE_TABLE(tee, optee_rtc_id_table);
 
 static struct tee_client_driver optee_rtc_driver = {
 	.id_table	= optee_rtc_id_table,
+	.probe		= optee_rtc_probe,
+	.remove		= optee_rtc_remove,
 	.driver		= {
 		.name		= "optee_rtc",
-		.probe		= optee_rtc_probe,
-		.remove		= optee_rtc_remove,
 		.pm		= pm_sleep_ptr(&optee_rtc_pm_ops),
 	},
 };
-- 
2.47.3


