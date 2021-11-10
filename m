Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E820044C216
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Nov 2021 14:29:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbhKJNcp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Nov 2021 08:32:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231210AbhKJNco (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 10 Nov 2021 08:32:44 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 492E0C061764
        for <linux-rtc@vger.kernel.org>; Wed, 10 Nov 2021 05:29:57 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id r26so5223827oiw.5
        for <linux-rtc@vger.kernel.org>; Wed, 10 Nov 2021 05:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xOQJYBsGgYy5CkdKgtncGqPKYnfRxE1hj0M+QRFTNGU=;
        b=q4vVPaB4d5ukCNioGKj4k7ftB+oathxTlDJSegmg3MwgqEf02smHg8TsL7W+zbZtRC
         /MbCou/xPY7Gqle7CFYyRrd/kYzPwA9ojQ6qfAkVuLGwvibUV9+vHCTefmM7mdblFJMb
         cZ8Jkymb5XUOn8AorpqAcd/vO3JxSl1XLBF/jGzGd0UBCnxN+ebP5L/6EA0jM/TFdVaS
         4SAUYG2JoOHdqFJgcvwLK5o0XtsFdvTTL5XMo4JpSmQIJ1NoeQUkZqD3anXH/zDQSb8t
         Vj9d8E5Dspno5MVs40VYOaIgvkRFuVj2mRT2Mphx2Do+ZNMH/KOsD4NwbMAkCGpskD9u
         1NDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xOQJYBsGgYy5CkdKgtncGqPKYnfRxE1hj0M+QRFTNGU=;
        b=OYp64/2WPeQIqVnJN50uvrasEuNE9jTEfCkvFDVaYFt8CQozZ8TnxRRsa+U02hyTI3
         ugnxK0qQrAvKVL+VmiXYhAO/JlT9c9psClkXvzpouDFLBU9Wd2PXEXDSgcFuJYwg/U/Q
         3lMjdxnuNJjRfUQiOVj2hNLbteumGL7CG4AK0ELHsMkQnwANCTKnY8RrKcq5iB0Ry89T
         JhVgukekvCkLQuc0Y9ZBdgL7KWfxTULtI6JQZlNnOhEVjQ3uS0dQPvl7D5IztAJh6d3/
         u1qQUNem2RjGCnJ0HgDYR/JeS08VBKFLy6i0CsPRpTTKczvphkGa9AwBMlpMcr9ohdXw
         9aHw==
X-Gm-Message-State: AOAM5334gp9Rc2iY5eHGQXWcChhp9FSfYlTcXi2/exBFL5WJWrwDMhHh
        nQK3NF+4u7zUKZarisoLdI0AeLPh1hI=
X-Google-Smtp-Source: ABdhPJzaCQf43QICcYGVM7in7WXx3txjndXrqdG1LrqMk22l1QTAGG9u4GB/AGTh9uA7c8IvOJnmQw==
X-Received: by 2002:a54:4401:: with SMTP id k1mr12753677oiw.143.1636550996629;
        Wed, 10 Nov 2021 05:29:56 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:bd4f:acc1:b596:17e6])
        by smtp.gmail.com with ESMTPSA id q5sm8629676otg.1.2021.11.10.05.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 05:29:56 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, otavio@ossystems.com.br,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/2] dt/bindings: rtc: rx8900: Add an entry for RX8804
Date:   Wed, 10 Nov 2021 10:29:45 -0300
Message-Id: <20211110132946.514825-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The Epson RX8804 RTC has the same programming model as RV8803 and
RX8900.

Add an entry for it in the binding document.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/rtc/epson,rx8900.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
index 29fe39bb08ad..d12855e7ffd7 100644
--- a/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
+++ b/Documentation/devicetree/bindings/rtc/epson,rx8900.yaml
@@ -15,6 +15,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - epson,rx8804
       - epson,rx8900
       - microcrystal,rv8803
 
-- 
2.25.1

