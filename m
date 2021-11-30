Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4DC463501
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Nov 2021 13:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbhK3NCT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Nov 2021 08:02:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbhK3NCS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 Nov 2021 08:02:18 -0500
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4688DC061574;
        Tue, 30 Nov 2021 04:58:59 -0800 (PST)
Received: by mail-ua1-x92b.google.com with SMTP id n6so41217059uak.1;
        Tue, 30 Nov 2021 04:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vChiFjAXMyEegtfWWoTZ52jVRy8fYqpGSEX/646cgsc=;
        b=VkaVf0Yotf2PkPUhgMpLIuAR2huoz5Vd9wc5SweI7XXEilsZLfV020XrnYeczLt6AK
         UWEoqKYxTsh9A0wEu1GLym2KKhWiaUZLr5GU3mJta4HLu/gjwQhM8CGnMlKtmJ3aTmxi
         bI2RQZp/xRTbGdxnTcZFu2SCzuetHBew77sw5Hcms38ehbY9tJKTywb0sCw3mKahJfa2
         QY2ClEfpPzAe+cvzsXwilLYTrbbTY4D+g+tMn1zqGWUg0o7zEw600PjI84XRM1Nv57O1
         N822+wey9wwTdij0hJvSVbjSkxQiZveYlC3b4vPYxgcDGZojyUW0T4SEMrPMsC1qXm1+
         G6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vChiFjAXMyEegtfWWoTZ52jVRy8fYqpGSEX/646cgsc=;
        b=HiPUJcedCAagPWKhAURYCyOSbuYGRl+WGpylwA5R0kJejTD7FaBHVDPlWsrHZGQwhS
         aPsCAWbRp6931GJu3qxRhV3zaF5mdMwhojgct8WayFKyHubtdYwfiEb3Zrw8MjPGX06U
         RGq7kwZpkFIuPo4jQOBmc+rdLOR09sp0SjkL0pKRHTRHaaWylLFNaN0T6tbLJgkx+Bc4
         337Ewsyn8uFVW57NHElLA3bOL9tBJI7d+VfE1whtLM91+Dnss7gkiuFiNHBuogTqpTmf
         N5h9lj/P/fGSu2xTnvEWtIOZslscTW0n/jAcvG2Ik3LoHYo7VSbZ6rVP5wpPhjwfl7DA
         QJ7g==
X-Gm-Message-State: AOAM533jcOblLFQoajzrqS0MSVArWElU3Ai3+DMDfTnQr6Fs7ZJvFK1U
        piZWI/KdQSWe3RdvrHv+h0Y=
X-Google-Smtp-Source: ABdhPJxeX2f1+zrykNXE/Y+kjj9eBhIRgjeMnjJ44GSMJwM/LW0EqoO0VhhuVVfw4tNcP1bxHSLqMg==
X-Received: by 2002:a05:6102:109b:: with SMTP id s27mr40660042vsr.84.1638277138473;
        Tue, 30 Nov 2021 04:58:58 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:eba2:106:255b:d69c])
        by smtp.gmail.com with ESMTPSA id x9sm10008031vkn.36.2021.11.30.04.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 04:58:58 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     alexandre.belloni@bootlin.com
Cc:     robh+dt@kernel.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, otavio@ossystems.com.br,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/2 RESEND] dt/bindings: rtc: rx8900: Add an entry for RX8804
Date:   Tue, 30 Nov 2021 09:58:29 -0300
Message-Id: <20211130125830.1166194-1-festevam@gmail.com>
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
Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>
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

