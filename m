Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06972264691
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Sep 2020 15:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730500AbgIJNHt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 10 Sep 2020 09:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730165AbgIJNFt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 10 Sep 2020 09:05:49 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9340AC06179F
        for <linux-rtc@vger.kernel.org>; Thu, 10 Sep 2020 06:05:05 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id y15so5740713wmi.0
        for <linux-rtc@vger.kernel.org>; Thu, 10 Sep 2020 06:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=04PutPpSnQgJelQ+Ix7sCACVphrDCgo/mARCI+1M3iQ=;
        b=I5ElECNegzKV59s6JDgamlwfsKqKmsqgAZWZhuJtIF/NepdJ4yQ1J0gVJPS/gmCH2q
         pxNXUc00OBUgR9YQpa8abe/n9kcVZfDBoAtgfQ9tjH2lUERnab+Tg8553FcL5eV7i+hP
         2WoOyCWUCCctzA+uOQ6up/fQ+LG6zx7c3KMvc5l7NhovRnFapZuiWEi0uxzmaFVLoht3
         B4Fivt+et52dEemD+x8t+kw7G9/ga6YdQwmHgwSQzNUFpN13UTMRBZb6rxNXf8kJvYIU
         7Kg4SRs8FC2wDSiLJxRDt6uFoiNQfWxED4oxlfjHe0A6GvGLpnfGFprIp/jbxmz9Yd+j
         o3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=04PutPpSnQgJelQ+Ix7sCACVphrDCgo/mARCI+1M3iQ=;
        b=WMQO32uMck3FdvTvxDIomf09HqtBX65eT/qpt31VnqJSHlMTdK0HDpABIxyu/AlLSV
         MVO96lLOqeI9EbI4wc+3/ltQfSEGfgxBm9IbUzmzXmpZsmw3uuiLjLJ8u1gXOvgjSY6/
         lXUPSiZiOA3vzdV3CO/xb3FxVJuDjA0UYOBf5yNzQVzl282Nxp/ZxgFmZwPtTFqXYg+u
         ltRK4h6L8W9tN4X2NvzDE/0NSLt4HLOmRuLMEh5jx2YO8JSgoNOBiNjMRM65PIf7gzI1
         uxxBY+Nh+sDIA9ynbtgWiuFn+djPzEtJWeKaRU0wPZyYPKlpKI2kULzzh/8XsZqHlTGI
         5OXQ==
X-Gm-Message-State: AOAM533jZxTRLFGOxVyBkQj03vX7zO35KeSNgIMgVobHElXFFdFst+4Y
        jqutEBL4J1WVph6IkJi2agDK6ACeRwwY+A==
X-Google-Smtp-Source: ABdhPJyDCGWUuOs1NMZFyeRKTEUtz+d0fMCNarMxxpLq2mXotOnXRILoD+iX9hJti9NpSehQlrjQHw==
X-Received: by 2002:a1c:9c4b:: with SMTP id f72mr8403290wme.188.1599743104359;
        Thu, 10 Sep 2020 06:05:04 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id p16sm9321988wro.71.2020.09.10.06.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 06:05:03 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 06/11] rtc: rx8010: drop unnecessary initialization
Date:   Thu, 10 Sep 2020 15:04:41 +0200
Message-Id: <20200910130446.5689-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200910130446.5689-1-brgl@bgdev.pl>
References: <20200910130446.5689-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The 'err' local variable in rx8010_init_client() doesn't need to be
initialized.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-rx8010.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index b065973b8a14..3b8a95330a0a 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -194,7 +194,7 @@ static int rx8010_init_client(struct i2c_client *client)
 {
 	struct rx8010_data *rx8010 = i2c_get_clientdata(client);
 	u8 ctrl[2];
-	int need_clear = 0, err = 0;
+	int need_clear = 0, err;
 
 	/* Initialize reserved registers as specified in datasheet */
 	err = i2c_smbus_write_byte_data(client, RX8010_RESV17, 0xD8);
-- 
2.26.1

