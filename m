Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD5452A3D0
	for <lists+linux-rtc@lfdr.de>; Sat, 25 May 2019 11:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbfEYJx2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 25 May 2019 05:53:28 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:42290 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfEYJx1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 25 May 2019 05:53:27 -0400
Received: by mail-pl1-f196.google.com with SMTP id go2so5132366plb.9;
        Sat, 25 May 2019 02:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=NA52AjQwrBf0703k7sbVMul5zk1FYHOy+jnznCOJXL8=;
        b=AmRx3EJ1CyfEtKdIjY8ZDrQr0m1jRswY8/XwNvf56UU23rhvG/fGD8j/plzLZOLu0L
         sFBKDa7MpD+7lyh9brg7UskpvwPRuJ2vj4vv4qVpZQ3Ua8H1vY809JWKmIvt5hZIaWOK
         Wk8mPjffsaXVEuFUSltm5qfk4CsJH5hQMWNwOl/gVBZEHYQ2PkoZjKo47TMMUPkJPFkf
         jSaeLSUArtl9Y2ARNke/+IPxRsRqJHM15CVljWz14YjOmVbb9Hu3B4ZfCvWhuElPVId1
         nfbGud+Tyzc4ldVH0FbVpY3xJbKlIkyRfpjDJRmzUS2IxiRyHvsAIyItqDCKG+L68RAN
         YnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=NA52AjQwrBf0703k7sbVMul5zk1FYHOy+jnznCOJXL8=;
        b=t6dgL/v5eV2u20QxqYtmlv2ycEu1EdEu9rOI8yYi9yxr3YLKLwglM9taVkWKuzVm4v
         6rPF7xfXOfU32tv6MsTeLvSVr/UVI+jSkTddcMQB8Pugf1RtxcBzKSIa8ZDXINFhSRPp
         tSKuR/f3xRWfxmv1yPeieqktpbEQurUEBguMkLfxBw7O9/Zpy5MuDyxBFfnqZ77wJAec
         c67jErMGfVSwkX5U7F5wyOoMwQK+pNvne9s7vWYp4JPc9cECvuk7AhLmmxqoYFNgqahO
         SWPISunANjTVYMpeQDh4wTjvTcWXdBaYqHxuvOZSPb3uwaE9f/oSWA9lWy1rTyj8vkW+
         YSAg==
X-Gm-Message-State: APjAAAWJ715ComfFJb/HvXvcqz1pe0XgnJcKfZqQExfBgO2yzFU6LNBT
        017Y8yib09+a560Xh/+DfmVlMEMC
X-Google-Smtp-Source: APXvYqwIvD+bfiSUVCZQU6ljPE4I8ba7fUTSSmIUMD0BvutFqmxGld/bveyPjjITsx/WFrNyz0IzVg==
X-Received: by 2002:a17:902:20e2:: with SMTP id v31mr112094575plg.138.1558778007294;
        Sat, 25 May 2019 02:53:27 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.92.73])
        by smtp.gmail.com with ESMTPSA id t10sm5695367pfe.2.2019.05.25.02.53.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 May 2019 02:53:26 -0700 (PDT)
Date:   Sat, 25 May 2019 15:23:22 +0530
From:   Hariprasad Kelam <hariprasad.kelam@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: ds1347: fix warning PTR_ERR_OR_ZERO can be used
Message-ID: <20190525095322.GA26245@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

fix below warning reported by coccicheck

./drivers/rtc/rtc-ds1347.c:158:1-3: WARNING: PTR_ERR_OR_ZERO can be used

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 drivers/rtc/rtc-ds1347.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-ds1347.c b/drivers/rtc/rtc-ds1347.c
index 938512c..b97b67f 100644
--- a/drivers/rtc/rtc-ds1347.c
+++ b/drivers/rtc/rtc-ds1347.c
@@ -155,10 +155,7 @@ static int ds1347_probe(struct spi_device *spi)
 	rtc = devm_rtc_device_register(&spi->dev, "ds1347",
 				&ds1347_rtc_ops, THIS_MODULE);
 
-	if (IS_ERR(rtc))
-		return PTR_ERR(rtc);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(rtc);
 }
 
 static struct spi_driver ds1347_driver = {
-- 
2.7.4

