Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1B9A704BC
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jul 2019 17:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729718AbfGVP6a (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 Jul 2019 11:58:30 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43057 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729238AbfGVP6a (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 Jul 2019 11:58:30 -0400
Received: by mail-wr1-f65.google.com with SMTP id p13so39946675wru.10
        for <linux-rtc@vger.kernel.org>; Mon, 22 Jul 2019 08:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3NjKQ6bH7M7yJLbzjNkN2jx2rsf9cC0ZyK9exN5M9fc=;
        b=GeBZSCaVIZd+cqC43S1krfN7aYNL1HxRaLY57XNQo9LbC/RI4XJxVBIwmWd+/eL6qR
         msztgCuOI8rLTZkd1BBj9/tmxuqN+JAx0G/Px7f/oMRoZbhCQkdXcYVGgGMycEhmGvDX
         y5ybYulbP7QWOgIF0oS8WniOk9peIr1CRQJ3BDktHDLZZJcOXa4S7RNj3XnspzzV/4/L
         NHWf1G2/g+ZYg/64muhZANutIuJbyhw4CY+TpG96FE1P2z+QfDbJ6UIcqT2jbolcU/tK
         XimyJ89mFhSVcQ52VCX72ga9wdezlO0AqR1pDui51Y6R4W/9HtNB/srZP0k1KbIW4ZiL
         PDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3NjKQ6bH7M7yJLbzjNkN2jx2rsf9cC0ZyK9exN5M9fc=;
        b=oDkpsUZYuI2PjvRJmiqpcQ4DcHvwyFTbyzlnR/QjXxd1n0J8QrSXnIjEfcOldZIZrH
         obPmwyr2CiXEiu8v7VuMkk1E+7cnmV1e7nllA4/eCuTsaq6HRVxWYowx9IRPL1+cIC3E
         pHjnLq6+kQS9QUS6/C+f3bEaU67C5j4xdDGVdEkFLkmL3QKmczQ+chMfmGrhM3Q7bJHo
         ERGMv6MZq6PEkVUD3Ywz2TsEDpZ3Y0vEkINaQmVi0q7q6iV1+kYVIYEY1ZLBe2X+LPqe
         mkpFudq0Lx5OdrdzBA4dBXtWzFiJqeee3uW216Tuh+oX23y97mc7POFg45K4iflq9VDM
         vlpA==
X-Gm-Message-State: APjAAAWj6jLQFDoewQqlDvBrfKDH5KruT3lyviuu5DfhouWds7yBOUWs
        m3Om6pUdn/Y7DXTuSb/FTeZTgeR+80g=
X-Google-Smtp-Source: APXvYqxYa4jh+qGFM0bx2eP3vfJAWwwrr6UIR3VrW0sxiu6ZXWVobDCmXavXA77ziIQ8tvZ9bjUv5Q==
X-Received: by 2002:adf:db50:: with SMTP id f16mr63500060wrj.214.1563811108193;
        Mon, 22 Jul 2019 08:58:28 -0700 (PDT)
Received: from localhost.localdomain (3e6b1cc1.rev.stofanet.dk. [62.107.28.193])
        by smtp.googlemail.com with ESMTPSA id 91sm84840716wrp.3.2019.07.22.08.58.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 08:58:27 -0700 (PDT)
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
To:     linux-rtc@vger.kernel.org
Cc:     alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        bruno.thomsen@gmail.com, bth@kamstrup.com,
        u.kleine-koenig@pengutronix.de
Subject: [PATCH 1/4] rtc: pcf2127: convert to devm_rtc_allocate_device
Date:   Mon, 22 Jul 2019 17:58:08 +0200
Message-Id: <20190722155811.11980-2-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190722155811.11980-1-bruno.thomsen@gmail.com>
References: <20190722155811.11980-1-bruno.thomsen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This allows further improvement of the driver.

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
 drivers/rtc/rtc-pcf2127.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 8632f58fed43..58eb96506e4b 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -237,11 +237,12 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 
 	dev_set_drvdata(dev, pcf2127);
 
-	pcf2127->rtc = devm_rtc_device_register(dev, name, &pcf2127_rtc_ops,
-						THIS_MODULE);
+	pcf2127->rtc = devm_rtc_allocate_device(dev);
 	if (IS_ERR(pcf2127->rtc))
 		return PTR_ERR(pcf2127->rtc);
 
+	pcf2127->rtc->ops = &pcf2127_rtc_ops;
+
 	if (has_nvmem) {
 		struct nvmem_config nvmem_cfg = {
 			.priv = pcf2127,
@@ -253,7 +254,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		ret = rtc_nvmem_register(pcf2127->rtc, &nvmem_cfg);
 	}
 
-	return ret;
+	return rtc_register_device(pcf2127->rtc);
 }
 
 #ifdef CONFIG_OF
-- 
2.21.0

