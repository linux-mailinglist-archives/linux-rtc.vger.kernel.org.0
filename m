Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03ACD269092
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Sep 2020 17:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbgINPrP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 14 Sep 2020 11:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726538AbgINPqf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 14 Sep 2020 11:46:35 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A16EC061225
        for <linux-rtc@vger.kernel.org>; Mon, 14 Sep 2020 08:46:15 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id y15so565143wmi.0
        for <linux-rtc@vger.kernel.org>; Mon, 14 Sep 2020 08:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZEV41DUq4hDo9kX8U4tlHDYu2D0bOWfkfHs9aykeSRY=;
        b=Az3F1nlAe83fNePJ2s+NbIHrFXMuKbqDZ3xUKNKgg/U+sx6cssF12dPi+scUgEojyH
         /436BeRU2pd4LIP4bQItOUWN1LH09OGMaWmlkNtBcp7WxXGnoqviDrYWMQ7oNIRN9eZM
         suIYND/LIYAQMfaZCLtFbQFq4mWAD3nejN7No/yMkyMz8ov/i4I/e9YSWKFhMgekz+rb
         J1B9MzfEFMPJsodPV5gJ5eP8dKGoE3/bLpC0V6ev26q7pK9qSHvcX5EBeyRIRfpWNgZE
         itVpUomd3P+/xiKS4pxZQaKBIt6LR3Iyla9TCGngYkUD6Sx4rAxVqOUPgaM58AIj16V4
         qwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZEV41DUq4hDo9kX8U4tlHDYu2D0bOWfkfHs9aykeSRY=;
        b=CgnUmmCuizG1EPcnVTb4iumJLvG9uBg+0mnS4XGkAgMIpAPBhoHagQ98jWyRWQuMo5
         HPYrPtimghIbQjqV4aeRyPuqxd7f4pdRvyR1aqZmROcyF+ozjRlXuLRy36g9qhlAAzEk
         BK1oFzPXt2ztG0H9Q7wPrtFCMXEONj0asTsEd//ruGbrgm67TP9eMBmesRUL23ZRxsJ0
         8wLq+zJWRblvN1sm2Svs3OaDnidSidlSG/8MfDjnaJ4V5aXImaLnA3rG1Vyvupb9HTNT
         TLKI6Wts+PpkARwj+JEkZ1NCfeBUo3z5jBZdcZMa7kWCwz85NhH5V5kX+UynEV8YXloJ
         5FZw==
X-Gm-Message-State: AOAM533cIjGaZrKRgyZ0SN2pUxrWu3e/6sGmdGlLay5VW5xqvfYYBY7v
        TxCHZ1LCxRRqbUU5xOJeT2RS8w==
X-Google-Smtp-Source: ABdhPJwFuDev5spRwtlUmLIoM8tFRiwMtQscTE6sB+Fnu9QqYcucjXQOatNfrRrq/Tqg0Bw/PBxKTQ==
X-Received: by 2002:a1c:2dcc:: with SMTP id t195mr20845wmt.166.1600098374174;
        Mon, 14 Sep 2020 08:46:14 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id l19sm19510448wmi.8.2020.09.14.08.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 08:46:13 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 10/14] rtc: rx8010: prefer sizeof(*val) over sizeof(struct type_of_val)
Date:   Mon, 14 Sep 2020 17:45:57 +0200
Message-Id: <20200914154601.32245-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200914154601.32245-1-brgl@bgdev.pl>
References: <20200914154601.32245-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Using the size of the variable is preferred over using the size of its
type when allocating memory. Convert the call to devm_kzalloc() in
probe().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-rx8010.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index dba7c3f87d9e..aa357f800ad4 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -429,7 +429,7 @@ static int rx8010_probe(struct i2c_client *client,
 		return -EIO;
 	}
 
-	rx8010 = devm_kzalloc(dev, sizeof(struct rx8010_data), GFP_KERNEL);
+	rx8010 = devm_kzalloc(dev, sizeof(*rx8010), GFP_KERNEL);
 	if (!rx8010)
 		return -ENOMEM;
 
-- 
2.26.1

