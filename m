Return-Path: <linux-rtc+bounces-93-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB957C87EA
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Oct 2023 16:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E80E0282D5E
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Oct 2023 14:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A268837;
	Fri, 13 Oct 2023 14:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9SQBbhJ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D9F1B266
	for <linux-rtc@vger.kernel.org>; Fri, 13 Oct 2023 14:34:26 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E203295;
	Fri, 13 Oct 2023 07:34:24 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-32d569e73acso2010944f8f.1;
        Fri, 13 Oct 2023 07:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697207663; x=1697812463; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9fTZrrokaIOz1ZV+SInDo976tod0Liz3CoLDMTgWcH0=;
        b=C9SQBbhJKJecwn50em8+HJuMwgnCVrLPWpX9HTyk36ILtF6nTw7q9H4Yt1IRxJcduo
         qOabtbr7Lz3SPTCXnaTjg9nCHu8zZnZDPhgXQNN0vY00FMnY13kLpjgeaweEluBFA0uh
         DvA2wiP5AbgvJ1xvCUcECu87PC1Fcgu4+OVIkh7Rn9XU4OY5d63b6qccT/x0nsmxqtZE
         v9uu7sFE9fRQINApGM/iYEO0KYblnqXBXpG6+s3eJULNm5aTbNdWeVEj3G8ipId+3Iqg
         wm52X+FdE182yA8ODWx1e6IaDZzxqhISI1LrVhawrPWLc+jBO62eRJjrxo3alSynvHIl
         2DEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697207663; x=1697812463;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fTZrrokaIOz1ZV+SInDo976tod0Liz3CoLDMTgWcH0=;
        b=mFlLND7l9v8EatEesOjIrq2Go5hn9zzDQjAeIe656peBbvrDU8EDkYBmLqMoasNci5
         s8gcwaGZtID8CUZO2a12HMEXs5G1RbvcIP+MRUfAR4d6S1Hd4dG8XJMYj+E6AW8Gi4+F
         uSA3WNAQ1HqgAMDdJGO+YGx+UkNR4VWQ3AjoMtCgg90iJgYP0091+uGSMcETSs0Menf5
         yIDJvWbXIKogohv60CqR1JUXOIU/IJKUANoEwZc/ulRQ+zGIO28Xzv9d+elKmOBYFUwc
         5Yk4mQp5KfMNeHbs+akDZf5L7XBOlbucIOzp91G4eLmWn8YSIxZ7Q69u1aGREHWQg4VF
         pmCQ==
X-Gm-Message-State: AOJu0YyVa9AdOTk40KGTqLWLkYuIvIWKKwIWqz+HCBuboXRKHja5HOy/
	1iKsNSFUPjDiSs+0WkdTi48=
X-Google-Smtp-Source: AGHT+IGhUx1gxNh0EBMNVDn2ORKY6FbHk9azpCU8Sw4RKk5gT3991VT9SA0MucWaQzn4DZ2hoEYSUg==
X-Received: by 2002:a05:6000:c4f:b0:32d:9579:94e0 with SMTP id do15-20020a0560000c4f00b0032d957994e0mr3173368wrb.27.1697207663133;
        Fri, 13 Oct 2023 07:34:23 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-9a91-fa21-8c45-3dc4.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:9a91:fa21:8c45:3dc4])
        by smtp.gmail.com with ESMTPSA id e3-20020a056000194300b0031f82743e25sm20855889wry.67.2023.10.13.07.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 07:34:22 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 13 Oct 2023 16:34:21 +0200
Subject: [PATCH] rtc: pcf85363: fix wrong mask/val parameters in
 regmap_update_bits call
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231013-topic-pcf85363_regmap_update_bits-v1-1-c454f016f71f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGxVKWUC/x2NQQrDIBAAvxI8V4iR1tCvlCKrWZM9xMiuKYWQv
 9f0OAzMHEqQCUU9u0Mxfkhoyw3MrVNxgTyjpqmxGvrBmt5YXbdCUZeYxrt9WM84r1D8Xiao6AN
 V0c4FOzqXwCRQrRNAUAeGHJertIJU5EsUxkTf//z1Ps8fuYpcOIwAAAA=
To: Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1697207662; l=1329;
 i=javier.carrasco.cruz@gmail.com; s=20230509; h=from:subject:message-id;
 bh=oJ0Z7JgDTNSci5EgbxEjZIMHUQ9Fje0lkGp/yeK4WcU=;
 b=rjRqxt4/yW3/wMNlOb2OmYw8NQCIku8SYF9dKwrvJ1xkhNuIdWF2bh7e9BnJYuGRehdJFmKjI
 JVgPuiKsAucDbNGZHLWV4SaYhYLXgYHcgWzYo6VufICtjYAyv1ZegN5
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

The current implementation passes PIN_IO_INTA_OUT (2) as a mask and
PIN_IO_INTAPM (GENMASK(1, 0)) as a value.
Swap the variables to assign mask and value the right way.

This error was first introduced with the alarm support. For better or
worse it worked as expected because 0x02 was applied as a mask to 0x03,
resulting 0x02 anyway. This will of course not work for any other value.

Fixes: e5aac267a10a ("rtc: pcf85363: add alarm support")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/rtc/rtc-pcf85363.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf85363.c b/drivers/rtc/rtc-pcf85363.c
index 06194674d71c..540042b9eec8 100644
--- a/drivers/rtc/rtc-pcf85363.c
+++ b/drivers/rtc/rtc-pcf85363.c
@@ -438,7 +438,7 @@ static int pcf85363_probe(struct i2c_client *client)
 	if (client->irq > 0 || wakeup_source) {
 		regmap_write(pcf85363->regmap, CTRL_FLAGS, 0);
 		regmap_update_bits(pcf85363->regmap, CTRL_PIN_IO,
-				   PIN_IO_INTA_OUT, PIN_IO_INTAPM);
+				   PIN_IO_INTAPM, PIN_IO_INTA_OUT);
 	}
 
 	if (client->irq > 0) {

---
base-commit: 10a6e5feccb877c3c75ad11d27942ad52c24815f
change-id: 20231013-topic-pcf85363_regmap_update_bits-77b3877fa1fa

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


